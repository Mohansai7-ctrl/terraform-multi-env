environment = "prod"

instances = {
    mysql-prod = "t3.small"
    backend-prod = "t3.micro"
    frontend-prod = "t3.micro"
}

tags = {
    Environment = "prod"
}