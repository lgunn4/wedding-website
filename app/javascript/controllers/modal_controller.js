import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        if (this.element.dataset.active === "true") {
            this.element.classList.add('is-active');
        }
    }

    close() {
        this.element.classList.remove('is-active');
    }
}