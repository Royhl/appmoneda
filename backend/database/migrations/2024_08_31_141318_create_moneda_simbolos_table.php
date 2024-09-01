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
        Schema::create('moneda_simbolos', function (Blueprint $table) {
            $table->id('id_monedasimbolo');
            $table->string('simbolo', 5);
            $table->unsignedBigInteger('pais_id')->nullable();
            $table->foreign('pais_id')
            ->references('id_pais')
            ->on('pais')
            ->onDelete("cascade")
            ->onUpdate("cascade");
            $table->string('nombre_monedad');
            $table->string('codigo_moneda');
            $table->timestamp('created_at')->default(DB::raw('CURRENT_TIMESTAMP'));
            $table->dateTime('updated_at')->default(DB::raw('CURRENT_TIMESTAMP'));
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('moneda_simbolos');
    }
};
