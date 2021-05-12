

#tfstate: Network-stg

data "terraform_remote_state" "network-k8s" {
    backend = "s3"

    config = {
        bucket = "acesso-k8s-inf-terraform"
        key = "aws-inf-shared/network-k8s.tf"
        region = "us-east-1"
    }
}

# SUBNET

data "aws_subnet" "k8s-sn-back-a" {
   filter {
       name = "tag:Name"
       values = ["k8s-sn-back-a"] 
   }
}
data "aws_subnet" "k8s-sn-back-d" {
   filter {
       name = "tag:Name"
       values = ["k8s-sn-back-d"] 
   }
}

# SECURITY GROUPS

data "aws_security_group" "k8s-aws-internal" {
    
    tags = {
        Name = "k8s-aws-internal"
    }
}
data "aws_security_group" "k8s-aws-internal" {
    
    tags = {
        Name = "k8s-aws-internal"
    }
}
