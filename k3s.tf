resource "aws_instance" "master_node" {
  ami                         = data.aws_ami.al2023.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.private_subnet[0].id

  key_name = var.ssh_key

  security_groups = [
    aws_security_group.cluster_connect.id
  ]


  tags = {
    Name = "K8s Master Node"
  }
}

resource "aws_instance" "worker_node" {
  ami                         = data.aws_ami.al2023.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.private_subnet[1].id

  key_name = var.ssh_key

  security_groups = [
    aws_security_group.cluster_connect.id
  ]


  tags = {
    Name = "K8s Worker Node"
  }
}