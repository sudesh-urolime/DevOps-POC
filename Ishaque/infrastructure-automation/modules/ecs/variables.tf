variable "ecs_cluster_name" {
  description = "ECS cluster name"
  type        = string
}

variable "environment" {
  description = "Environment; prod or dev, etc"
  type        = string
}

variable "task_def_name" {
  description = "task def name"
  type        = string
}

variable "task_cpu" {
  description = "ECS task CPU"
  type        = number
}

variable "task_mem" {
  description = "ECs task memory"
  type        = number
}

variable "task_def_ecr_repository_url" {
  description = "Application container image repository url"
  type        = string
}

variable "ecs_execution_role_arn" {
  description = "ECS Task execution role"
  type        = string
}

variable "ecs_svc_name" {
  description = "ECS service name"
  type        = string
}

variable "ecs_desired_count" {
  description = " ECS service desired count"
  type        = number
}

variable "ecs_tg_arn" {
  description = "ALB target group arn"
  type        = string
}

variable "task_container_port" {
  description = "ECS service task container port"
  type        = number
}

variable "task_host_port" {
  description = "ECS service task host port"
  type        = number
}

variable "ecs_max_count" {
  description = "Upper limi of the number of running tasks that can be running in a service during a deployment"
  type        = number
}

variable "ecs_min_count" {
  description = " Lower limit of the number of running tasks that must remain running and healthy in a service during a deployment"
  type        = number
}

variable "ecs_subnets" {
  description = "ECS service subnets"
  type        = list(string)
}

variable "ecs_sec_grps" {
  description = "ECS service security group"
  type        = any
}

