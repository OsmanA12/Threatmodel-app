# VPC




variable "vpc_name" {
 type        = string
 description = "Name of the VPC"
 default     = "cs-vpc"
}


variable "security_group_name" {
 type        = string
 description = "Name of the security group"
 default     = "threatcomposer-sg"
}






variable "internet_gateway_name" {
 type        = string
 description = "Name of the internet gateway"
 default     = "threatcomposer-igw"
}




variable "egress_internet_gateway_name" {
 type        = string
 description = "Name of the egress internet gateway"
 default     = "threatcomposer-egress-only-igw"
}


variable "availability_zone_a" {
 type        = string
 description = "Availability zone a"
 default     = "eu-west-2a"
}


variable "availability_zone_b" {
 type        = string
 description = "Availability zone b"
 default     = "eu-west-2b"
}
