

#tfstate: Network-stg

data "terraform_remote_state" "network-k8s" {
    backend = "s3"

    config = {
        bucket = "acesso-k8s-inf-terraform"
        key = "aws-inf-shared/network-k8s.tf"
        region = "us-east-1"
    }
}

 data "aws_internet_gateway" "k8s-igw" {
   filter {
       name = "tag:Name"
       values = ["k8s-igw"]
   }
}

# VPN Gateway

data "aws_vpn_gateway" "k8s-vpn-gw" {
   filter {
       name = "tag:Name"
       values = ["k8s-vpn-gw"]
   }
}

# VPC 

data "aws_vpc" "k8s-k8s" {
   filter {
       name = "tag:Name"
       values = ["k8s-k8s"]
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

# SECURITY GROUPS

data "aws_security_group" "k8s-matriz-internal" {
    
    tags = {
        Name = "k8s-matriz-internal"
    }
}
data "aws_security_group" "k8s-matriz-public" {
    
    tags = {
        Name = "k8s-matriz-public"
    }
}
data "aws_security_group" "k8s-aws-internal" {
    
    tags = {
        Name = "k8s-aws-internal"
    }
}
