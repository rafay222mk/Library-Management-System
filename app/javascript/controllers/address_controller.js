import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="address"
export default class extends Controller {
  static targets = ['add_item', "template"]
  connect() {
    console.log("connected nested form")
  }
  debugger

  add_association(event) {
    event.preventDefault()
    var content = this.templateTarget.innerHTML.replace(/TEMPLATE_RECORD/g, new Date().valueOf())
    this.add_itemTarget.insertAdjacentHTML('beforebegin', content)
  }

  remove_association(event) {
    console.log("remove")
    // debugger
    event.preventDefault()
    let item = event.target.closest(".address")
    item.querySelector("input[name*='_destroy']").value = 1
    item.style.display = 'none'
    console.log("removed successfully")
  }

}
