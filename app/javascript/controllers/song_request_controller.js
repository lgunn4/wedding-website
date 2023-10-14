import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["fields"];

  addSongRequest() {
    debugger;
    const newFields = this.fieldsTarget.firstElementChild.cloneNode(true);
    this.fieldsTarget.appendChild(newFields);
    this.enableRemoveButton();
  }

  removeSongRequest(event) {
    const targetField = event.target.closest(".field.is-horizontal");
    targetField.remove();
    this.enableRemoveButton();
  }

  enableRemoveButton() {
    const removeButton = this.element.querySelector("[data-action='click->song-request#removeSongRequest']");
    removeButton.disabled = this.fieldsTarget.childElementCount === 1;
  }
}
