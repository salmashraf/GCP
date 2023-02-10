resource "google_compute_network" "vpc_network" {
  name = var.vpc_name
 #  ip_cidr_range = var.vpc_cidr
}
resource "google_compute_subnetwork" "subnets" {
  for_each      = var.subnet_name
  name          = each.value.name
  ip_cidr_range = each.value.cidr
  region        = var.region
  network       = google_compute_network.vpc_network.name
  }

resource "google_compute_router" "router" {
  name    = var.router-name
  network = google_compute_network.vpc_network.id
  region  = google_compute_subnetwork.subnets["public_subnet"].region
}
 
resource "google_compute_router_nat" "nat" {
  name                               = var.nat-name
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = google_compute_subnetwork.subnets["public_subnet"].id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

}
