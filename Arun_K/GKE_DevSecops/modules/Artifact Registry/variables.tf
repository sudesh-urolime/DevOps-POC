variable "project_id" {
  type        = string
  description = "The project ID to create the repository"
}

variable "repository_id" {
  type        = string
  description = "The repository name"
}

variable "location" {
  type        = string
  description = "The name of the location this repository is located in"
}

variable "format" {
  type        = string
  description = "The format of packages that are stored in the repository. You can only create alpha formats if you are a member of the alpha user group."
}

variable "description" {
  type        = string
  description = "The user-provided description of the repository"
  default     = null
}
