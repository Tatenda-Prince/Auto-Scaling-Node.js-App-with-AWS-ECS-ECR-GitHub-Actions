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

variable "max_capacity" {
  default = 5
}

variable "min_capacity" {
  default = 2
}

variable "cpu_scale_up_threshold" {
  default = 60  # Scale up when CPU > 60%
}

variable "cpu_scale_down_threshold" {
  default = 30  # Scale down when CPU < 30%
}
