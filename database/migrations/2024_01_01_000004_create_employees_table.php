<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('employees', function (Blueprint $table) {
            $table->id();
            $table->string('nik')->nullable()->unique(); // Nomor Induk Karyawan
            $table->string('full_name');
            $table->string('birth_place')->nullable();
            $table->date('birth_date')->nullable();
            $table->enum('gender', ['L', 'P'])->nullable(); // L=Laki-laki, P=Perempuan
            $table->text('address')->nullable();
            $table->string('phone', 20)->nullable();
            $table->string('email')->nullable();
            $table->string('photo')->nullable();

            // Informasi Kepegawaian
            $table->enum('employment_status', ['tetap', 'kontrak', 'magang', 'probation'])->default('tetap');
            $table->foreignId('department_id')->nullable()->constrained()->nullOnDelete();
            $table->foreignId('position_id')->nullable()->constrained()->nullOnDelete();
            $table->foreignId('supervisor_id')->nullable()->constrained('employees')->nullOnDelete();
            $table->string('work_location')->nullable();
            $table->date('join_date')->nullable();
            $table->date('contract_end_date')->nullable();

            // Status
            $table->enum('status', ['active', 'inactive'])->default('active');

            // Data Pernikahan
            $table->enum('marital_status', ['belum_menikah', 'menikah', 'cerai', 'duda_janda'])->nullable();

            $table->text('notes')->nullable();
            $table->timestamps();
            $table->softDeletes();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('employees');
    }
};
