// GuestController.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["thankYouSection"];

  connect() {
    if (document.cookie) {
      this.show();
    }
    this.element.addEventListener("thank:show", this.show.bind(this));
  }

  show() {
    this.thankYouSectionTarget.hidden = false;
  }
}
