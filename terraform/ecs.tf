resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.ecs_cluster_name
}

resource "aws_ecs_task_definition" "ecs_task" {
  family                   = var.container_name
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  cpu                      = "256"
  memory                   = "512"

 container_definitions = jsonencode([{
  name  = var.container_name
  image = "970547345579.dkr.ecr.us-east-1.amazonaws.com/my-node-app-repo"  #Replace with actual ECR URL
  portMappings = [{
    containerPort = var.app_port
    hostPort      = var.app_port
  }]
}])

}
resource "aws_ecs_service" "ecs_service" {
  name            = var.container_name
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.ecs_task.arn
  launch_type     = "FARGATE"
  
  network_configuration {
    subnets          = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
    security_groups  = [aws_security_group.ecs_sg.id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.alb_target_group.arn
    container_name   = var.container_name
    container_port   = var.app_port
  }

  desired_count = 2
}
