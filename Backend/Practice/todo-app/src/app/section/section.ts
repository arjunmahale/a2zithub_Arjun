import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';



@Component({
  selector: 'app-section',
  imports: [CommonModule],
  templateUrl: './section.html',
  styleUrl: './section.css'
})
export class Section {
     arr:{name:string,id:string}[]=[
      {
        name:"arjun",
        id:"1"
      },
      {
        name:"om",
        id : "2"
      },
      {
        name:"omkar",
        id : "3"
      }
     ];
}
