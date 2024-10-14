variable "cluster_name" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "master_ipv4_cidr_block" {
  type = string
}

variable "nodepool_name" {
  type = string
}

variable "workern_type" {
  type = string
}

variable "workern_disksize" {
  type = string
}

variable "workern_disktype" {
  type = string
}

variable "workern_imagetype" {
  type = string
}

variable "accounts" {

}

variable "roles" {
}

variable "project_id" {
  type = string
}

variable "cidr_ranges" {
  type = list(string)
}


variable "subnet_names" {

}

variable "region" {
  type = string
}