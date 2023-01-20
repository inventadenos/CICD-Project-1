
//creating a VPC
resource "aws_vpc" "invent-vpc" {
    cidr_block = var.vpc_cidr
    tags = {
      Name = "invent-vpc"
    }
  
}