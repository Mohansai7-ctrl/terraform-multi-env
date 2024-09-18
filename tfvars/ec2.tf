#instance names are different for each environment, hence the instance_names, environment these variables we placed in respective .tfvars config files

resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh_${var.environment}"
    description = "allowing port 22 via ssh protocol"
    
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }

    dynamic "ingress" {
        for_each = var.ingress_info
        content {
            from_port = ingress.value["from_port"]
            to_port = ingress.value["to_port"]
            protocol = ingress.value["protocol"]
            cidr_blocks = ingress.value["cidr_blocks"]
        }
    }

    tags = merge(
        var.common_tags,
        var.tags,
        {
            Name = "allow-ssh_${var.environment}"
        }
    )
}

resource "aws_instance" "expense" {
    for_each = var.instances
    instance_type = each.value
    ami = "ami-09c813fb71547fc4f"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    tags = merge(
        var.common_tags,
        var.tags,
        {
            Name = each.key
        }
    )

}