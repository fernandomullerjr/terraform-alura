
resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "Permite o acesso SSH"

  ingress {
    description      = "SSH da VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["45.177.153.89/32"]
  }

  egress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["45.177.153.89/32", "192.168.22.233/32"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "permite_ssh"
  }
}


resource "aws_security_group" "acesso-ssh-us-east-2" {
  provider    = aws.us-east-2
  name        = "acesso-ssh"
  description = "Permite o acesso SSH"

  ingress {
    description      = "SSH da VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["45.177.153.89/32"]
  }

  egress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["45.177.153.89/32", "192.168.22.233/32"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "permite_ssh"
  }
}