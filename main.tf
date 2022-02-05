provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "us-east-2"
  region = "us-east-2"
}

resource "aws_instance" "dev" {
  count = 3
  ami = var.amis["us-east-1"] # ubuntu-focal-20.04-amd64-server-20211021
  instance_type = "t2.micro"
  key_name = var.key_name
  tags = {
      Name = "dev${count.index}"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

/*
resource "aws_s3_bucket" "dev4" {
  bucket = "lab-fernando-dev4"
  acl    = "private"

  tags = {
    Name        = "lab-fernando-dev4"
    Environment = "Dev"
  }
}
*/


/*
resource "aws_instance" "dev4" {
  ami = var.amis["us-east-1"] # ubuntu-focal-20.04-amd64-server-20211021
  instance_type = "t2.micro"
  key_name = var.key_name
  tags = {
      Name = "dev4"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
  depends_on = [
    aws_s3_bucket.dev4
  ]
}
*/

resource "aws_instance" "dev5" {
  ami = var.amis["us-east-1"] # ubuntu-focal-20.04-amd64-server-20211021
  instance_type = "t2.micro"
  key_name = var.key_name
  tags = {
      Name = "dev5"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}


resource "aws_instance" "dev6" {
  provider    = aws.us-east-2
  ami = var.amis["us-east-2"] #  Ubuntu Server 20.04 LTS (HVM), SSD Volume Type - ami-0fb653ca2d3203ac1 (64-bit x86) na região de Ohio
  instance_type = "t2.micro"
  key_name = var.key_name
  tags = {
      Name = "dev6"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh-us-east-2.id}"]
    depends_on = [
      aws_dynamodb_table.dynamodb-homologacao
    ]
}

resource "aws_dynamodb_table" "dynamodb-homologacao" {
  provider       = aws.us-east-2
  name           = "GameScores"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "UserId"
  range_key      = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }
}

resource "aws_instance" "dev7" {
  provider    = "aws.us-east-2"
  ami = "${var.amis["us-east-2"]}" #  Ubuntu Server 20.04 LTS (HVM), SSD Volume Type - ami-0fb653ca2d3203ac1 (64-bit x86) na região de Ohio
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  tags = {
      Name = "dev7"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh-us-east-2.id}"]
}