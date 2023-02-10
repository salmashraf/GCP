# run 'gcloud auth application-default login'

provider "google" {
  version = "4.51.0"
 # credentials = var.credentials
  project = "fabled-zone-375709"
  region  = var.region
  zone    = var.zone
}
