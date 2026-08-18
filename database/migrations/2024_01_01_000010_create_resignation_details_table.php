<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('resignation_details', function (Blueprint $table) {
            $table->id();
            $table->foreignId('employee_id')->constrained()->cascadeOnDelete();
            $table->date('resignation_date'); // Tanggal resmi keluar
            $table->enum('reason', ['resign_mandiri', 'habis_kontrak', 'pensiun', 'phk', 'lainnya']);
            $table->text('reason_detail')->nullable(); // Keterangan tambahan
            $table->enum('clearance_status', ['pending', 'process', 'completed'])->default('pending');
            $table->text('clearance_notes')->nullable();
            $table->date('clearance_date')->nullable(); // Tanggal clearance selesai
            $table->text('notes')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('resignation_details');
    }
};
