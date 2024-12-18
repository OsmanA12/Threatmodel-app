variable "certificate_arn" {
 type        = string
 description = "The name of the cert arn"
 default     = "arn:aws:acm:eu-west-2:585768150963:certificate/d3fa77e6-a3c9-48e7-a755-34147093f54a"
}




variable "ssl_policy" {
 type        = string
 description = "The SSL policy"
 default     = "ELBSecurityPolicy-2016-08"
}


variable "alb_name" {
 type = string
}


variable "security_group_id" {
 type = string
}


variable "subnet_ids" {
 type = list(string)
}


variable "vpc_id" {
 type = string
}


variable "target_group" {
 type = string
}
