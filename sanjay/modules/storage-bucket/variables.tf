variable "name" {
  type =  string
}

variable "project_id" {
  type = string
}

variable "location" {
  type = string
}

variable "storage_class" {
  type = string
}

variable "bucket_policy_only" {
  type = string
}

# variable "labels" {
#   type =
# }

variable "force_destroy" {
  type = string
}

variable "public_access_prevention" {
  type = string
}

variable "versioning" {
  type = string
}

variable "autoclass" {
  type = string
}

# variable "bucket_policy_only" {
#   description = "Enables Bucket Policy Only access to a bucket."
#   type        = bool
#   default     = true
# }


variable "retention_policy" {
  description = "Configuration of the bucket's data retention policy for how long objects in the bucket should be retained."
  type = object({
    is_locked        = bool
    retention_period = number
  })
  default = null
}
