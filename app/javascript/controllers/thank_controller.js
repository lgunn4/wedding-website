// GuestController.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["thankYouSection", "thankYouMessageBody"];

  connect() {
    this.element.addEventListener("thank:show", this.show.bind(this));
  }

  show(event) {
    const guestName = event.detail.guest_name
    const thankYouText = `Thank you <strong>${guestName}</strong> for Rsvping! We look forward to spending our special night with you!`
    this.thankYouMessageBodyTarget.innerHTML = thankYouText;
    this.thankYouSectionTarget.hidden = false;
  }
}
