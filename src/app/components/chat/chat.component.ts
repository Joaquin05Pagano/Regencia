import { CommonModule } from '@angular/common';
import { Component , ViewChild, ElementRef, AfterViewInit, OnInit} from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';

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

  goToMain() {
    this.router.navigate(['/main']);
  }

  mensajes: Message[] = [];
  nuevoMensaje: string = '';

  @ViewChild('contenedorMensaje') contenedorMensaje!: ElementRef<HTMLDivElement>;
  
  ngOnInit(): void {
    this.loadMessages();
  }

  ngAfterViewInit() {
    this.scrollToBottom();
  }
  
  sendMessage() {
    if (this.nuevoMensaje.trim() !== '') {
      const timestamp = new Date().toLocaleTimeString();
      this.mensajes.push({ timestamp, text: this.nuevoMensaje});
      this.nuevoMensaje = '';
      this.saveMessages();
      this.scrollToBottom();
    }
  }

  clearChat() {
    this.mensajes = [];
    localStorage.removeItem('chatMessages');
    this.scrollToBottom();
  }

  private scrollToBottom() {
    if (this.contenedorMensaje) {
      setTimeout(() => {
        this.contenedorMensaje.nativeElement.scrollTop = this.contenedorMensaje.nativeElement.scrollHeight;
      }, 0);
    } 
  }

  private saveMessages() {
    localStorage.setItem('chatMessages', JSON.stringify(this.mensajes));
  }

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
