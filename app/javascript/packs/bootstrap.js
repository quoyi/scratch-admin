require.context("../images", true);

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

import "@fortawesome/fontawesome-free/js/all";
import * as bootstrap from "bootstrap";

window.$ = window.jQuery = $;
window.bootstrap = bootstrap;

// document.addEventListener("DOMContentLoaded", (e) => {
document.addEventListener("turbolinks:load", (e) => {
  window.dispatchEvent(new Event("resize"));
});
