<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('employee_families', function (Blueprint $table) {
            $table->id();
            $table->foreignId('employee_id')->constrained()->cascadeOnDelete();
            $table->enum('relation', ['pasangan', 'anak', 'orang_tua', 'saudara', 'lainnya']);
            $table->string('full_name');
            $table->date('birth_date')->nullable();
            $table->string('occupation')->nullable();
            $table->boolean('is_dependent')->default(false); // tanggungan
            $table->string('phone', 20)->nullable();
            $table->text('notes')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('employee_families');
    }
};
