module "networking" {
   source = "./networking"
   region = "us-central1"
   vpc_name = "terraform-network"
   subnet_name = {
    "public_subnet" = { name = "management-subnet" , cidr = "10.0.0.0/24"},
    "private_subnet" = { name =  "restricted-subnet" , cidr = "10.0.1.0/24"}
   }
   vpc_cidr = "10.0.0.0/16"
   router-name  = "task-router"
   nat-name     = "task-nat"
   routing-mode = "REGIONAL"
   auto-subnets = false
}
module "virtual-machine" {
   source = "./virtual-machine"
   zone = "us-central1-a"
   service_account   = module.iam.vm-sa-email
   vpcID             = module.networking.vpc-id
   management-subnet = module.networking.management-subnet-id
   firewall    = "ssh-firewall"
}
module "iam" {
  source      = "./iam"
  vm-role     = "roles/container.admin"
  gke-role    = "roles/storage.objectViewer"
  project-id  = "fabled-zone-375709"
  vm-sa-id    = "service-account-vm"
  vm-sa-name  = "service account for VM"
  gke-sa-id   = "service-account-gke"
  gke-sa-name = "service account for GKE"
}
module "kubernetes" {
  source              = "./kubernetes"
  vpcID               = module.networking.vpc-id
  restricted-subnet   = module.networking.restricted-subnet-id
  gke-name            = "gke"
  zone                = "us-central1-a"
  cidr-subnet         = "10.0.0.0/24"
  sumnet-name         = "managment-subnet-cidr"
  machine-type        = "g1-small"
  node-name           = "node-pool"
  master-cidr         = "172.16.0.0/28"
  cluster-cidr        = "10.16.0.0/16"
  service-cidr        = "10.12.0.0/16"
  zone-node           = "us-central1-b"
  gke-service-account = module.iam.gke-sa-email
}
