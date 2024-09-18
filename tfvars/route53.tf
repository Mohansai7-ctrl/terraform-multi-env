resource "aws_route53_record" "expense" {
    for_each = aws_instance.expense
    zone_id = "Z01771702MEQ3I9CTODSQ"
    records = startswith(each.key,"frontend") ? [each.value.public_ip] : [each.value.private_ip] #Here, frontend(both dev and prod) should have public ip, thats why we used startswith() function here, and if not frontend, it will create for other 4 with their private_ip's
    name = each.key == "frontend-prod" ? var.domain_name : "${each.key}.${var.domain_name}" #Here, frontend-prod only should be as domain_name and remaining names should be as each.key.domain_name(ex: mysql-dev.mohansai.online)
    type = "A"
    ttl = 1
    allow_overwrite = true
}