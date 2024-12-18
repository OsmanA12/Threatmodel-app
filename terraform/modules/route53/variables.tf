variable "a_record_name" {
 type        = string
 description = "A record name"
 default     = "www.osmanthreatcomposerapp.com"
}


variable "alb_dns_name" {
 type = string
 description = "The DNS name of the Application Load Balancer"
}
