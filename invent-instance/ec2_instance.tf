
resource "aws_instance" "invent-ec2" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key
  vpc_security_group_ids = ["${aws_security_group.invent-sg.id}"]
   subnet_id = "${aws_subnet.invent-public_subnet_01.id}"
   for_each = toset(["master", "slave", "ansible"])
   tags = {
     Name = "${each.key}"
   }
}
