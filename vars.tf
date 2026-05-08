variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
}

variable "project_name" {
  type = string
}

variable "availability_zones" {
  type = list(string)
}