// Configure the Google Cloud provider
provider "google" {
  credentials = "${file("${var.credentials}")}"
  project     = "${var.gcp_project}"
  region      = "${var.region1}"
}

// Create VPCs
resource "google_compute_network" "vpc" {
  count                   = 2
  name                    = "${var.name}-vpc-${count.index + 1}"
  auto_create_subnetworks = "false"
}

// Create Subnets
resource "google_compute_subnetwork" "subnet" {
  count         = 4
  name          = "${var.name}-subnet-${count.index + 1}"
  ip_cidr_range = "${lookup(var.subnet_cidr, count.index)}"
  network       = "${element(google_compute_network.vpc.*.name, count.index)}"
  depends_on    = ["google_compute_network.vpc"]
  region        = "${var.region1}"
}

// VPC firewall configuration
resource "google_compute_firewall" "firewall" {
  count   = 2
  name    = "${var.name}-firewall-${count.index + 1}"
  network = "${element(google_compute_network.vpc.*.name, count.index)}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  allow {
    protocol = "udp"
  }

  source_ranges = ["0.0.0.0/0"]
}

/*

module "deploy-instance" {
  source = "./deploy-instance"

  name           = "dev"
  region1_zone_1 = "europe-west4-a"
  os_image       = "ubuntu-1404-lts"
}

*/


// Add Instances
resource "google_compute_instance" "ubuntu" {
  count        = 1
  name         = "${var.name}-ubuntu-${count.index + 1}"
  machine_type = "f1-micro"
  zone         = "${var.region1_zone_1}"
  tags         = ["tag1"]

  depends_on = ["google_compute_subnetwork.subnet"]

  boot_disk {
    initialize_params {
      image = "${var.os_image}"
    }
  }

  network_interface {
    subnetwork    = "${element(google_compute_subnetwork.subnet.*.name, count.index)}"
    access_config = {}
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}

/*

// VPN config
// Add Static IPs

resource "google_compute_address" "static_ip" {
  count  = 2
  name   = "${var.name}-staticip-${count.index +1}"
  region = "${element(var.regions, count.index)}"
}

//Add VPN Gateways
resource "google_compute_vpn_gateway" "vpn" {
  count   = 2
  name    = "${var.name}-vpn-${count.index + 1}"
  network = "${element(google_compute_network.vpc.*.name, count.index)}"
  region  = "${element(var.regions, count.index)}"
}

//Add forwarding rules
resource "google_compute_forwarding_rule" "fr_esp" {
  count       = 2
  name        = "${var.name}-fr-esp-${count.index + 1}"
  region  = "${element(var.regions, count.index)}"
  ip_protocol = "ESP"
  ip_address  = "${element(google_compute_address.static_ip.*.address, count.index)}"
  target      = "${element(google_compute_vpn_gateway.vpn.*.name, count.index)}"
}

resource "google_compute_forwarding_rule" "fr_udp500" {
  count       = 2
  name        = "${var.name}-fr-udp500-${count.index + 1}"
  region      = "${element(var.regions, count.index)}"
  ip_protocol = "UDP"
  port_range  = "500"
  ip_address  = "${element(google_compute_address.static_ip.*.address, count.index)}"
  target      = "${element(google_compute_vpn_gateway.vpn.*.id, count.index)}"
}

resource "google_compute_forwarding_rule" "fr_udp4500" {
  count       = 2
  name        = "${var.name}-fr-udp4500-${count.index + 1}"
  region      = "${element(var.regions, count.index)}"
  ip_protocol = "UDP"
  port_range  = "4500"
  ip_address  = "${element(google_compute_address.static_ip.*.address, count.index)}"
  target      = "${element(google_compute_vpn_gateway.vpn.*.id, count.index)}"
}

*/


