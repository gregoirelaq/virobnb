import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input"];

  connect() {
    console.log("✅ Rating controller connected!");
  }

  highlight(event) {
    const rating = event.currentTarget.dataset.value;
    console.log(`⭐ Hovering over star: ${rating}`);
    this.fillStars(rating);
  }

  select(event) {
    const rating = event.currentTarget.dataset.value;
    this.inputTarget.value = rating; // Met à jour le champ caché
    this.fillStars(rating);
    console.log(`⭐ Star selected: ${rating}`);
  }

  reset() {
    this.fillStars(this.inputTarget.value || 0);
  }

  fillStars(rating) {
    this.element.querySelectorAll(".star-icon").forEach(star => {
      star.classList.remove("text-warning", "text-secondary");
      if (star.dataset.value <= rating) {
        star.classList.add("text-warning"); // Étoiles dorées
      } else {
        star.classList.add("text-secondary"); // Étoiles grisées
      }
    });
  }
  
}
