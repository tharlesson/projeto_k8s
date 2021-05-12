
#INTERNET GATEWAY
resource "aws_internet_gateway" "k8s-igw" {
    vpc_id = aws_vpc.k8s-vpc.id

    tags = {
        "Name" = "${var.profile}-igw"
    }
}
