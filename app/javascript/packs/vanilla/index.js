import { alertInit } from "./bootstrap";

// document.addEventListener("DOMContentLoaded", (e) => {
document.addEventListener("turbolinks:load", (e) => {
  window.dispatchEvent(new Event("resize"));

  alertInit();
});
