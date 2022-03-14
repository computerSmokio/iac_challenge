variable "ami" {
    type = string
}
variable "instance_type" {
  type = string
}
variable "key_name" {
  type = string
}
variable "tags" {
  type = map(string)
}
variable "cidr_block" {
  type = string
}


locals {
  subnet_definition = {
      cidr_block = "192.168.0.0/24"
      availability_zone = "sa-east-1a"
      attach_public = true
      tags = {Name = "web server subnet"}
  }

  security_group_definition = {
    name = "web-group"
    description = "A security group for the web server"
    tags = {
      "Name" = "Web Server security group"
    }
    ingress = [
      {
        description = "Allow http calls"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        description = "Allow ssh"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
    egress = [
      {
        description = "Allow any"
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  }

  route_table_definition = {
    tags = {"Name" = "web server route table"}
    routes = [
      {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.internet_gateway.id
        carrier_gateway_id = null
        destination_prefix_list_id = null
        egress_only_gateway_id = null
        instance_id = null
        ipv6_cidr_block = null
        local_gateway_id = null
        nat_gateway_id = null
        network_interface_id = null
        transit_gateway_id = null
        vpc_endpoint_id = null
        vpc_peering_connection_id = null
      }
    ]
  }
}