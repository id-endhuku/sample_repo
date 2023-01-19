resource "google_compute_http_health_check" "health_check" {
  name               = "my-app-health-check"
  request_path       = "/health"
  check_interval_sec = 10
  timeout_sec        = 5
}

resource "google_compute_backend_service" "backend_service" {
  name          = "my-app-backend-service"
  health_checks = [google_compute_http_health_check.health_check.self_link]
}

resource "google_compute_url_map" "url_map" {
  name            = "my-app-url-map"
  default_service = google_compute_backend_service.backend_service.self_link
}

resource "google_compute_target_http_proxy" "target_http_proxy" {
  name   = "my-app-target-http-proxy"
  url_map = google_compute_url_map.url_map.self_link
}

resource "google_compute_global_forwarding_rule" "forwarding_rule" {
  name       = "my-app-forwarding-rule"
  target     = google_compute_target_http_proxy.target_http_proxy.self_link
  port_range = "80"
}

resource "google_compute_backend_service_group" "backend_service_group" {
  count = length(var.instances)
  backend {
    group = var.instances[count.index].self_link
  }
}

resource "google_compute_backend_service" "backend_service" {
  depends_on = [google_compute_backend_service_group.backend_service_group]
  name = var.name
}


