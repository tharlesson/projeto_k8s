# SECURITY GROUP - k8s

# AWS-Internal
resource "aws_security_group" "k8s-sg-aws-internal" {
    name        = "${var.profile}-sg-aws-myip"
    description = "allow my ip"
    vpc_id      = data.aws_vpc.k8s-vpc.id

    ingress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["132.255.174.81/32"]
    }

    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    tags = {
        "Name" = "k8s-sg-aws-internal"
        "CC" = "k8s"         
    }
}

resource "aws_security_group" "k8s-sg-aws-web" {
    name        = "${var.profile}-sg-aws-web"
    description = "Allow port 80 http"
    vpc_id      = data.aws_vpc.k8s-vpc.id

    ingress {
        from_port       = 80
        to_port         = 80
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    tags = {
        "Name" = "k8s-sg-aws-web"
        "CC" = "k8s"         
    }
}



resource "aws_security_group" "k8s-sg-aws" {
    name        = "${var.profile}-sg-aws"
    description = "Allow k8s admin port"
    vpc_id      = data.aws_vpc.k8s-vpc.id

    ingress {
        from_port       = 6443
        to_port         = 6443
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    tags = {
        "Name" = "k8s-sg-aws"
        "CC" = "k8s"         
    }
}