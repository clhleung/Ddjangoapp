# variables.tf
# Terraform file for all variables Terraform may use to create instances and security groups they may use

variable "access_key" {default = "access key"}

variable "secret_key"{default = "secret_key"}

variable "region" {
  default = "us-east-2"
}
