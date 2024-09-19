resource "aws_route53_record" "expense" {
    zone_id = "Z01771702MEQ3I9CTODSQ"
    #if == prod --> mohansai.online
    #else == dev --> dev.mohansai.online
    records = terraform.workspace == "prod" ? [aws_instance.expense.public_ip] : [aws_instance.expense.private_ip]
    name = terraform.workspace == "prod" ? var.domain_name : "${terraform.workspace}.${var.domain_name}"
    allow_overwrite = true
    type = "A"
    ttl = 1
}