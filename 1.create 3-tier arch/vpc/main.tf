resource "google_compute_network" "vpc_network" {
  name                    = var.name
  auto_create_subnetworks = true
}

resource "google_compute_subnetwork" "subnetwork_app" {
  name          = "my-app-subnet"
  network       = google_compute_network.vpc_network.self_link
  ip_cidr_range = "10.0.1.0/24"
}

resource "google_compute_subnetwork" "subnetwork_db" {
  name          = "my-db-subnet"
  network       = google_compute_network.vpc_network.self_link
  ip_cidr_range = "10.0.2.0/24"
}

output "network" {
  value = google_compute_network.vpc_network.self_link
}

output "subnetwork_app" {
  value = google_compute_subnetwork.subnetwork_app.self_link
}

output "subnetwork_db" {
  value = google_compute_subnetwork.subnetwork_db.self_link
}
