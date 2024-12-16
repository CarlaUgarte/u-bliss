import { Controller } from "@hotwired/stimulus"
import $ from 'jquery';
window.$ = $; // Hace jQuery disponible globalmente
window.jQuery = $; // Opcional, si algunos plugins requieren jQuery global


export default class extends Controller {
  connect() {
    this.element.textContent = "Hello World!"
  }
}
