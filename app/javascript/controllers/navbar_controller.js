import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["menu"]

    toggle() {
        this.menuTarget.classList.toggle('is-active');
        this.element.querySelector('.navbar-burger').classList.toggle('is-active');
    }
}