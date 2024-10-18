variable "georeplications" {
  description = "A list of geo-replications to be configured for this Container Registry. Only applicable if value of sku is \"Premium\"."

  type = list(object({
    location                = string
    zone_redundancy_enabled = optional(bool, false)
  }))

  default  = []
  nullable = false

  validation {
    condition     = length(var.georeplications) == length(distinct([for georeplication in var.georeplications : georeplication.location]))
    error_message = "Value of property \"location\" must be unique for each object."
  }
}

variable "registry_name" {
  description = "The name of this Container Registry."
  type        = string
 }
 variable "location" {
  description = "The location/region where the Virtual Network is created."
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group in which the VNet is created."
  type        = string
}
variable "sku" {
  description = "The SKU tier for this Container Registry. Value must be \"Basic\", \"Standard\" or \"Premium\"."
  type        = string
  }
  variable "admin_enabled" {
  description = "Is the admin user account enabled for this Container Registry?"
  type        = bool
 # default     = false
 # nullable    = false
}

variable "public_network_access_enabled" {
  description = "Should public network access be enabled for this Container Registry?"
  type        = bool
 # default     = true
 # nullable    = false
}
