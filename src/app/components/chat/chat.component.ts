import { CommonModule } from '@angular/common';
import { Component , ViewChild, ElementRef, AfterViewInit, OnInit} from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';

//Estructura de como esta conformado el mensaje (tiempo y texto)
interface Message { 
  timestamp: string;
  text: string;
}

@Component({
  selector: 'app-chat',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './chat.component.html',
  styleUrl: './chat.component.css'
})

export class ChatComponent implements AfterViewInit, OnInit {

  constructor(private router: Router) {}

  //Funcion para navegar a la ruta mains
  goToMain() {
    this.router.navigate(['/main']);
  }

  mensajes: Message[] = [];
  nuevoMensaje: string = '';

  @ViewChild('contenedorMensaje') contenedorMensaje!: ElementRef<HTMLDivElement>;
  
  //Se ejecuta al iniciar el componente, lo que hace cargar los mensajes guardados en el LocalStorage
  ngOnInit(): void {
    this.loadMessages(); 
  }
  //Scroll luego de que inicialize la vista completa
  ngAfterViewInit() {
    this.scrollToBottom(); 
  }
  
  //Funcion para enviar y guardar los mensajes
  sendMessage() {
    //Crea un nuevo mensaje y lo añade al arreglo de mensajes
    if (this.nuevoMensaje.trim() !== '') {
      const timestamp = new Date().toLocaleTimeString();
      this.mensajes.push({ timestamp, text: this.nuevoMensaje});
      this.nuevoMensaje = '';
      this.saveMessages();
      this.scrollToBottom();
    }
  }

  //Limpia los mensajes del chat
  clearChat() {
    this.mensajes = [];
    localStorage.removeItem('chatMessages');
    this.scrollToBottom();
  }

  // Funcion para desplazar automaticamente hacia abajo 
  private scrollToBottom() {
    if (this.contenedorMensaje) {
      setTimeout(() => {
        this.contenedorMensaje.nativeElement.scrollTop = this.contenedorMensaje.nativeElement.scrollHeight;
      }, 0);
    } 
  }

  // Guarda los mensajes en el LocalStorage
  private saveMessages() {
    localStorage.setItem('chatMessages', JSON.stringify(this.mensajes));
  }

  // Carga los mensajes del LocalStorage (si es que ya existen mensajes guardados)
  private loadMessages() {
    const savedMessages = localStorage.getItem('chatMessages');
    if(savedMessages) {
      this.mensajes = JSON.parse(savedMessages);
    }

    setTimeout(() => {
      this.scrollToBottom();
    }, 0);
  }

}
