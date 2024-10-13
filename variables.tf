variable "aws_region" {
  description = "Region in which AWS Resources will be created"
  type        = string
  default     = "eu-west-1"
}

variable "repository" {
  description = "GitHub repository used in CICD pipeline"
  type        = string
  default     = "repo:KazikKluz/rsschool-devops-course-tasks:*"
}

variable "account_id" {
  description = "Account id needed for full OIDC string"
  type        = string
  default     = "637423385007"
}

variable "public_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDR values"
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "azs" {
  type        = list(string)
  description = "Default availability zones"
  default     = ["eu-west-1a", "us-west-1b"]
}