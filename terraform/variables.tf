variable "aws_region" {
  default = "us-east-1"
}


variable "ecs_cluster_name" {
  default = "my-ecs-cluster"
}

variable "container_name" {
  default = "my-node-app"
}

variable "app_port" {
  default = 3000
  description = "Port on which the application runs"
}

variable "alb_health_check_path" {
  default = "/"
  description = "Health check endpoint for ALB"
}

