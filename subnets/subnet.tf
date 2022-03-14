resource "aws_subnet" "public_subnet" {
    vpc_id                  = var.vpc
    cidr_block              = var.public_subnet.cidr_block
    map_public_ip_on_launch = var.public_subnet.attach_public
    availability_zone       = var.public_subnet.availability_zone
    tags                    = var.public_subnet.tags
}