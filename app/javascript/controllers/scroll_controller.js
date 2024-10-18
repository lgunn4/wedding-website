import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    ourStory() {
        let e = document.getElementById("our-story");

        if (e) {
            e.scrollIntoView({
                block: 'start',
                behavior: 'smooth',
                inline: 'start'
            });
        } else {
            window.location.replace("/#our-story");
        }

    }

    info() {
        let e = document.getElementById("info");

        if (e) {
            e.scrollIntoView({
                block: 'start',
                behavior: 'smooth',
                inline: 'start'
            });
        } else {
            window.location.replace("/#info");
        }

    }

    top() {
        let e = document.getElementById("top");

        if (e) {
            e.scrollIntoView({
                block: 'start',
                behavior: 'smooth',
                inline: 'start'
            });
        } else {
            window.location.replace("/");
        }

    }
}