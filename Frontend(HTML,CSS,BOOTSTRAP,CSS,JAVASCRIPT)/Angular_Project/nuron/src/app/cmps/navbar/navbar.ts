import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';

@Component({
  selector: 'app-navbar',
  imports:[CommonModule],
  templateUrl: './navbar.html',
  styleUrls: ['./navbar.css']
})
export class NavbarComponent {
  theme: string = 'dark';
  activeDropdown: string | null = null;

  toggleTheme() {
    this.theme = this.theme === 'dark' ? 'light' : 'dark';
  }

  showDropdown(menu: string) {
    this.activeDropdown = menu;
  }

  hideDropdown() {
    this.activeDropdown = null;
  }
}
