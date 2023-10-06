import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["thankYouMessage"];

  // Turbo Frames can be used to handle form submissions
  // You can adapt this to use AJAX or other techniques
  submitForm(event) {
    debugger;
    event.preventDefault();

    const form = event.target;
    const formData = new FormData(form);

    // Use Turbo Streams to update the frame after the form submission
    Turbo.driveStreams.fetchResponse(form.action, {
      method: form.method,
      body: formData,
      headers: { 'Accept': 'text/vnd.turbo-stream.html, text/html, application/xhtml+xml' },
    }).then(response => {
      if (response.ok) {
        // After a successful submission, show the thank you message
        this.thankYouMessageTarget.classList.add("is-active");
      } else {
        console.error('Form submission failed:', response);
        // Handle errors or provide feedback to the user
      }
    });
  }
}
