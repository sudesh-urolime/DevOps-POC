variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

#variable "vnet_id" {
# type = string
#}

# variable "acr_subnet_id" {
#   type = string
# }
variable "vm_name" {
  type = string
}
variable "networkinterface_name" {
  type = string
}
variable "pubip_name" {
  type = string
}

variable "allocation_method" {
    type = string
  
}

# variable "ip_name" {
#   type = string
# }

variable "vm_size" {
  type = string
}

variable "storage_subnet_id" {
  type = string
}