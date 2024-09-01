<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


/**
     * API REST PARA LA APLICACIÓN MOVIL - 30/08/2024
     * @author Rolando Hernández
     * Access-Control-Allow-Origin, permitirá comunicación entre diferentes serves u origines
     * Access-Control-Allow-Headers, indicará los encabezados HTTP que se podrán usar en la solicitud
     * Access-Control-Allow-Methods, indica los métodos HTTP que se pueden usar en la solicitud
     * Nota: para solicitudes POST, se debe enviar el header de Authorization, y debe estar registrado en el Access-Control-Allow-Headers
     * Nota: para las solicitudes GET, se debe enviar como parámetro Query String el token de acceso
     * 
**/

//header('Access-Control-Allow-Origin: *'); 
header('Access-Control-Allow-Methods: POST, GET');
header("Access-Control-Allow-Headers: Origin, X-Api-Key, X-Requested-With, Content-Type, Accept, Authorization");


/*los entpoint*/

Route::get('/prueba', 'App\Http\Controllers\apiController@prueba');
Route::get('/consultarciudades', 'App\Http\Controllers\apiController@consultarCiudades');
Route::get('/consultarmoneda/{ciudad}', 'App\Http\Controllers\apiController@consultarMonedaSimbolo');

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
