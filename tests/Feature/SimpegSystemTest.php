<?php

namespace Tests\Feature;

use App\Models\User;
use App\Models\Employee;
use App\Models\Department;
use App\Models\Position;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class SimpegSystemTest extends TestCase
{
    use RefreshDatabase;

    protected User $admin;
    protected User $hrd;
    protected Department $department;
    protected Position $position;

    protected function setUp(): void
    {
        parent::setUp();

        $this->admin = User::create([
            'name'      => 'Admin IT Test',
            'email'     => 'admin.test@simpeg.local',
            'password'  => bcrypt('password'),
            'role'      => 'admin_it',
            'is_active' => true,
        ]);

        $this->hrd = User::create([
            'name'      => 'HRD Test',
            'email'     => 'hrd.test@simpeg.local',
            'password'  => bcrypt('password'),
            'role'      => 'hrd',
            'is_active' => true,
        ]);

        $this->department = Department::create([
            'name' => 'IT Department',
            'code' => 'IT',
            'is_active' => true,
        ]);

        $this->position = Position::create([
            'name' => 'Software Engineer',
            'code' => 'SWE',
            'department_id' => $this->department->id,
            'is_active' => true,
        ]);
    }

    /** @test */
    public function user_can_login_with_correct_credentials()
    {
        $response = $this->post('/login', [
            'email' => 'admin.test@simpeg.local',
            'password' => 'password',
        ]);

        $response->assertRedirect('/dashboard');
        $this->assertAuthenticatedAs($this->admin);
    }

    /** @test */
    public function hrd_can_create_a_new_employee()
    {
        $this->actingAs($this->hrd);

        $employeeData = [
            'nik'               => 'EMP-TEST-001',
            'full_name'         => 'Budi Test',
            'gender'            => 'L',
            'employment_status' => 'tetap',
            'department_id'     => $this->department->id,
            'position_id'       => $this->position->id,
            'join_date'         => '2024-01-01',
        ];

        $response = $this->post(route('employees.store'), $employeeData);

        $this->assertDatabaseHas('employees', [
            'nik' => 'EMP-TEST-001',
            'full_name' => 'Budi Test',
            'status' => 'active',
        ]);
    }

    /** @test */
    public function employee_can_be_resigned_and_archived_via_soft_delete()
    {
        $this->actingAs($this->hrd);

        $employee = Employee::create([
            'nik' => 'EMP-TEST-002',
            'full_name' => 'Siti Resign Test',
            'employment_status' => 'kontrak',
            'department_id' => $this->department->id,
            'status' => 'active',
        ]);

        $response = $this->post(route('employees.resign', $employee), [
            'resignation_date' => '2024-06-30',
            'reason'           => 'resign_mandiri',
            'clearance_status' => 'completed',
        ]);

        $this->assertSoftDeleted('employees', ['id' => $employee->id]);
        $this->assertDatabaseHas('resignation_details', [
            'employee_id' => $employee->id,
            'reason'      => 'resign_mandiri',
        ]);
    }

    /** @test */
    public function hrd_can_restore_resigned_employee()
    {
        $this->actingAs($this->hrd);

        $employee = Employee::create([
            'nik' => 'EMP-TEST-003',
            'full_name' => 'Andi Restore Test',
            'employment_status' => 'tetap',
            'status' => 'inactive',
        ]);
        $employee->delete();

        $response = $this->post(route('resigned.restore', $employee->id));

        $this->assertDatabaseHas('employees', [
            'id' => $employee->id,
            'status' => 'active',
            'deleted_at' => null,
        ]);
    }

    /** @test */
    public function non_admin_cannot_access_user_management()
    {
        $this->actingAs($this->hrd);

        $response = $this->get(route('users.index'));

        $response->assertStatus(403);
    }

    /** @test */
    public function admin_can_access_user_management()
    {
        $this->actingAs($this->admin);

        $response = $this->get(route('users.index'));

        $response->assertStatus(200);
    }

    /** @test */
    public function hrd_can_update_resignation_details()
    {
        $this->actingAs($this->hrd);

        $employee = Employee::create([
            'nik' => 'EMP-TEST-004',
            'full_name' => 'Budi Edit Resign',
            'employment_status' => 'tetap',
            'status' => 'inactive',
        ]);
        $employee->delete();

        $response = $this->put(route('resigned.update-resignation', $employee->id), [
            'resignation_date' => '2024-08-01',
            'reason'           => 'pensiun',
            'reason_detail'    => 'Pensiun dini sukarela',
            'clearance_status' => 'completed',
            'clearance_notes'  => 'Semua beres',
            'deleted_at'       => '2024-08-02',
        ]);

        $response->assertRedirect(route('resigned.show', $employee->id));

        $this->assertDatabaseHas('resignation_details', [
            'employee_id' => $employee->id,
            'reason'      => 'pensiun',
            'reason_detail' => 'Pensiun dini sukarela',
            'clearance_notes' => 'Semua beres',
        ]);

        $this->assertDatabaseHas('employees', [
            'id' => $employee->id,
            'deleted_at' => '2024-08-02 00:00:00',
        ]);
    }

    /** @test */
    public function user_can_export_active_employees()
    {
        $this->actingAs($this->hrd);

        // Test Excel export
        $responseExcel = $this->get(route('employees.export', ['format' => 'excel']));
        $responseExcel->assertStatus(200);
        $responseExcel->assertHeader('content-type', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');

        // Test PDF export
        $responsePdf = $this->get(route('employees.export', ['format' => 'pdf']));
        $responsePdf->assertStatus(200);
        $responsePdf->assertHeader('content-type', 'application/pdf');
    }

    /** @test */
    public function user_can_download_individual_employee_cv()
    {
        $this->actingAs($this->hrd);

        $employee = Employee::create([
            'nik' => 'EMP-TEST-005',
            'full_name' => 'Budi CV Test',
            'employment_status' => 'tetap',
            'status' => 'active',
        ]);

        $response = $this->get(route('employees.pdf', $employee));
        $response->assertStatus(200);
        $response->assertHeader('content-type', 'application/pdf');
        $response->assertHeader('content-disposition', 'attachment; filename=CV-Budi_CV_Test.pdf');
    }

    /** @test */
    public function hrd_can_update_system_settings()
    {
        $this->actingAs($this->hrd);

        $response = $this->put(route('settings.update'), [
            'app_name' => 'NEW-APP-NAME',
            'app_description' => 'New Description Text',
            'institution_name' => 'New Institution Name',
        ]);

        $response->assertRedirect(route('settings.index'));

        $this->assertDatabaseHas('settings', [
            'key' => 'app_name',
            'value' => 'NEW-APP-NAME',
        ]);

        $this->assertDatabaseHas('settings', [
            'key' => 'app_description',
            'value' => 'New Description Text',
        ]);

        $this->assertDatabaseHas('settings', [
            'key' => 'institution_name',
            'value' => 'New Institution Name',
        ]);
    }

    /** @test */
    public function hrd_can_upload_and_download_employee_document()
    {
        \Illuminate\Support\Facades\Storage::fake('local');
        $this->actingAs($this->hrd);

        $employee = Employee::create([
            'nik' => 'EMP-DOC-TEST',
            'full_name' => 'Budi Document Test',
            'employment_status' => 'tetap',
            'status' => 'active',
        ]);

        $file = \Illuminate\Http\UploadedFile::fake()->create('ktp.pdf', 500);

        $responseUpload = $this->post(route('documents.store', $employee->id), [
            'type' => 'ktp',
            'name' => 'KTP Budi',
            'file' => $file,
        ]);

        $responseUpload->assertRedirect();
        
        $document = $employee->documents()->first();
        $this->assertNotNull($document);
        $this->assertEquals('KTP Budi', $document->name);
        
        // Assert file exists on secure local storage
        \Illuminate\Support\Facades\Storage::disk('local')->assertExists($document->file_path);

        // Test secure download
        $responseDownload = $this->get(route('documents.download', $document));
        $responseDownload->assertStatus(200);

        // Test unauthenticated access block
        auth()->logout();
        $responseGuest = $this->get(route('documents.download', $document));
        $responseGuest->assertRedirect('/login');
    }

    /** @test */
    public function hrd_can_filter_employees_by_dosen_and_tendik_type()
    {
        $this->actingAs($this->hrd);

        $dosen = Employee::create([
            'nik'               => 'EMP-DOSEN-TEST',
            'full_name'         => 'Dr. Dosen Test',
            'employee_type'     => 'dosen',
            'nidn'              => '0701020304',
            'employment_status' => 'tetap',
            'status'            => 'active',
        ]);

        $tendik = Employee::create([
            'nik'               => 'EMP-TENDIK-TEST',
            'full_name'         => 'Staf Tendik Test',
            'employee_type'     => 'tendik',
            'employment_status' => 'tetap',
            'status'            => 'active',
        ]);

        // Filter Dosen
        $responseDosen = $this->get(route('employees.index', ['type' => 'dosen']));
        $responseDosen->assertStatus(200);
        $responseDosen->assertSee('Dr. Dosen Test');
        $responseDosen->assertDontSee('Staf Tendik Test');

        // Filter Tendik
        $responseTendik = $this->get(route('employees.index', ['type' => 'tendik']));
        $responseTendik->assertStatus(200);
        $responseTendik->assertSee('Staf Tendik Test');
        $responseTendik->assertDontSee('Dr. Dosen Test');
    }

    /** @test */
    public function hrd_can_create_and_view_dosen_with_academic_fields()
    {
        $this->actingAs($this->hrd);

        $dosenData = [
            'nik'                 => 'DOSEN-TEST-99',
            'full_name'           => 'Ns. Pengajar Unggul, M.Kep',
            'employee_type'       => 'dosen',
            'nidn'                => '0711223344',
            'nuptk'               => '9988776655443322',
            'functional_position' => 'Lektor (200 kum)',
            'specialization'      => 'Keperawatan Medikal Bedah',
            'serdos'              => 'Lulus 2023',
            'employment_status'   => 'tetap',
            'department_id'       => $this->department->id,
            'position_id'         => $this->position->id,
        ];

        $response = $this->post(route('employees.store'), $dosenData);
        $response->assertRedirect();

        $dosen = Employee::where('nik', 'DOSEN-TEST-99')->first();
        $this->assertNotNull($dosen);
        $this->assertEquals('dosen', $dosen->employee_type);
        $this->assertEquals('0711223344', $dosen->nidn);
        $this->assertEquals('Lektor (200 kum)', $dosen->functional_position);

        // View show page
        $showResponse = $this->get(route('employees.show', $dosen));
        $showResponse->assertStatus(200);
        $showResponse->assertSee('Informasi Akademik Dosen');
        $showResponse->assertSee('0711223344');
        $showResponse->assertSee('Lektor (200 kum)');
    }
}
