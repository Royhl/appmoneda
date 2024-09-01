<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ciudad extends Model
{
    use HasFactory;
   
    // desde aqui se renombra la tabla ciudad dado que en laravel agrega una s al final porque espera el nombre de las tablas en ingles
    protected $table = 'ciudad';


}
