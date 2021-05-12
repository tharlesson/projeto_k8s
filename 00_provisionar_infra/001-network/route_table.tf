resource "aws_route_table" "k8s-route-table" {
  vpc_id = "vpc-0a0889e83d3e2ff32"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "data.aws_internet_gateway.k8s-igw.id"
  }

  tags = {
    Name = "k8s-route-table"
  }
}

