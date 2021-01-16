import { getAll } from "./utils";

document.addEventListener("DOMContentLoaded", (e) => {
  const $tooltips = getAll('[data-bs-toggle="tooltip"]');
  $tooltips.forEach(($tooltip) => new bootstrap.Tooltip($tooltip));
});
