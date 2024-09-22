import { Component } from '@angular/core';
import { Title } from '@angular/platform-browser';
import { Router, RouterOutlet } from '@angular/router';

@Component({
  selector: 'login-component',
  standalone: true,
  imports: [RouterOutlet],
  templateUrl: './login.component.html',
  styleUrl: './login.component.css'
  
})

export class LoginComponent {
  constructor(private router: Router) {}

  isLoggedIn = false;

  toChat() {
    this.isLoggedIn = true;
    this.router.navigate(['/chat']);
  }

  goToMain(){
    this.router.navigate(['/main']);
  }
}


