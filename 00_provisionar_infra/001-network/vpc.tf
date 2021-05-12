
# VPC K8S

resource "aws_vpc" "k8s-vpc" {
    cidr_block           =  var.vpc["cidr_block"]
    enable_dns_hostnames = true
    enable_dns_support   = true
    instance_tenancy     = "default"

    tags  = {
        "Name" = var.vpc["Name"]
    }
}

