import { Controller } from "@hotwired/stimulus";

document.addEventListener("DOMContentLoaded", function () {
  function showTab(event, tabId) {
    // Hide all tab contents
    document.querySelectorAll(".tab-content").forEach(tab => {
      tab.style.display = "none";
    });

    // Show the selected tab content
    document.getElementById(tabId).style.display = "block";

    // Remove active class from all buttons
    document.querySelectorAll(".tab-btn").forEach(btn => {
      btn.classList.remove("active");
      btn.style.setProperty("--underline-color", "transparent"); // Reset underline
      btn.style.setProperty("--tab-bgcolor", "transparent"); // Reset background
    });

    // Add active class and update colors
    event.currentTarget.classList.add("active");
    let underlineColor = event.currentTarget.getAttribute("data-color");
    let bgColor = event.currentTarget.getAttribute("data-bgcolor");

    event.currentTarget.style.setProperty("--underline-color", underlineColor);
    event.currentTarget.style.setProperty("--tab-bgcolor", bgColor);
  }

  // Set initial colors on page load
  let activeTab = document.querySelector(".tab-btn.active");
  if (activeTab) {
    activeTab.style.setProperty("--underline-color", activeTab.getAttribute("data-color"));
    activeTab.style.setProperty("--tab-bgcolor", activeTab.getAttribute("data-bgcolor"));
  }
});
