output "vpc-id" {
  value = google_compute_network.vpc_network.id
}

output "management-subnet-id" {
  value = google_compute_subnetwork.subnets["public_subnet"].id
}

output "restricted-subnet-id" {
  value = google_compute_subnetwork.subnets["private_subnet"].id
}