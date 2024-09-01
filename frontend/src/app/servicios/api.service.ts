import { Injectable } from '@angular/core';
import { environment } from '../../environment/environment';
import { HttpClient , HttpHeaders, HttpRequest} from '@angular/common/http';
import { firstValueFrom } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ApiService {

  constructor(private http: HttpClient) { }

  consultarPrueba(): Promise<any> {
    return firstValueFrom(this.http.get(environment.urlApi + 'prueba'));
  }

  consultarCiudades(): Promise<any> {
    return firstValueFrom(this.http.get(environment.urlApi + 'consultarciudades'));
  }

  consultarMonedaSimbolo( id: string): Promise<any> {
    return firstValueFrom(this.http.get(environment.urlApi + 'consultarmoneda/'+id));
  }

  consultarClima( nombre: string): Promise<any> {
    return firstValueFrom(this.http.get(environment.apicli + nombre));
  }

  convertirMoneda( codigoMoneda: string): Promise<any> {
    return firstValueFrom(this.http.get(environment.apicambio + codigoMoneda));
  }


}
