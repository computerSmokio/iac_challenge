variable "ami"{
    type = string
}
variable "instance_type" {
  type = string
}
variable "security_groups" {
  type = list(string)
}
variable "subnet_id" {
  type = string
}
variable "key_name" {
  type = string
}
variable "user_data" {
  type = string
}
variable "tags" {
  type = map(string)
}