import { getAll } from "./utils";

export const alertInit = () => {
  getAll(".alert").forEach(($alert) => {
    const alert = new bootstrap.Alert($alert);
    setInterval(() => alert.close(), 2000);
  });
};
