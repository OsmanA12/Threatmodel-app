#ECS Cluster
resource "aws_ecs_cluster" "foo" {
 name = "threatcomposer-cluster"


 setting {
   name  = "containerInsights"
   value = "enabled"
 }
}


# ECS Task Definiton
resource "aws_ecs_task_definition" "service" {
 family                   = "service"
 network_mode             = "awsvpc"
 requires_compatibilities = ["FARGATE"]
 execution_role_arn       = aws_iam_role.test_role.arn
 task_role_arn            = aws_iam_role.test_role.arn
 cpu                      = "1024"
 memory                   = "3072"


 container_definitions = jsonencode([
   {
     name      = "threatcomposer-app"
     image     = var.image_id
     cpu       = 0
     essential = true
     portMappings = [{
       containerPort = 3000
       hostPort      = 3000
       protocol      = "tcp"
       appProtocol   = "http"
     }]
   }
 ])
}


resource "aws_ecs_service" "mongo" {
 name            = "mongodb"
 cluster         = aws_ecs_cluster.foo.id
 task_definition = aws_ecs_task_definition.service.arn
 desired_count   = 1
 launch_type     = "FARGATE"


 network_configuration {
   assign_public_ip = true
   subnets          = var.subnet_ids
   security_groups  = [var.security_group_id]
 }


 load_balancer {
   target_group_arn = var.target_group_arn
   container_name   = "threatcomposer-app"
   container_port   = 3000
 }


 deployment_controller {
   type = "ECS"
 }


 depends_on = [var.alb_listener_arn, var.https_lb_listener]
}


# IAM role




resource "aws_iam_role" "test_role" {
name = "ecs-role"




# Terraform's "jsonencode" function converts a
# Terraform expression result to valid JSON syntax.
assume_role_policy = jsonencode({
  Version = "2012-10-17"
  Statement = [
    {
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Sid    = ""
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
    },
  ]
})




tags = {
  tag-key = "tag-value"
}
}




# IAM Role Policy attachment


resource "aws_iam_role_policy" "test_policy" {
 name = "test_policy"
 role = aws_iam_role.test_role.id


 # Terraform's "jsonencode" function converts a
 # Terraform expression result to valid JSON syntax.
 policy = jsonencode({
   Version = "2012-10-17"
   Statement = [
     {
       Action = [
         "sts:AssumeRole",
       ]
       Effect   = "Allow"
       Resource = "*"
     },
   ]
 })
}






data "aws_iam_policy_document" "policy" {
statement {
  effect    = "Allow"
  actions   = ["ecs:Describe*"]
  resources = ["*"]
}
}




resource "aws_iam_policy" "policy" {
name        = "threatcomposerapp-policy"
description = "A test policy"
policy      = data.aws_iam_policy_document.policy.json
}




resource "aws_iam_role_policy_attachment" "test" {
role       = aws_iam_role.test_role.name 
policy_arn = var.policy_arn
}


