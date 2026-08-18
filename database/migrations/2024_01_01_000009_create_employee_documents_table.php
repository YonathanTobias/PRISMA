<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('employee_documents', function (Blueprint $table) {
            $table->id();
            $table->foreignId('employee_id')->constrained()->cascadeOnDelete();
            $table->enum('type', ['ktp', 'npwp', 'bpjs_kesehatan', 'bpjs_ketenagakerjaan', 'ijazah', 'kontrak_kerja', 'sk_jabatan', 'foto', 'lainnya']);
            $table->string('name'); // Nama dokumen
            $table->string('file_path'); // Path file
            $table->string('file_name'); // Nama file asli
            $table->string('file_size')->nullable();
            $table->string('file_type')->nullable(); // MIME type
            $table->date('issued_date')->nullable(); // Tanggal terbit
            $table->date('expiry_date')->nullable(); // Tanggal kedaluwarsa
            $table->text('notes')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('employee_documents');
    }
};
