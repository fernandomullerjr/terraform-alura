provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "dev" {
  ami = "ami-083654bd07b5da81d"
  instance_type = "t2.micro"
  key_name = "terraform-aws-"
}