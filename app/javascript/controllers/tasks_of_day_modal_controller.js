import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tasks-of-day-modal"
export default class extends Controller {
 appear(event) {
    const tasksWindow = document.querySelector(".task" + event.currentTarget.id);

    tasksWindow.classList.toggle("d-none");

    const otherTaskWindows = document.querySelectorAll(".tasks-wrapper-calendar > div");
    otherTaskWindows.forEach(window => {
        if (window !== tasksWindow && !window.classList.contains("d-none")) {
            window.classList.add("d-none");
        }
    });
  }
}
