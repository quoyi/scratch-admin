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

document.addEventListener("DOMContentLoaded", (e) => {
  const $tooltips = getAll('[data-bs-toggle="tooltip"]');
  $tooltips.forEach(($tooltip) => new bootstrap.Tooltip($tooltip));
});
