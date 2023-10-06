import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["form", "fieldSet"];

  connect() {
    if (document.cookie) {
      this.fieldSetTarget.disabled = true;
    }
  }

  // Turbo Frames can be used to handle form submissions
  // You can adapt this to use AJAX or other techniques
  submitForm(event) {
    event.preventDefault();

    const form = this.formTarget;
    const formData = new FormData(form);

    // Assuming you have a URL to submit the form to, you can use fetch or another technique
    fetch(form.action, {
      method: form.method,
      body: formData,
    })
      .then(response => {
        if (response.ok) {
          // Trigger the modal controller to open the modal
          this.showThankYouSection();
          this.fieldSetTarget.disabled = true;

        } else {
          // Handle errors here if needed
          console.error("Form submission failed");
        }
      })
      .catch(error => {
        console.error("Error submitting form:", error);
      });
  }

  showThankYouSection() {
    const thankYouSection = document.querySelector('[data-controller="thank"]');
    if (thankYouSection) {
      thankYouSection.dispatchEvent(new Event("thank:show"));
    } else {
      console.error("thankYouSection element not found");
    }
  }
}
