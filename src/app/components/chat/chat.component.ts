import { CommonModule } from '@angular/common';
import { Component , ViewChild, ElementRef, AfterViewInit} from '@angular/core';
import { FormsModule } from '@angular/forms';

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

export class ChatComponent implements AfterViewInit{
  mensajes: Message[] = [];
  nuevoMensaje: string = '';

  @ViewChild('contenedorMensaje') contenedorMensaje!: ElementRef<HTMLDivElement>;
  
  ngAfterViewInit() {
    this.scrollToBottom();
  }
  
  sendMessage() {
    if (this.nuevoMensaje.trim() !== '') {
      const timestamp = new Date().toLocaleTimeString();
      this.mensajes.push({ timestamp, text: this.nuevoMensaje});
      this.nuevoMensaje = '';
      this.scrollToBottom();
    }
  }

  private scrollToBottom() {
    if (this.contenedorMensaje) {
      setTimeout(() => {
        this.contenedorMensaje.nativeElement.scrollTop = this.contenedorMensaje.nativeElement.scrollHeight;
      });
    }
  }
}
