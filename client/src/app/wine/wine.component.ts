import {Component, OnInit} from '@angular/core';
import {Wine} from "./wine";
import {WineService} from "./wine.service";

@Component({
    selector: 'app-wine',
    templateUrl: './wine.component.html',
    styleUrls: ['./wine.component.scss']
})
export class WineComponent implements OnInit {
    wines: Wine[];

    constructor(private wineService: WineService) {
    }

    ngOnInit(): void {
        this.getWines()
    }

    getWines(): void {
        this.wineService.getWines().then(wines => {
            this.wines = wines
        })
    }
}
