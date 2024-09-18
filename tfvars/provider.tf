terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "5.66.0"
        }
    }


    #Here created empty bucket tag as these bucket and dynamodb_table names are different for each environment(dev and prod), we have created these values in .tf file of respective environment config files.
    backend "s3" {

    }




}

provider "aws" {
    region = "us-east-1"
}