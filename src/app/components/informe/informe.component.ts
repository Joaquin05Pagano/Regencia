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

  // Dependencia para poder navegar entre rutas
  constructor(private router: Router) {}

  //funcion para navegar a la ruta main
  goToMain() {
    this.router.navigate(['/main']);
  }
  
  imprimirInforme() {
    window.print();
  }
}
