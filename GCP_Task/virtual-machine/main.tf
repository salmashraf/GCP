resource "google_compute_instance" "final-task-vm" {
  name         = "private-vm"
  zone         = var.zone
  machine_type = "f1-micro"


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      type  = "pd-standard"
    }
  }
  service_account {
    email  = var.service_account
    scopes = ["cloud-platform"]
  }

  tags = ["ssh"]

  network_interface {
    network    = var.vpcID
    subnetwork = var.management-subnet
  }

}

resource "google_compute_firewall" "ssh" {
  name    = var.firewall
  network = var.vpcID

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  target_tags   = ["ssh"]
  source_ranges = ["35.235.240.0/20"]
}