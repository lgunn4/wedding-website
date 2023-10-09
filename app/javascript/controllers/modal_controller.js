import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal", "modalBackground"];

  connect() {
  }


  openModal(event) {
    this.open();
    this.modalTarget.addEventListener('click', (e) => {
      debugger;
      this.backdropClick(e)
    });
  }

  closeModal(event) {
    this.close();

  }

  open(event) {
    this.modalTarget.classList.add("is-active")
  }

  close(event) {
    this.modalTarget.classList.remove("is-active");

  }

  backdropClick(event) {
    event.target === this.modalTarget && this.close(event)
  }

  clickOutside(event) {
    if (event.target === this.modalBackgroundTarget) {
      this.close()
    }
  }

  escapeKey(event) {
    debugger;
    this.close();
  }
}
