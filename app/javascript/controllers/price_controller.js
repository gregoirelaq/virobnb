import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = { pricePerNight: Number }; // Retrieve the price per night
  static targets = ["totalPrice", "startDate", "endDate"]; // Targets for date inputs and total price span

  connect() {
    this.startDateTarget.addEventListener("change", this.calculatePrice.bind(this));
    this.endDateTarget.addEventListener("change", this.calculatePrice.bind(this));
  }

  calculatePrice() {
    const startDate = new Date(this.startDateTarget.value);
    const endDate = new Date(this.endDateTarget.value);

    if (isNaN(startDate) || isNaN(endDate) || startDate >= endDate) {
      this.totalPriceTarget.textContent = "Invalid dates";
      return;
    }

    const nights = (endDate - startDate) / (1000 * 60 * 60 * 24)+1;
    this.totalPriceTarget.textContent = `Total: $${nights * this.pricePerNightValue}`;
  }
}
