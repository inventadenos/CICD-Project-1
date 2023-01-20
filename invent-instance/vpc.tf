
//creating a VPC
resource "aws_vpc" "invent-vpc" {
    cidr_block = var.vpc
    tags = {
      Name = "invent-vpc"
    }
  
}

// Creating a Subnet 
resource "aws_subnet" "invent-public_subnet_01" {
    vpc_id = "${aws_vpc.invent-vpc.id}"
    cidr_block = var.subnet
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1a"
    tags = {
      Name = "invent-public_subnet_01"
    }
  
}

//Creating a Internet Gateway 
resource "aws_internet_gateway" "invent-igw" {
    vpc_id = "${aws_vpc.invent-vpc.id}"
    tags = {
      Name = "invent-igw"
    }
}

// Create a route table 
resource "aws_route_table" "invent-public-rt" {
    vpc_id = "${aws_vpc.invent-vpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.invent-igw.id}"
    }
    tags = {
      Name = "invent-public-rt"
    }
}

// Associate subnet with routetable 

resource "aws_route_table_association" "invent-rta-public-subnet-1" {
    subnet_id = "${aws_subnet.invent-public_subnet_01.id}"
    route_table_id = "${aws_route_table.invent-public-rt.id}"
  
}