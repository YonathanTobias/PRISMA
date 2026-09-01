<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('employees', function (Blueprint $table) {
            $table->enum('employee_type', ['dosen', 'tendik'])->default('tendik')->after('full_name');
            $table->string('religion')->nullable()->after('gender');
            $table->string('nidn')->nullable()->after('employee_type');
            $table->string('nuptk')->nullable()->after('nidn');
            $table->string('functional_position')->nullable()->after('position_id');
            $table->string('specialization')->nullable()->after('functional_position');
            $table->string('rank_group')->nullable()->after('specialization');
            $table->string('serdos')->nullable()->after('rank_group');
            $table->string('pekerti')->nullable()->after('serdos');
            $table->string('applied_approach')->nullable()->after('pekerti');
            $table->string('inpassing')->nullable()->after('applied_approach');
            $table->string('sk_dosen_tetap')->nullable()->after('inpassing');
        });
    }

    public function down(): void
    {
        Schema::table('employees', function (Blueprint $table) {
            $table->dropColumn([
                'employee_type',
                'religion',
                'nidn',
                'nuptk',
                'functional_position',
                'specialization',
                'rank_group',
                'serdos',
                'pekerti',
                'applied_approach',
                'inpassing',
                'sk_dosen_tetap',
            ]);
        });
    }
};
