# Route 53 Hosted Zone
resource "aws_route53_zone" "lab_zone" {
name = "lab.osmanthreatcomposerapp.com"
}


resource "aws_route53_record" "www" {
 zone_id = aws_route53_zone.lab_zone.id
 name    = var.a_record_name
 type    = "CNAME"
 ttl     = 300
 records = [var.alb_dns_name]
}


