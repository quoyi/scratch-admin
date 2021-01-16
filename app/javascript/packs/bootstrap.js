document.addEventListener("DOMContentLoaded", (e) => {
  const $tooltips = Array.from(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
  $tooltips.forEach(($tooltip) => new bootstrap.Tooltip($tooltip));
});
