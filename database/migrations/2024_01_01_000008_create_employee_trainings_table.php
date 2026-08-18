<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('employee_trainings', function (Blueprint $table) {
            $table->id();
            $table->foreignId('employee_id')->constrained()->cascadeOnDelete();
            $table->enum('type', ['pelatihan', 'sertifikasi', 'lisensi', 'workshop', 'seminar', 'lainnya']);
            $table->string('name'); // Nama pelatihan/sertifikasi
            $table->string('organizer')->nullable(); // Penyelenggara
            $table->date('start_date')->nullable();
            $table->date('end_date')->nullable();
            $table->date('expiry_date')->nullable(); // Kedaluwarsa sertifikat
            $table->string('certificate_number')->nullable();
            $table->string('attachment')->nullable(); // File sertifikat
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('employee_trainings');
    }
};
