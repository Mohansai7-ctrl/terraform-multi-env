variable "instances" {
    default = {
        dev = "t3.micro"
        prod = "t3.small"
        #stage = "t3.micro"
        #qa = "t3.micro"
    }
}

variable "domain_name" {
    default = "mohansai.online"
}