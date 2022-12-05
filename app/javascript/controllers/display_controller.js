import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display"
export default class extends Controller {
  connect() {
    this.modal = new bootstrap.Modal(this.element)
    this.modal.show()
  }
  disconnect() {
    this.modal.hide()
    this.element.remove()
  }
  submitEnd(event) {
    this.modal.hide()
  }
}
