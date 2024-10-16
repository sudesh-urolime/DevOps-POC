variable "mysql_server_name" {
  description = "The name of the MySQL flexible server."
  type        = string
}

variable "admin_username" {
  description = "Administrator username for MySQL flexible server."
  type        = string
}

variable "admin_password" {
  description = "Administrator password for MySQL flexible server."
  type        = string
  sensitive   = true
}

variable "sku_name" {
  description = "The SKU name to use for the MySQL server. Example: 'Standard_B1ms'."
  type        = string
}

variable "mysql_version" {
  description = "The version of MySQL to use. Example: '8.0'."
  type        = string
}

variable "storage_mb" {
  description = "The storage size (in MB) for the MySQL flexible server."
  type        = number
}

variable "backup_retention_days" {
  description = "The number of days for which backups should be retained."
  type        = number
  default     = 7
}

variable "geo_redundant_backup_enabled" {
  description = "Whether geo-redundant backups should be enabled."
  type        = bool
  default     = false
}

variable "location" {
  description = "The location/region for the MySQL flexible server."
  type        = string
}

variable "environment" {
  description = "Tag for environment (e.g., Development, Production)."
  type        = string
}

# VNet-related variables (already provided in your VNet module)
# variable "storage_subnet_address_name" {
#   description = "The name of the storage subnet for the MySQL server."
#   type        = string
# }
variable "storage_subnet_id" {
  type = string
}
variable "resource_group_name" {
  type = string
}