# # variables.tf

# variable "project_id" {
#   description = "The GCP project ID where the resources will be deployed"
#   type        = string
# }

# variable "region" {
#   description = "The GCP region where the resources will be created"
#   type        = string
# }

# variable "zone" {
#   description = "The GCP zone where the resources will be created"
#   type        = string
# }

# variable "vm_name" {
#   description = "The name of the virtual machine instance"
#   type        = string
# }

# variable "machine_type" {
#   description = "The machine type to be used for the VM instance"
#   type        = string
# }

# variable "vm_image" {
#   description = "The OS image to be used for the VM instance boot disk"
#   type        = string
# }

# variable "vpc_name" {
#   description = "The name of the VPC network where the VM will be deployed"
#   type        = string
# }

# variable "subnet_names" {
#   description = "A list of subnetwork names in the VPC"
#   type        = list(string)
# }

# variable "service_account_email" {
#   description = "The service account email to attach to the VM"
#   type        = string
# }


variable "vm_name" {
  description = "The name of the VM instance"
  type        = string
}

variable "machine_type" {
  description = "The machine type for the VM instance"
  type        = string
}

variable "zone" {
  description = "The GCP zone where the VM will be created"
  type        = string
}

variable "vm_image" {
  description = "The image to use for the boot disk of the VM"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC network"
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnetwork within the VPC"
  type        = string
}

variable "region" {
  description = "The GCP region where resources will be created"
  type        = string
}

variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "service_account_email" {
  description = "The service account email to attach to the VM"
  type        = string
}
