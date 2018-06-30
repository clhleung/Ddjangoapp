# variables.tf
# Terraform file for all variables Terraform may use to create instances and security groups they may use

variable "access_key" {default = "access"}

variable "secret_key"{default = "secret"}

variable "region" {
  default = "us-east-2"
}

