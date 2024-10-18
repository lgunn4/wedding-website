// app/javascript/controllers/song_form_controller.js

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["songs", "number"]

    addSong(event) {
        event.preventDefault();

        if (this.songsTarget.lastElementChild.classList.contains("no-song-requests-message")) {
            const lastSongElement = this.songsTarget.lastElementChild;
            this.songsTarget.removeChild(lastSongElement);
        }
        const newSongRequestIndex = this.songsTarget.children.length;
        const newFieldHTML = `
            <div class="song-request-item" id="song_${newSongRequestIndex}">
                <label class="label">Song ${newSongRequestIndex + 1}</label>
                <div class="field is-horizontal">
                    <div class="field-body">
                        <div class="field">
                            <input type="text" name="rsvp[${newSongRequestIndex}][title]" class="input" placeholder="Song Title" required>
                        </div>
                        <div class="field">
                            <input type="text" name="rsvp[${newSongRequestIndex}][artist]" class="input" placeholder="Artist Name" required>
                        </div>
                    </div>
                </div>
            </div>
        `;
        this.songsTarget.insertAdjacentHTML('beforeend', newFieldHTML);
        this.numberTarget.value = newSongRequestIndex + 1
    }

    removeSong(event) {
        event.preventDefault();
        const lastSongElement = this.songsTarget.lastElementChild;
        if (lastSongElement && this.songsTarget.children.length > 1) {
            this.songsTarget.removeChild(lastSongElement);
            const newSongCount = this.songsTarget.children.length;
            this.numberTarget.value = newSongCount;
        }
        else if (lastSongElement) {
            this.songsTarget.removeChild(lastSongElement);
            const newFieldHTML = `
            <div class="has-text-centered no-song-requests-message">
                🕺 I can get down to anything!
            </div>
        `;
            this.songsTarget.insertAdjacentHTML('beforeend', newFieldHTML);
            this.numberTarget.value = 0;
            return
        }
    }
}

