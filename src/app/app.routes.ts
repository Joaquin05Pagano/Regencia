import { Routes, RouterModule } from '@angular/router';
import { ChatComponent } from './components/chat/chat.component';
import { LoginComponent } from './components/login/login.component';
import { InformeComponent } from './components/informe/informe.component';
import { MainComponent } from './components/main/main.component';




export const routes: Routes = [
    { path: '', redirectTo: '/main', pathMatch: 'full'},
    { path: 'main', component: MainComponent},
    { path: 'chat', component: ChatComponent},
    { path: 'login', component: LoginComponent},
    { path: 'informe', component: InformeComponent}
];





