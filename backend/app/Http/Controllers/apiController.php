<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ciudad;
use App\Models\pais;

class apiController extends Controller
{

    //funcion para probar la conexion con angular

    public function prueba(){
        return response()->json(['mensaje' => 'hola rolando']);
    }

    
    function  consultarCiudades(){
        $list_ciudad = ciudad::select('id_ciudad', 'nombre')
        ->get();

        return response()->json($list_ciudad);
    }

        /*se esta realizando las busquedas usando  el proceso eloquen que nos da de forma dinamica los resultados de la base de datos y  los ::
             se usa el scop y se devuelve el json*/
    function consultarMonedaSimbolo($ciudad){
        $listado =  Pais::select('simbolo', 'nombre_moneda', 'codigo_moneda')
        ->join('ciudad as city', 'pais.id_pais', 'city.pais_id')
        ->join('moneda_simbolos as money', 'money.pais_id', 'pais.id_pais')
        ->where('city.nombre', $ciudad)
        ->first();

        return response()->json($listado);
    }
    
    
}
