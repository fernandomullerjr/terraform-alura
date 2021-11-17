provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "dev" {
  count = 3
  ami = "ami-083654bd07b5da81d"
  instance_type = "t2.micro"
  key_name = "terraform-aws-"
  tags = {
      Name = "dev${count.index}"
  }
  vpc_security_group_ids = ["sg-069132da01c2f341b"]
}

resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "Permite o acesso SSH"

  ingress {
    description      = "SSH da VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["45.177.153.246/32"]
  }

  egress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["45.177.153.246/32", "192.168.22.233/32"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "permite_ssh"
  }
}