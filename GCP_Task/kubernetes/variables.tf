variable "vpcID" {
  type        = string
}

variable "restricted-subnet" {
  type        = string
}

variable "gke-name" {
  type        = string
}

variable "zone" {
  type        = string
}

variable "cidr-subnet" {
  type        = string
}

variable "sumnet-name" {
  type        = string

}

variable "machine-type" {
  type        = string
}

variable "node-name" {
  type        = string
}

variable "master-cidr" {
  type        = string
}

variable "cluster-cidr" {
  type        = string
}

variable "service-cidr" {
  type        = string
}

variable "zone-node" {
  type        = string
}

variable "gke-service-account" {
  type        = string
} 