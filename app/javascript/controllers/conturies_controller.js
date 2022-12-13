import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="conturies"
export default class extends Controller {
  connect() {
    console.log("connected the conturies")
  }
  initialize(){
    this.element.setAttribute("data-action","change->conturies#loadCountryState")
  }
  loadCountryState(){
      const selectCountry = this.element.options[this.element.selectedIndex].value
      // alert(selectCountry);
      // debugger
    this.url = `/states/fetch_country_states?id=${selectCountry}`
    fetch(this.url, {
      headers: {
        Accept: "text/vnd.turbo-stream.html"
      }
    })
        .then(response => response.text())
        .then(html => Turbo.renderStreamMessage(html))
  }
}
