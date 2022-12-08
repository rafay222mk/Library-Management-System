import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="address"
export default class extends Controller {
  static targets = ['add', "template"]
  connect() {
    console.log("connected")
  }
  debugger
  add_address(event){
    event.preventDefault()
    var contemt = this.templateTarget.innerHTML.replace(/TEMPLATE_RECORD/g,Math.floor(Math.random() * 20))
    this.add_itmeTarget.insertAdjacentHTML("beforebegin" , contemt)
  }

  remove(event) {
    console.log("remove function called")
    event.preventDefault()
    let item = event.target.closest(".address")
    item.querySelector("input[name*='_destroy']").value = 1
    item.style.display = "none"

  }

}
