import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Header } from '../header/header';

@Component({
  selector: 'app-section',
 
  imports: [CommonModule, Header],
  templateUrl: './section.html',
  styleUrls: ['./section.css']
})
export class Section {
  arr = [
    { name: "arjun", id: "1" },
    { name: "om", id: "2" },
    { name: "omkar", id: "3" }
  ];
}
