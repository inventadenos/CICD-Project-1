variable "ami" {
    default = "ami-0b5eea76982371e91"  
}

variable "instance_type" {
    default = "t2.micro"
}

variable "key-name" {
    default = "prd01"
}

variable "vpc_cidr" {
    default = "10.1.0.0/16"
}

variable "subnet_cidr" {
    default = "10.1.1.0/24"
}
