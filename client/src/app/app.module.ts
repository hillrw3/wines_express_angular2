import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { AppRoutingModule } from './app-routing.module';

import { AppComponent } from './app.component';
import { WineComponent } from './wine/wine.component';
import {WineService} from "./wine/wine.service";

@NgModule({
  declarations: [
    AppComponent,
    WineComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    AppRoutingModule
  ],
  providers: [WineService],
  bootstrap: [AppComponent]
})
export class AppModule { }
