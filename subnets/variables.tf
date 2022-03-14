variable "public_subnet" {
  type = object({
      cidr_block = string
      availability_zone = string
      attach_public = bool
      tags = map(string)
  })
}

variable "vpc" {
  type = string
}