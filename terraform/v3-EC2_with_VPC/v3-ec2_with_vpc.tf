provider "aws" {
  region = "us-east-1"
  profile = "default"
}

resource "aws_instance" "ec2" {
    ami = "ami-0b5eea76982371e91"
    instance_type = "t2.micro"
    key_name = "myk8s"
   // security_groups = ["invent-sg"]
   vpc_security_group_ids = ["${aws_security_group.invent-sg.id}"]
   subnet_id = "${aws_subnet.invent-public_subent_01.id}"
}

resource "aws_security_group" "invent-sg" {
    name = "invent-sg"
    vpc_id = "${aws_vpc.invent-vpc.id}"
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "invent-sg"

    }

}

//creating a VPC
resource "aws_vpc" "invent-vpc" {
    cidr_block = "10.1.0.0/16"
    tags = {
      Name = "invent-vpc"
    }
  
}

// Creatomg a Subnet 
resource "aws_subnet" "invent-public_subent_01" {
    vpc_id = "${aws_vpc.invent-vpc.id}"
    cidr_block = "10.1.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1a"
    tags = {
      Name = "invent-public_subent_01"
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

resource "aws_route_table_association" "invent-rta-public-subent-1" {
    subnet_id = "${aws_subnet.invent-public_subent_01.id}"
    route_table_id = "${aws_route_table.invent-public-rt.id}"
  
}