#before using terraform workspace, first you need to ensure or specify which workspaces you are going to use like dev, pord nad stage or qa...
# if to see the list of workspaces:
# terraform workspace list

# to create a new workspace dev:
# terraform workspace new dev
# terraform workspace new pord

# to select the workspace:
# terraform workspace select dev

# to see in which workspace you are:
# terraform workspace show


resource "aws_security_group" "allow-ssh" {
    name = "allow-ssh-${terraform.workspace}"
    description = "allowing port 22 via ssh protocol"

    egress { 
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress { 
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "allow-ssh-${terraform.workspace}"
    }
}

resource "aws_instance" "expense" {
    ami = "ami-09c813fb71547fc4f"
    vpc_security_group_ids = ["sg-0d91387712ba38962"] #always give as set
    instance_type = lookup(var.instances,terraform.workspace)
    tags = {
        Name = "${terraform.workspace}"
    } 
}