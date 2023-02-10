variable "vm-role" {
  type        = string
} 

variable "gke-role" {
  type        = string
}

variable "project-id" {
  type        = string
}

variable "vm-sa-name" {
  type        = string
  description = " vm service account name"
}

variable "vm-sa-id" {
  type        = string
  description = "vm service account id"
}

variable "gke-sa-name" {
  type        = string
}

variable "gke-sa-id" {
  type        = string
  description = "gke service account id"
}