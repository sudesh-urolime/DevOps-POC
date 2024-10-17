# variables.tf

variable "vpc_name" {
  description = "The name of the VPC network"
  type        = string
}

variable "subnet_name" {
  description = "List of subnet names"
  type        = list(string)
}

variable "cidr_ranges" {
  description = "List of CIDR ranges for the subnets"
  type        = list(string)
}

variable "router_name" {
  description = "The name of the Cloud Router"
  type        = string
}

variable "nat_name" {
  description = "The name of the NAT configuration"
  type        = string
}

variable "region" {
  description = "The GCP region where the resources will be created"
  type        = string
  default     = "us-central1"
}

# Logging configuration for NAT
variable "nat_logging_enabled" {
  description = "Enable logging for NAT"
  type        = bool
  default     = true
}

variable "nat_log_filter" {
  description = "The log filter for NAT (options: ALL, ERRORS_ONLY, TRANSLATIONS_ONLY)"
  type        = string
  default     = "ALL"
}