variable "amis" {
  type = map
  default = {
      "us-east-1" = "ami-083654bd07b5da81d"
      "us-east-2" = "ami-0fb653ca2d3203ac1"
  }
}

variable "cdirs_acesso_remoto" {
    type = list
    default = ["45.177.153.89/32", "45.177.153.89/32", "192.168.22.233/32"]
  
}

variable "key_name" {
  default = "terraform-aws"
    
}