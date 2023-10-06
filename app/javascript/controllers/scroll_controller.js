import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  rsvp() {
    let e = document.getElementById("rsvp-form");
    e.scrollIntoView({
      block: 'start',
      behavior: 'smooth',
      inline: 'start'
    });
  }
}
