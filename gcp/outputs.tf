//Outputs

output "networks" {
  value = ["${google_compute_network.vpc.*.name}"]
}

output "subnets" {
  value = ["${google_compute_subnetwork.subnet.*.name}"]
}

output "firewall" {
  value = ["${google_compute_firewall.firewall.*.name}"]
}

output "instances" {
  value = ["${google_compute_instance.ubuntu.*.name}"]
}

/*
output "static_ip" {
  value = ["${google_compute_address.static_ip.*.address}"]
}

output "vpn_gateways" {
  value = ["${google_compute_vpn_gateway.vpn.*.name}"]
}

output "forw_rule_udp4500" {
  value = ["${google_compute_forwarding_rule.fr_udp4500.*.name}"]
}

output "forw_rule_udp500" {
  value = ["${google_compute_forwarding_rule.fr_udp500.*.name}"]
}

output "forw_rule_fr_esp" {
  value = ["${google_compute_forwarding_rule.fr_esp.*.name}"]
}
*/

