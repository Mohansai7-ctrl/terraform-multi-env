terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "5.66.0"
        }
    }

    backend "s3" {
        bucket = "mohan-remote-state"
        dynamodb_table = "mohan-locking"
        region = "us-east-1"
        key = "workspace-remote-state"
    }
}