resource "google_compute_firewall" "http_firewall" {
  name    = "allow-http"
  network = var.network

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
}
