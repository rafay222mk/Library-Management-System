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
    var id = this.element.id.split('_')[3]
    const selectCountry = this.element.options[this.element.selectedIndex].value
    // alert(selectCountry);
    // debugger
    this.url = `/states/fetch_country_states?id=${selectCountry}`
    fetch(this.url, {
      // headers: {
      //   Accept: "text/vnd.turbo-stream.html"
      // }
    })
        .then(response => response.text())
        .then(html => {
          document.getElementById(`user_addresses_attributes_${id}_state`).innerHTML = html
        })
  }
}
