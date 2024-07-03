import { CommonModule } from '@angular/common';
import { Component , ViewChild, ElementRef, AfterViewInit} from '@angular/core';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-chat',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './chat.component.html',
  styleUrl: './chat.component.css'
})
export class ChatComponent implements AfterViewInit{
  mensajes: string[] = [];
  nuevoMensaje: string = '';

  @ViewChild('contenedorMensaje') contenedorMensaje!: ElementRef<HTMLDivElement>;
  
  ngAfterViewInit() {
    this.scrollToBottom();
  }
  
  sendMessage() {
    if (this.nuevoMensaje.trim() !== '') {
      this.mensajes.push(this.nuevoMensaje);
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
