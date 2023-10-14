import { Controller } from "@hotwired/stimulus";

const formTargets = ["form", "fieldSet"]
const formFieldTargets = ["name", "email", "numberofguests", "addressstreet", "addressline2", "addresscity", "addressprovince", "addresspostalcode", "addresscountry"];
const formFieldTargetErrors = formFieldTargets.map((formTarget) => `${formTarget}Error`)
const targets = formTargets.concat(formFieldTargets).concat(formFieldTargetErrors)

export default class extends Controller {
  static targets = targets
  connect() {
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
        this.resetErrorFields();

        if (response.success) {
          this.showThankYouSection(response.guest_name);
          this.fieldSetTarget.disabled = true;
        } else {
          this.showErrorFields(response.error_json);
        }
      })
      .catch(error => {
        console.error("Error submitting form:", error);
      });
  }

  showThankYouSection(guest_name) {
    const thankYouSection = document.querySelector('[data-controller="thank"]');
    if (thankYouSection) {
      thankYouSection.dispatchEvent(new CustomEvent("thank:show", { detail: { guest_name: guest_name } }));
    } else {
      console.error("thankYouSection element not found");
    }
  }

  resetErrorFields() {
    formFieldTargets.forEach((formFieldTarget) => {
      const target = this[`${formFieldTarget}Target`]

      if (target) {
        target.classList.remove("is-danger");
      }
    })

    formFieldTargetErrors.forEach((formFieldTarget) => {
      const target = this[`${formFieldTarget}Target`]

      if (target) {
        target.innerHTML = "";
      }
    })
  }

  showErrorFields(errorsJson) {
    const applyDangerClass = (fieldName) => {
      const target = this[`${fieldName}Target`];

      if (target) {
        target.classList.add("is-danger");
      }
    };

    const showFieldError = (fieldName, key, errors) => {
      const target = this[`${fieldName}ErrorTarget`];

      if (target) {
        target.innerHTML = errors;
      }
    };

    Object.entries(errorsJson).forEach(([key, errors]) => {
      const fieldName = key.replace(/[\._]/g, "");

      applyDangerClass(fieldName);
      showFieldError(fieldName, key, errors);
    });
  }
}
