import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="try"
export default class extends Controller {
  connect() {
    // alert('jqevy working')
    console.log("i am connected...")
  }
    
  initialize() {
    this.element.setAttribute("data-action", "click->try#showModal")
  }
  showModal(event) {
    event.preventDefault()
    this.url = this.element.getAttribute("href")
    fetch(this.url, {
      headers: {
        Accept: "text/vnd.turbo-stream.html"
      }
    })
    .then(response => response.text())
    .then(html => Turbo.renderStreamMessage(html))
  }
}
