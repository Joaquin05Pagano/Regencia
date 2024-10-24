import { Routes } from '@angular/router';
import { ChatComponent } from './components/chat/chat.component';
import { LoginComponent } from './components/login/login.component';
import { InformeComponent } from './components/informe/informe.component';
import { MainComponent } from './components/main/main.component';

// Configuracion de todas las rutas para su respectivo componente
export const routes: Routes = [
    { path: '', redirectTo: '/main', pathMatch: 'full'}, //En este caso si la ruta esta vacio, te redirige a la pagina principal
    { path: 'main', component: MainComponent},
    { path: 'chat', component: ChatComponent},
    { path: 'login', component: LoginComponent},
    { path: 'informe', component: InformeComponent}
];





