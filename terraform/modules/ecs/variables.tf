variable "ecs_task_defintion_id" {
 type        = string
 description = "The id of the ECS task defintion"
 default     = "aws_ecs_task_definition.service.arn"
}


variable "image_id" {
  type        = string
  description = "The image ID from ECR"
}



variable "policy_arn" {
 type        = string
 description = "ARN of the policy"
 default     = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}


variable "security_group_id" {
 type = string
}


variable "subnet_ids" {
 type = list(string)
}


variable "target_group_id" {
 type = string
 description = "The ARN of the target group for the ECS service"
}


variable "alb_listener_arn" {
 type = string
}
variable "https_lb_listener" {
 type = string
}


variable "target_group_arn" {
 type = string
}
