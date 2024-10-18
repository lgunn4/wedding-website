import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
    static targets = ["image", "section", "loading"]

    connect() {
        this.loadedCount = 0;
        this.totalImages = this.imageTargets.length;
        this.checkImages();
    }

    checkImages() {
        this.imageTargets.forEach(image => {
            if (image.complete) {
                this.imageLoaded();
            } else {
                image.addEventListener('load', () => this.imageLoaded());
                image.addEventListener('error', () => this.imageLoaded()); // handle broken images
            }
        });
    }

    imageLoaded() {
        this.loadedCount++;
        if (this.loadedCount === this.totalImages) {
            this.loadingTarget.style.display = 'none';
            this.sectionTarget.style.display = 'block';
        }
    }
}