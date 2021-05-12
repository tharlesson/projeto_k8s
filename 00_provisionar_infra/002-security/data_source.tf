

#tfstate: Network-stg

data "terraform_remote_state" "network-k8s" {
    frontend = "s3"

    config = {
        bucket = "acesso-k8s-inf-terraform"
        key = "aws-inf-shared/network-k8s.tf"
        region = "us-east-1"
    }
}

# VPC
data "aws_vpc" "k8s-vpc" {
    
    tags = {
        Name = "k8s-vpc"
    }
}

# SUBNET

data "aws_subnet" "k8s-sn-front-a" {
   filter {
       name = "tag:Name"
       values = ["k8s-sn-front-a"] 
   }
}
data "aws_subnet" "k8s-sn-front-d" {
   filter {
       name = "tag:Name"
       values = ["k8s-sn-front-d"] 
   }
}


