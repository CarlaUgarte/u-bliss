import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reset-comments"
export default class extends Controller {
  connect() {
  }
  
  reset() {
    this.element.reset()
  }
}
