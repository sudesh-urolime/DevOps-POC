variable "project_id" {
  type = string
}
variable "vpc_name" {
  type = string
}
variable "subnet_names" {
  type = list(string)
}
variable "cidr_ranges" {
  type = list(string)
}
variable "bucket_name" {
  type = string
}
variable "region" {
  type = string
}
variable "bucket_class" {
  type = string
}
variable "router_name" {
  type = string
}
variable "nat_name" {
  type = string
}
variable "zone" {
  type = string
}
variable "vm_name" {
  type = string
}
variable "machine_type" {
  type = string
}
variable "vm_image" {
  type = string
}
variable "master_ipv4_cidr_block" {
  type = string
}
variable "nodepool_name" {
    type = string
}
variable "cluster_name" {
  
}
variable "workern_type" {
  
}
variable "workern_disktype" {
  
}
variable "workern_disksize" {
  
}
variable "workern_imagetype" {
  
}
variable "workern_oauthscopes" {
  
}
variable "accounts" {
}
variable "roles" {
  
}

variable "repository_id" {
  type = string
}

variable "description" {
  type = string
}

variable "format" {
  type = string
}

variable "location" {
  type = string
}

  variable "name" {
    type =  string
  }

  # variable "project_id" {
  #   type = string
  # }

  # variable "location" {
  #   type = string
  # }

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
