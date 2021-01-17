import "../stylesheets/application";
import "./bootstrap";

// document.addEventListener("DOMContentLoaded", (e) => {
document.addEventListener("turbolinks:load", (e) => {
  window.dispatchEvent(new Event("resize"));
});
