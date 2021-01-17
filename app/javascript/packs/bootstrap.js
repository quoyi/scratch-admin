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

import { getAll } from "./utils";

// document.addEventListener("DOMContentLoaded", (e) => {
document.addEventListener("turbolinks:load", (e) => {
  window.dispatchEvent(new Event("resize"));

  // $(".toast").toast({ autohide: false });
  getAll(".toast").forEach(($toast) => {
    const toast = new bootstrap.Toast($toast, { autohide: false });
    toast.show();
  });
});
