
# SUBNETS - K8S
# Zonas (us-east-1a, us-east-1d)

#Frontend
resource "aws_subnet" "k8s-sn-front-a" {
    vpc_id                  = aws_vpc.k8s-vpc.id
    cidr_block              = "10.190.1.0/24"
    availability_zone       = "us-east-1a"
    map_public_ip_on_launch = true

    tags = {
        "Name" = "k8s-sn-front-a"
    }
}
resource "aws_subnet" "k8s-sn-front-d" {
    vpc_id                  = aws_vpc.k8s-vpc.id
    cidr_block              = "10.190.2.0/24"
    availability_zone       = "us-east-1d"
    map_public_ip_on_launch = true

    tags = {
        "Name" = "k8s-sn-front-d"
    }
}