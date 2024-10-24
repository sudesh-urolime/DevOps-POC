# ECS cluster resource block
resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.ecs_cluster_name

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

# Task definition resource block
resource "aws_ecs_task_definition" "prod_task_def" {
  family                   = var.task_def_name
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.task_cpu
  memory                   = var.task_mem
  #  container_definitions    = <<TASK_DEFINITION
  #[
  #  {
  #    "name": ${var.task_def_name},
  #    "image": ${var.task_def_ecr_repository_url},
  #    "cpu": ${var.task_cpu},
  #    "memory": ${var.task_mem},
  #    "essential": true,
  #    "portMappings": [
  #      {
  #        "containerPort": ${var.task_container_port},
  #        "hostPort": ${var.task_host_port}
  #      }
  #    ]
  #  }
  #]
  #TASK_DEFINITION

  container_definitions = jsonencode([
    {
      name      = var.task_def_name
      image     = var.task_def_ecr_repository_url
      cpu       = var.task_cpu
      memory    = var.task_mem
      essential = true
      portMappings = [
        {
          containerPort = var.task_container_port
          hostPort      = var.task_host_port
        }
      ]
    }
  ])

  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }

  task_role_arn = var.ecs_execution_role_arn
}

# ECS service resource block
resource "aws_ecs_service" "prod_ecs_svc" {
  name            = var.ecs_svc_name
  cluster         = aws_ecs_cluster.ecs_cluster.id
  launch_type     = "FARGATE"
  task_definition = aws_ecs_task_definition.prod_task_def.arn
  desired_count   = var.ecs_desired_count
  #iam_role                           = aws_iam_role.foo.arn
  #depends_on                         = [aws_iam_role_policy.foo]
  deployment_maximum_percent         = var.ecs_max_count
  deployment_minimum_healthy_percent = var.ecs_min_count
  enable_ecs_managed_tags            = true


  #ordered_placement_strategy {
  #  type  = "binpack"
  #  field = "cpu"
  #}

  load_balancer {
    target_group_arn = var.ecs_tg_arn
    container_name   = var.task_def_name
    container_port   = var.task_container_port
  }

  network_configuration {
    subnets         = var.ecs_subnets
    security_groups = [var.ecs_sec_grps]
  }

  #placement_constraints {
  #  type       = "memberOf"
  #  expression = "attribute:ecs.availability-zone in [us-west-2a, us-west-2b]"
  #}
}
