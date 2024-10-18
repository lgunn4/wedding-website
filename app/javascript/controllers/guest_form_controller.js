// app/javascript/controllers/guest_form_controller.js

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["guests", "number"]

    addGuest(event) {
        event.preventDefault();
        const newGuestIndex = this.guestsTarget.children.length;
        const newFieldHTML = `
            <div class="guest-form-item" id="guest_${newGuestIndex}">
                <label class="label">Guest ${newGuestIndex + 1}</label>
                <div class="field is-horizontal">
                    <div class="field-body">
                        <div class="field">
                            <input type="text" name="rsvp[${newGuestIndex}][first_name]" class="input" placeholder="First Name" required>
                        </div>
                        <div class="field">
                            <input type="text" name="rsvp[${newGuestIndex}][last_name]" class="input" placeholder="Last Name" required>
                        </div>
                    </div>
                </div>
            </div>
        `;
        this.guestsTarget.insertAdjacentHTML('beforeend', newFieldHTML);
        this.numberTarget.value = newGuestIndex + 1
    }

    removeGuest(event) {
        event.preventDefault();
        const lastGuestElement = this.guestsTarget.lastElementChild;
        if (lastGuestElement && this.guestsTarget.children.length > 1) {
            this.guestsTarget.removeChild(lastGuestElement);
        }
        const newGuestCount = this.guestsTarget.children.length;
        this.numberTarget.value = newGuestCount;
    }
}

