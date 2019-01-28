provider "google" {
  version     = "~> 1.20"
  credentials = "${file(var.credentials_file)}"
  project     = "${var.project}"
  region      = "${var.region}"
}

resource "google_compute_instance" "default" {
  name         = "gitlab-ci"
  machine_type = "${var.machine_type}"
  zone         = "${var.zone}"

  tags = [
    "http-server",
    "https-server",
  ]

  boot_disk {
    initialize_params {
      image = "${var.disk_image}"
    }
  }

  network_interface {
    network = "default"

    access_config = {
      nat_ip = "${google_compute_address.default.address}"
    }
  }

  metadata {
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }
}

resource "google_compute_address" "default" {
  name = "default"
}
