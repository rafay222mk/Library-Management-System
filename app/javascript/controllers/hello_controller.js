import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
  }
  delete(event) {
    let confirmed = confirm("Are you yure you want to delete your Account")
    if(!confirmed) {
      event.preventDefault()
    }
    location.reload();
  }

}
