variable "project" {
  type    = string
  default = "test-ansible"
}

variable "application" {
  type    = string
  default = "App1"
}

variable "ami" {
  type    = string
  default = "ami-0c2b8ca1dad447f8a"
}

variable "ssh-key" {
  type    = string
  default = "ansible-test"
}

variable "az" {
  type    = string
  default = "us-east-1d"
}
variable "ec2_type" {
  type    = string
  default = "t2.micro"
}

variable "ec2_nb" {
  type    = number
  default = 1
}

variable "ebs_type" {
  type    = string
  default = "standard"
}