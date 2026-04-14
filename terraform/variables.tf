variable "region" {
  description = "AWS Region"
  default = "ap-south-1"
  type = string
}

variable "key_name" {
    description = "SSH KEY"
    default = "self-healing-key"
    type = string
}

variable "path_to_public_key" {
    description = "PATH TO PUBLIC KEY"
    default = "self-healing-key.pub"
    type = string
}

variable "ami"{
    description = "AMI ID"
    default = "ami-05d2d839d4f73aafb"
    type = string
}

variable "instance_type"{
    description = "EC2 Instance type"
    default = "t3.micro"
    type = string
}
variable "public_key" {
  description = "Public SSH key"
  type        = string
}