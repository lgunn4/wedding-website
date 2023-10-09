// GuestController.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["errorMessageSection", "errorMessageBody"];

  connect() {
    this.element.addEventListener("error:show", this.show.bind(this));
    this.element.addEventListener("error:hide", this.hide.bind(this));

  }

  show(event) {
    debugger;
    this.errorMessageSectionTarget.hidden = false;
    this.errorMessageBodyTarget.innerHTML = event.detail.errors.join(", ");
  }

  hide() {
    this.errorMessageSectionTarget.hidden = true;
  }
}
