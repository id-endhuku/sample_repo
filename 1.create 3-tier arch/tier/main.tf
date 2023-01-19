resource "google_compute_instance_group" "instance_group" {
  name     = "${var.name}-instance-group"
  subnetwork = var.subnetwork
}

resource "google_compute_instance" "instances" {
  count                = var.instance_count
  name                 = "${var.name}-instance-${count.index}"
  machine_type         = var.instance_type
  subnetwork           = var.subnetwork
  boot_disk {
    initialize_params {
      image = var.instance_image
    }
  }
  attached_disk {
    source = var.data_disk
  }
  metadata = {
    group = var.name
  }
  service_account {
    email = var.service_account
    scopes = var.scopes
  }
  network_interface {}
}

resource "google_compute_instance_group_manager" "manager" {
  name               = "${var.name}-manager"
  instance_group     = google_compute_instance_group.instance_group.name
  base_instance_name = google_compute_instance.instances.name
  version {
    instance_template = google_compute_instance.instances.self_link
  }
}

output "instances" {
  value = google_compute_instance.instances
}
