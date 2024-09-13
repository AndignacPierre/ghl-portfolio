import { Controller } from "stimulus"
import { Dropdown } from "bootstrap"

export default class extends Controller {
  connect() {
    this.dropdown = new Dropdown(this.element)
  }

  disconnect() {
    this.dropdown.dispose()
  }
}
