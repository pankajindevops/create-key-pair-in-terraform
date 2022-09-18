
provider "aws" {
  profile = "default"
  region  = "us-east-1"
}


resource "aws_instance" "web" {
  ami           = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
  key_name = "18-sep-2022"
}

resource "aws_key_pair" "TF_key" {

  key_name   = "TF_key"
  public_key = tls_private_key.rsa.public_key_openssh
}


resource "tls_private_key" "rsa" {

  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "TF_key" {

  content  = tls_private_key.rsa.private_key_pem
  filename = "tfkey"
}

output "PUBLIC_IP_ADDRESS" {

  value = aws_instance.web.public_ip
}
