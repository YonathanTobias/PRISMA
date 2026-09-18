<?php

namespace Tests\Feature;

use App\Models\User;
use App\Models\Employee;
use App\Models\EmployeeDocument;
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

    /** @test */
    public function hrd_can_manage_custom_document_types_and_upload()
    {
        $this->actingAs($this->hrd);

        // 1. Create custom document type
        $response = $this->post(route('document-types.store'), [
            'name'        => 'Surat Tanda Registrasi (STR) Ners',
            'code'        => 'str_ners',
            'description' => 'Surat registrasi tenaga kesehatan',
        ]);
        $response->assertRedirect();

        $docType = \App\Models\DocumentType::where('code', 'str_ners')->first();
        $this->assertNotNull($docType);
        $this->assertEquals('Surat Tanda Registrasi (STR) Ners', $docType->name);

        // 2. Upload document using this custom type
        \Illuminate\Support\Facades\Storage::fake('local');
        $file = \Illuminate\Http\UploadedFile::fake()->create('str_surat.pdf', 500, 'application/pdf');

        $emp = Employee::create([
            'nik'               => 'EMP-DOC-TEST',
            'full_name'         => 'Test Suster Ners',
            'employment_status' => 'tetap',
            'status'            => 'active',
        ]);

        $uploadResponse = $this->post(route('documents.store', $emp), [
            'type'        => 'str_ners',
            'name'        => 'STR Resmi 2026',
            'file'        => $file,
            'issued_date' => '2026-01-01',
        ]);
        $uploadResponse->assertRedirect();

        $doc = \App\Models\EmployeeDocument::where('employee_id', $emp->id)->where('type', 'str_ners')->first();
        $this->assertNotNull($doc);
        $this->assertEquals('Surat Tanda Registrasi (STR) Ners', $doc->type_label);

        // 4. Try to delete document type that is in use (should fail with error)
        $deleteResponse = $this->delete(route('document-types.destroy', $docType));
        $deleteResponse->assertSessionHas('error');
        $this->assertDatabaseHas('document_types', ['id' => $docType->id]);
    }

    /** @test */
    public function file_compression_service_optimizes_images_and_documents_correctly()
    {
        $this->actingAs($this->hrd);
        \Illuminate\Support\Facades\Storage::fake('local');
        \Illuminate\Support\Facades\Storage::fake('public');

        $emp = Employee::create([
            'nik'               => 'EMP-COMPRESS-01',
            'full_name'         => 'Test Compression User',
            'employment_status' => 'tetap',
            'status'            => 'active',
        ]);

        // 1. Test Large Image Upload for Employee Photo
        $image = \Illuminate\Http\UploadedFile::fake()->image('profile_photo.jpg', 2400, 1800);
        $responsePhoto = $this->post(route('employees.store'), [
            'nik'               => 'EMP-PHOTO-TEST',
            'full_name'         => 'Photo Compress User',
            'employment_status' => 'tetap',
            'photo'             => $image,
        ]);
        $responsePhoto->assertRedirect();
        $savedEmployee = Employee::where('nik', 'EMP-PHOTO-TEST')->first();
        $this->assertNotNull($savedEmployee->photo);
        \Illuminate\Support\Facades\Storage::disk('public')->assertExists($savedEmployee->photo);

        // 2. Test Document Upload with PDF
        $pdfFile = \Illuminate\Http\UploadedFile::fake()->create('sk_pengangkatan.pdf', 300, 'application/pdf');
        $responseDoc = $this->post(route('documents.store', $emp), [
            'type' => 'sk',
            'name' => 'SK Pengangkatan 2026',
            'file' => $pdfFile,
        ]);
        $responseDoc->assertRedirect();

        $doc = EmployeeDocument::where('employee_id', $emp->id)->where('type', 'sk')->first();
        $this->assertNotNull($doc);
        \Illuminate\Support\Facades\Storage::disk('local')->assertExists($doc->file_path);
        $this->assertNotEmpty($doc->file_size);

        // 3. Test FileCompressionService directly
        $service = app(\App\Services\FileCompressionService::class);
        $this->assertTrue($service->isImage('image/jpeg', 'jpg'));
        $this->assertTrue($service->isPdf('application/pdf', 'pdf'));
        $this->assertFalse($service->isPdf('image/jpeg', 'jpg'));
        $this->assertEquals('1.50 MB', $service->formatFileSize(1572864));
        $this->assertEquals('500.00 KB', $service->formatFileSize(512000));
    }

    /** @test */
    public function hrd_can_batch_upload_multiple_documents_with_auto_detection()
    {
        $this->actingAs($this->hrd);
        \Illuminate\Support\Facades\Storage::fake('local');

        $emp = Employee::create([
            'nik'               => 'EMP-BATCH-01',
            'full_name'         => 'Batch User Test',
            'employment_status' => 'tetap',
            'status'            => 'active',
        ]);

        $file1 = \Illuminate\Http\UploadedFile::fake()->create('KTP_Emy.pdf', 150, 'application/pdf');
        $file2 = \Illuminate\Http\UploadedFile::fake()->create('Ijazah_S2_Emy.pdf', 300, 'application/pdf');
        $file3 = \Illuminate\Http\UploadedFile::fake()->create('SK_Dosen_Tetap.pdf', 200, 'application/pdf');

        $response = $this->post(route('documents.store-batch', $emp), [
            'documents' => [
                [
                    'file' => $file1,
                    'name' => 'KTP Emy',
                    'type' => 'ktp',
                ],
                [
                    'file' => $file2,
                    'name' => 'Ijazah S2 Emy',
                    'type' => 'ijazah',
                ],
                [
                    'file' => $file3,
                    'name' => 'SK Dosen Tetap',
                    'type' => 'sk',
                ],
            ]
        ]);

        $response->assertRedirect();
        $this->assertEquals(3, $emp->documents()->count());
        $this->assertDatabaseHas('employee_documents', [
            'employee_id' => $emp->id,
            'name'        => 'KTP Emy',
            'type'        => 'ktp',
        ]);
        $this->assertDatabaseHas('employee_documents', [
            'employee_id' => $emp->id,
            'name'        => 'Ijazah S2 Emy',
            'type'        => 'ijazah',
        ]);
        $this->assertDatabaseHas('employee_documents', [
            'employee_id' => $emp->id,
            'name'        => 'SK Dosen Tetap',
            'type'        => 'sk',
        ]);
    }
}



