import {Injectable} from '@angular/core';
import {Http} from '@angular/http';
import 'rxjs/add/operator/toPromise'
import {Wine} from "./wine";
import { environment } from './../../environments/environment';

@Injectable()
export class WineService {

    constructor(private http: Http) {
    }

    getWines(): Promise<Wine[]> {
        return this.http.get(`${environment.apiUrl}/wines`)
            .toPromise()
            .then(response => {
                return response.json() as Wine[];
            })
    }
}
