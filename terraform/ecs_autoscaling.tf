# Define ECS Auto Scaling Target
/*resource "aws_appautoscaling_target" "ecs_target" {
  max_capacity       = 5  # Maximum number of tasks
  min_capacity       = 2  # Minimum number of tasks
  resource_id        = "service/my-ecs-cluster/my-ecs-service"  # Replace with your cluster/service
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}

# Create Auto Scaling Policy (Scale Up)
resource "aws_appautoscaling_policy" "scale_up" {
  name               = "ecs-scale-up"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.ecs_target.resource_id
  scalable_dimension = aws_appautoscaling_target.ecs_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.ecs_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }
    target_value       = 60  # Scale up when CPU > 60%
    scale_in_cooldown  = 60
    scale_out_cooldown = 60
  }
}

# Create Auto Scaling Policy (Scale Down)
resource "aws_appautoscaling_policy" "scale_down" {
  name               = "ecs-scale-down"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.ecs_target.resource_id
  scalable_dimension = aws_appautoscaling_target.ecs_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.ecs_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }
    target_value       = 30  # Scale down when CPU < 30%
    scale_in_cooldown  = 60
    scale_out_cooldown = 60
  }
}
*/
