output "VPC_name" {
    description = "VPC id name"
    value = "${aws_vpc.invent-vpc.id}" 
  
}

output "jenkins-public-ip" {
    description = "this is jenkins master ip"
    value = try(aws_instance.invent-ec2["master"].public_ip,"")
  
}

output "slave-public-ip" {
    description = "this is jenkins slave ip"
    value = try(aws_instance.invent-ec2["slave"].public_ip,"")
  
}

output "ansible-public-ip" {
    description = "this is Ansible public ip"
    value = try(aws_instance.invent-ec2["ansible"].public_ip,"")
  
}