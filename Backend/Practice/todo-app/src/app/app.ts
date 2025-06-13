import { Component } from '@angular/core';

import { Header } from './header/header';
import { Section } from './section/section';
import { Footer } from './footer/footer';



@Component({
  selector: 'app-root',
  imports: [Header,Section,Footer],
  templateUrl: './app.html',
  styleUrl: './app.css'
})
export class App {
  protected title = 'todo-app';
}
