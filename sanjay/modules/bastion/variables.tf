variable "vm_name" {
  description = "Name of the VM instance"
}

variable "machine_type" {
  description = "The machine type to use for the instance"
}

variable "zone" {
  description = "The zone where the VM will be created"
}

variable "vpc_name" {
  description = "Name of the VPC"
}

variable "subnet_names" {
  description = "List of subnetwork names"
  type        = list(string)
}

variable "project_id" {
  description = "Project ID where resources will be created"
}

variable "region" {
  description = "Region for the subnetwork"
}

variable "vm_image" {
  description = "Image to use for the VM"
}
