variable "log_analytics_workspace_name" {
  description = "Name of the Log Analytics workspace"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Location of the Log Analytics workspace"
  type        = string
}

variable "log_analytics_sku" {
  description = "SKU of the Log Analytics workspace"
  type        = string
  default     = "PerGB2018"
}

variable "retention_in_days" {
  description = "Number of days to retain logs in the Log Analytics workspace"
  type        = number
  default     = 30
}

variable "cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "diagnostic_setting_name" {
  description = "Name of the diagnostic setting"
  type        = string
  default     = "aks-monitoring"
}

variable "logs" {
  description = "Log categories to monitor"
  type = list(object({
    category = string
    enabled  = bool
  }))
  default = [
    {
      category = "kube-apiserver"
      enabled  = true
    },
    {
      category = "kube-controller-manager"
      enabled  = true
    }
  ]
}

variable "metrics" {
  description = "Metric categories to monitor"
  type = list(object({
    category = string
    enabled  = bool
  }))
  default = [
    {
      category = "AllMetrics"
      enabled  = true
    }
  ]
}
