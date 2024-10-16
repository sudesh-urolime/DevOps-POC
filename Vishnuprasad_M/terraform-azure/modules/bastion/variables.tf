variable "pvt_ip_allocation_net_int" {
  type = string
  description = "private ip address allocation Enabled/Disabled"
}
variable "public_subnet_id" {
  type = string
  description = "public subnet id for the instance"
}
variable "bastion_ip_config_name" {
  type = string
  description = "name for bastion_ip_config"
}
variable "resource_group_name" {
  type = string
  description = "resource group name"
}
variable "location" {
  type = string
  description = "location for the resource"
}
variable "bastion_network_interface_name" {
  type = string
  description = "name for bastion_network_interface"
}
variable "bastion_name" {
  type = string
  description = "bastion name"
}
variable "bastion_size" {
  type = string
  description = "bastion machine size"
}
variable "os_disk_name" {
  type = string
  description = "os_disk_name"
}
variable "os_disk_caching" {
  type = string
  description = "os_disk_caching"
}
variable "os_disk_storage_account_type" {
  type = string
  description = "os_disk_storage_account_type"
}
variable "source_image_reference_publisher" {
  type = string
  description = "source_image_reference_publisher"
}
variable "source_image_reference_offer" {
  type = string
  description = "source_image_reference_offer"
}
variable "source_image_reference_sku" {
  type = string
  description = "source_image_reference_sku"
}
variable "source_image_reference_version" {
  type = string
  description = "source_image_reference_version"
}
variable "bastion_user_name" {
  type = string
  description = "bastion_user_name"
}
variable "disable_password_authentication" {
  type = string
  description = "disable_password_authentication"
}
