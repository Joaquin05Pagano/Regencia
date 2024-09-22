import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { LoginComponent } from "./components/login/login.component";
import { ChatComponent } from './components/chat/chat.component';
import { CommonModule } from '@angular/common';
import { InformeComponent } from "./components/informe/informe.component";

@Component({
    selector: 'app-root',
    standalone: true,
    templateUrl: './app.component.html',
    styleUrl: './app.component.css',
    imports: [RouterOutlet, LoginComponent, ChatComponent, CommonModule, InformeComponent]
})

export class AppComponent {
  title = 'Regencia'
  isLoggedIn = false
}