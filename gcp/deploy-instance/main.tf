// Add Instances
resource "google_compute_instance" "ubuntu" {
  count        = 2
  name         = "${var.name}-ubuntu-${count.index}"
  machine_type = "f1-micro"
  zone         = "${var.region1_zone_1}"
  tags         = ["tag1"]

  #depends_on    = ["google_compute_subnetwork.subnet"]

  boot_disk {
    initialize_params {
      image = "${var.os_image}"
    }
  }
  network_interface {
    #subnetwork = "${element(google_compute_subnetwork.subnet.*.name, count.index)}"

    subnetwork    = "dev-subnet-0"
    #subnetwork     = "${google_compute_subnetwork.subnet.0.name}"
    access_config = {}
  }
  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}
