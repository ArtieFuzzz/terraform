provider "aws" {
  profile = "default"
  region  = var.provider_region
}

resource "aws_instance" "server" {
  ami           = "ami-0bf8b986de7e3c7ce"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.ec2-sg.id]
  key_name = var.key_pair
  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = var.ebs_volume_size
  }

  tags = {
    Name = var.instance_name
  }

  provisioner "file" {
    source = "./install.sh"
    destination = "/tmp/install.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/install.sh",
      "sudo -E \"/tmp/install.sh\""
    ]
  }

  connection {
    type = "ssh"
    user = "ubuntu"
    private_key = file("${path.module}/${var.secret_key_name}.pem")
    host = self.public_ip
  }
}

resource "aws_security_group" "ec2-sg" {
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}