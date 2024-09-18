#Though we are using .tfvars config files, first we need to define the type of variables here in varaibles.tf config files:

variable "environment" {
    type = string
}

variable "instances" {
    type = map
}

variable "ingress_info" {
    default = [
        {
            from_port = 22
            to_port = 22
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            from_port = 8080
            to_port = 8080
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            from_port = 80
            to_port = 80
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },

    ]
}

variable "common_tags" {
    
    default = {
        Project = "expense"
        Terraform = true

    }
}

variable "tags" {
    type = map
}

variable "domain_name" {
    default = "mohansai.online"
}