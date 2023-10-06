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
          return response.json();
        } else {
          console.error("Form submission failed");
        }
      }).then(response => {
        if (response.success) {
          this.showThankYouSection();
          this.hideErrors();
          this.fieldSetTarget.disabled = true;
        } else {
          this.showErrors(response.errors);
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

  showErrors(errors) {
    const errorMessageSection = document.querySelector('[data-controller="error"]');
    if (errorMessageSection) {
      errorMessageSection.dispatchEvent(new CustomEvent('error:show', {
        detail: {
          errors: errors,
        },
      }));
    } else {
      console.error("errorMessageSection element not found");
    }
  }
  hideErrors() {
    const errorMessageSection = document.querySelector('[data-controller="error"]');
    if (errorMessageSection) {
      errorMessageSection.dispatchEvent(new Event('error:hide'));
    } else {
      console.error("errorMessageSection element not found");
    }
  }
}
