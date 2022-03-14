resource "aws_vpc" "public_vpc" {
  cidr_block = var.cidr_block
  tags       = { Name = "public_vpc"}
}

module "route_table" {
    source = "./route_table_routes"
    route_table = local.route_table_definition
    vpc = aws_vpc.public_vpc.id
}

module "subnet" {
    source = "./subnets"
    public_subnet = local.subnet_definition
    vpc = aws_vpc.public_vpc.id
}

module "security_groups" {
    source = "./security_groups"
    security_group = local.security_group_definition
    vpc = aws_vpc.public_vpc.id
}

module "web-server" {
    source = "./ec2-instances"
    ami = var.ami
    instance_type = var.instance_type
    security_groups = [module.security_groups.id]
    subnet_id = module.subnet.id
    key_name = var.key_name
    user_data = file("./ec2-instances/script/setup_web_server.bash")
    tags = var.tags
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.public_vpc.id
  tags = {
    "Name" = "internet_gateway"
  }
}

resource "aws_route_table_association" "publicAs" {
  subnet_id      = module.subnet.id
  route_table_id = module.route_table.id
}
