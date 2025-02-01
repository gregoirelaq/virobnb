document.addEventListener("DOMContentLoaded", function() {
  const stars = document.querySelectorAll(".star-icon");
  const ratingInput = document.getElementById("rating-input");

  if (stars.length > 0 && ratingInput) {
    stars.forEach(star => {
      star.addEventListener("mouseover", function() {
        highlightStars(this.dataset.value);
      });

      star.addEventListener("click", function() {
        ratingInput.value = this.dataset.value; // Met à jour le champ caché avec la note choisie
        updateStars(this.dataset.value);
      });
    });

    function highlightStars(value) {
      stars.forEach(star => {
        star.classList.remove("text-warning");
        if (star.dataset.value <= value) {
          star.classList.add("text-warning"); // Ajoute une couleur jaune aux étoiles sélectionnées
        }
      });
    }

    function updateStars(value) {
      stars.forEach(star => {
        star.classList.remove("text-secondary", "text-warning");
        if (star.dataset.value <= value) {
          star.classList.add("text-warning");
        } else {
          star.classList.add("text-secondary");
        }
      });
    }
  }
});
