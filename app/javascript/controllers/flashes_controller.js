import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("Stimulus <3");
  }

  closeFlash() {
    this.element.remove();
  }
}
