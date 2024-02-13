import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tasks-of-day-modal"
export default class extends Controller {
  connect() {
    const today = new Date().toJSON().slice(0, 10);
    const tasksToday = document.querySelector(".task" + today);
    tasksToday.classList.remove("d-none");
  }

 appear(event) {
    console.log(event.currentTarget.id)
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
