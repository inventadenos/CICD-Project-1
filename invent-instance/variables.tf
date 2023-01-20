variable "ami" {
    default = "ami-0b5eea76982371e91"
  
}

variable "instance_type" {
    default = "t2.micro"
  
}

variable "key" {

    default = "myk8s"
  
}

variable "vpc" {

    default = "10.1.0.0/16"
  
}

variable "subnet" {

    default = "10.1.2.0/24"
  
}