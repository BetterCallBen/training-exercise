import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["nav", "container", "openBtn", "closeBtn"];

  toggleNav() {
    this.navTarget.classList.toggle("hidden");
    this.containerTarget.classList.toggle("full");
    this.openBtnTarget.classList.toggle("hidden");
    this.closeBtnTarget.classList.toggle("hidden");
  }
}
