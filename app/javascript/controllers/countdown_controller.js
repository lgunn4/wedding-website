import { Controller } from "@hotwired/stimulus";

// Specify the countdown target date and time in UTC
var countDownDate = Date.UTC(2025, 5, 14, 20, 0, 0); // Months are zero-based: 5 for June; 20 UTC equates to 4pm EST in June

// Connects to data-controller="countdown"
export default class extends Controller {
  static targets = ["countdown"];

  connect() {
    this.countdown = setInterval(this.updateCountdown.bind(this), 250);
  }

  updateCountdown() {
    const now = Date.now(); // Current time in UTC
    const secondsRemaining = (countDownDate - now) / 1000;

    if (secondsRemaining <= 0) {
      clearInterval(this.countdown);
      this.countdownTarget.innerHTML = '';
      return;
    }

    const secondsPerDay = 86400;
    const secondsPerHour = 3600;
    const secondsPerMinute = 60;

    const days = Math.floor(secondsRemaining / secondsPerDay);
    const hours = Math.floor((secondsRemaining % secondsPerDay) / secondsPerHour);
    const minutes = Math.floor((secondsRemaining % secondsPerHour) / secondsPerMinute);
    const seconds = Math.floor(secondsRemaining % secondsPerMinute);

    this.countdownTarget.innerHTML = `<strong>${days}</strong> days, <strong>${hours}</strong> hours, <strong>${minutes}</strong> minutes, <strong>${seconds}</strong> seconds`;
  }
}