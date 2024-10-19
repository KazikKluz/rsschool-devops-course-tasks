# Get latest AMI ID for Ubuntu 2023
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-*-amd64-server-*"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "master_node" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public_subnet[1].id
  associate_public_ip_address = true

  key_name = var.ssh_key



  security_groups = [
    aws_security_group.cluster_connect.id
  ]

  user_data = file("${path.module}/k8s_install.sh")

  tags = {
    Name = "K8s Master Node"
  }
}