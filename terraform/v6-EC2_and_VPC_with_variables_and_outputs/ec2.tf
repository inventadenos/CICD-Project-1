resource "aws_instance" "ec2" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key-name
    associate_public_ip_address = var.associate_ip
   // security_groups = ["invent-sg"]
   vpc_security_group_ids = ["${aws_security_group.invent-sg.id}"]
   subnet_id = "${aws_subnet.invent-public_subent_01.id}"
   for_each = toset(["master", "slave"])
   tags = {
     Name = "${each.key}"
   }
}