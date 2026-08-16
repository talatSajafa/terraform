variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.medium"
}

variable "server_name" {
  description = "Name tag for the EC2 server"
  type        = string
  default     = "Win-Production-Server"
}

variable "environment" {
  description = "Environment tag"
  type        = string
  default     = "Production"
}
