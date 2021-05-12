provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "k8s-master01" {
    ami                         = "ami-0f357c2bca9d262c8"
    availability_zone           = "${var.av_zone_a}"
    ebs_optimized               = true
    instance_type               = "t2.micro"
    monitoring                  = false
    key_name                    = "${var.keyname}"
    subnet_id                   = data.aws_subnet.k8s-sn-back-a.id
    vpc_security_group_ids      = [data.aws_security_group.k8s-sg-aws-web.id,data.aws_security_group.k8s-sg-aws-internal.id,data.aws_security_group.k8s-sg-aws.id]
    associate_public_ip_address = false
    source_dest_check           = true

    root_block_device {
        volume_type           = "${var.volumetype}"
        volume_size           = 8
        delete_on_termination = true
        encrypted             = true
    }

    tags = {
        Name            = "k8s-master01"
        application     = "k8s"
        project         = "k8s"
    }

}

resource "aws_instance" "k8s-node01" {
    ami                         = "ami-0f357c2bca9d262c8"
    availability_zone           = "${var.av_zone_d}"
    ebs_optimized               = true
    instance_type               = "t2.micro"
    monitoring                  = false
    key_name                    = "${var.keyname}"
    subnet_id                   = data.aws_subnet.k8s-sn-back-d.id
    vpc_security_group_ids      = [data.aws_security_group.k8s-matriz-internal.id,data.aws_security_group.k8s-aws-internal.id,data.aws_security_group.k8s-matriz-public.id]
    associate_public_ip_address = false
    source_dest_check           = true

    root_block_device {
        volume_type           = "${var.volumetype}"
        volume_size           = 8
        delete_on_termination = true
        encrypted             = true
    }

    tags = {
        Name            = "k8s-master02"
        application     = "k8s"
        project         = "k8s"
    }

}

resource "aws_instance" "k8s-node02" {
    ami                         = "ami-0f357c2bca9d262c8"
    availability_zone           = "${var.av_zone_a}"
    ebs_optimized               = true
    instance_type               = "t2.micro"
    monitoring                  = false
    key_name                    = "${var.keyname}"
    subnet_id                   = data.aws_subnet.k8s-sn-back-a.id
    vpc_security_group_ids      = [data.aws_security_group.k8s-matriz-internal.id,data.aws_security_group.k8s-aws-internal.id,data.aws_security_group.k8s-matriz-public.id]
    associate_public_ip_address = false
    source_dest_check           = true

    root_block_device {
        volume_type           = "${var.volumetype}"
        volume_size           = 8
        delete_on_termination = true
        encrypted             = true
    }

    tags = {
        Name            = "k8s-master03"
        application     = "k8s"
        project         = "k8s"
    }

}