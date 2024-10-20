resource "aws_security_group" "allow_http_and_ssh" {
  name        = "allow_http_and_ssh"
  description = "Allow for HTTP, HTTPS and SSH traffic"
  vpc_id      = aws_vpc.rs_vpc.id

  tags = {
    Name = "RS HTTP & SSH"
  }
}

resource "aws_security_group" "cluster_connect" {
  name        = "allow_k8s_operate"
  description = "Allow K8s cluster to operate"
  vpc_id      = aws_vpc.rs_vpc.id

  tags = {
    Name = "RS K8s Cluster"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_https" {
  security_group_id = aws_security_group.allow_http_and_ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443

}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.allow_http_and_ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.allow_http_and_ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_ping" {
  security_group_id = aws_security_group.allow_http_and_ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = -1
  ip_protocol       = "icmp"
  to_port           = -1
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.allow_http_and_ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_ingress_rule" "k8s_allow_https" {
  security_group_id = aws_security_group.cluster_connect.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "k8s_nodes_traffic" {
  security_group_id = aws_security_group.cluster_connect.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 6443
  ip_protocol       = "tcp"
  to_port           = 6443
}

resource "aws_vpc_security_group_ingress_rule" "k8s_nodes_metrics" {
  security_group_id = aws_security_group.cluster_connect.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 10250
  ip_protocol       = "tcp"
  to_port           = 10250
}

resource "aws_vpc_security_group_ingress_rule" "k8s_allow_ssh" {
  security_group_id = aws_security_group.cluster_connect.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "k8s_all_outbound" {
  security_group_id = aws_security_group.cluster_connect.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

