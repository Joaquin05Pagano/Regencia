import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-informe',
  standalone: true,
  imports: [],
  templateUrl: './informe.component.html',
  styleUrl: './informe.component.css'
})
export class InformeComponent {

  constructor(private router: Router) {}

  goToMain() {
    this.router.navigate(['/main']);
  }

  imprimirInforme() {
    window.print();
  }
}
