resource "aws_instance" "ec2_instances" {
    ami                    = var.ami
    instance_type          = var.instance_type
    vpc_security_group_ids = var.security_groups
    subnet_id              = var.subnet_id
    key_name               = var.key_name
    user_data = var.user_data
    tags                   = var.tags
}