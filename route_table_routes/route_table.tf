resource "aws_route_table" "route_table" {
    vpc_id = var.vpc
    route = var.route_table.routes
    tags = var.route_table.tags
}