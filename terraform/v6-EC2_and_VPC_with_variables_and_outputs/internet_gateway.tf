
//Creating a Internet Gateway 
resource "aws_internet_gateway" "invent-igw" {
    vpc_id = "${aws_vpc.invent-vpc.id}"
    tags = {
      Name = "invent-igw"
    }
}