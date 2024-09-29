import { BrowserModule } from '@angular/platform-browser';
import { Component } from '@angular/core';
import { ApiService } from '../../servicios/api.service';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';


@Component({
  selector: 'app-home',
  standalone: true,
  imports:[
    CommonModule,
    FormsModule
  ],
  templateUrl: './home.component.html',
  styleUrl: './home.component.css'
})
export class HomeComponent {

  conexion: any = [];
  listaCiudad: any = [];
  nombreCiudad: string = '';
  dinero: number = 0;
  mostrardetalle: boolean = false;
  contenedor: number = 0;
  resMoneda: any = [];
  muestraclima: boolean = false;
  datosClima: any = [];
  mostrarconversion: boolean = false;
  valorconversion: number = 0;
  tasa: number = 0;

  constructor (private servicios: ApiService){

    this.consultarCiudades();
    if ("geolocation" in navigator) {
      console.log('estoy antes de la funcion')
      navigator.geolocation.getCurrentPosition((position) => {
        console.log('estoy ingresando',position.coords.latitude, position.coords.longitude);
      });
    } else {
      /* geolocation IS NOT available */
    }
  }

  consultarCiudades(){
    this.servicios.consultarCiudades().then(res =>{
        this.listaCiudad = res;
    }).catch(error=>{
      console.error(error);
    });
  }
  //que se encargara de consumir el servicio 

  consumirServicio(){
    this.servicios.consultarPrueba().then(respuesta =>{
      if(respuesta){
        this.conexion = respuesta.mensaje;
      }
    }).catch(error =>{
      console.error(error);
    })
  }

  consultarMonedaCiudad(){
     
      this.servicios.consultarMonedaSimbolo(this.nombreCiudad).then(res=>{
          if(res){
            this.resMoneda = res;
            this.mostrardetalle = true;
            this.consultarClima(this.nombreCiudad); // se hace el llamado una vez se ejecute el select para que muestre el clima
          }
      }).catch(error =>{
      console.error(error);
    });
  }

  consultarClima(nombreciudad: string){
      this.servicios.consultarClima(nombreciudad).then( res =>{
        this.datosClima = res;
        this.muestraclima = true;
        console.log(this.datosClima);
      }).catch(error =>{
        console.error(error);
      });
  }


  convertirMoneda(){

    this.servicios.convertirMoneda(this.resMoneda.codigo_moneda).then(res=>{
     
      let claves = Object.keys( res.result); 
        for(let i=0; i< claves.length; i++){
        let clave = claves[i];
        this.tasa =  res.result[clave];
        this.valorconversion = (this.tasa * this.dinero);
       
      }
      this.mostrarconversion = true;
    }).catch(error =>{
        console.error(error);
    });

  }

}
