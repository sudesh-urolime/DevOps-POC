variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "vpc_name" {
  description = "VPC name"
  type        = string
}

variable "cidr_block" {
  description = "VPC CIDR block"
  type        = string
}

variable "enable_dns_support" {
  description = "Whether or not the DNS support should be enabled"
  type        = bool
}

variable "environment" {
  description = "The name of the environment, prod/dev/stage"
  type        = string
}

variable "public_subnet_count" {
  description = "How many public subnets should be created"
  type        = number
}

variable "private_subnet_count" {
  description = "How many private subnets should be created"
  type        = number
}

variable "public_subnets_cidr_blocks" {
  description = "The public subnets CIDR, should be added based on the number of public subnets"
  type        = list(string)
}

variable "private_subnets_cidr_blocks" {
  description = "The private subnets CIDR, should be added based on the number of private subnets"
  type        = list(string)
}

variable "azs" {
  description = "The availablility zones in which the subnets are deployed"
  type        = list(string)
}

variable "map_public_ip_on_launch" {
  description = "Whether or not the public IPs should be allocated to the resources deployed in the subnet"
  type        = bool
}

variable "igw_name" {
  description = "IGW name"
  type        = string
}

variable "nat_name" {
  description = "NAT gateway name"
  type        = string
}

variable "pub_rt_name" {
  description = "Public route table name"
  type        = string
}

variable "prvt_rt_name" {
  description = "Private route table name"
  type        = string
}

variable "ami_id" {
  description = "The bastion server AMI ID, different for different regions"
  type        = string
}

variable "instance_type" {
  description = "Bastion server instance type"
  type        = string
}

variable "domain_name" {
  description = "The domain name associated with the application"
  type        = string
}

variable "key_name" {
  description = "SSH key name for the bastion server"
  type        = string
}

variable "bastion_public_key" {
  description = "Our SSH public key which will be added to the bastion server for ssh access"
  type        = string
}

variable "prod_pub_alb_name" {
  description = "Production ALB name"
  type        = string
}

variable "tg_name" {
  description = "ALB target group name to which the ECS service will be added"
  type        = string
}

variable "ecs_cluster_name" {
  description = "ECS cluster name"
  type        = string
}

variable "task_def_name" {
  description = "ECS service task definition name"
  type        = string
}

variable "task_cpu" {
  description = "ECS service task allocated CPU"
  type        = number
}

variable "task_mem" {
  description = "ECS service task allocated memory"
  type        = number
}

variable "task_def_ecr_repository_url" {
  description = "The application container image"
  type        = string
}

variable "ecs_svc_name" {
  description = "ECS service name"
  type        = string
}

variable "ecs_desired_count" {
  description = "ECS service task desired count"
  type        = number
}

variable "task_container_port" {
  description = "ECS service container port"
  type        = number
}

variable "task_host_port" {
  description = "ECS service container host port"
  type        = number
}

variable "ecs_max_count" {
  description = "ECS service max task count"
  type        = number
}

variable "ecs_min_count" {
  description = "ECS service min task count"
  type        = number
}
