<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('personas', function (Blueprint $table) {
            $table->id('id_personas');
            $table->string('nombre', 50);
            $table->string('apellido', 50);
            $table->string ('cedula', 50);
            $table->dateTime('fecha_nacimiento');
            $table->string('estado');
            $table->unsignedBigInteger('pais_id')->nullable();
            $table->foreign('pais_id')
            ->references('id_pais')
            ->on('pais')
            ->onDelete("cascade")
            ->onUpdate("cascade");
            $table->unsignedBigInteger('usuario_id')->nullable();
            $table->foreign('usuario_id')
            ->references('id_usuario')
            ->on('users')
            ->onDelete("cascade")
            ->onUpdate("cascade");
            $table->timestamp('created_at')->default(DB::raw('CURRENT_TIMESTAMP'));
            $table->dateTime('updated_at')->default(DB::raw('CURRENT_TIMESTAMP'));
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('personas');
    }
};
