# modules/key_vault/variables.tf
variable "key_vault_name" {
  description = "The name of the Azure Key Vault."
  type        = string
}

variable "location" {
  description = "The location where the Key Vault will be created."
  type        = string
}


variable "resource_group_name" {
  description = "The name of the resource group where the Key Vault will be created."
  type        = string
}


variable "soft_delete_retention_days" {
  description = "The number of days to retain deleted vault items."
  type        = number
  default     = 7
}

variable "key_permissions" {
  description = "List of key permissions."
  type        = list(string)
  default     = ["Create", "Get"]
}

variable "secret_permissions" {
  description = "List of secret permissions."
  type        = list(string)
  default     = ["Set", "Get", "Delete", "Purge", "Recover"]
}