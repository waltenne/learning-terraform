variable "region" {
  type        = string
  description = "Valor para AWS Region"
  default     = "us-east-2"
}

variable "availability_zone1" {
  type        = string
  description = "Valor para AWS Region"
  default     = "us-east-2a"
}

variable "availability_zone2" {
  type        = string
  description = "Valor para AWS Region"
  default     = "us-east-2b"
}

variable "profile" {
  type        = string
  description = "Valor para AWS Profile"
  default     = "default"
}

variable "instance_type" {
  type        = string
  description = "Valor para AWS Profile"
  default     = "t2.micro"
}

variable "instance_ami" {
  type        = string
  description = "Valor para AWS AMI"
  default     = "ami-02f3416038bdb17fb"
}

variable "instance_tags" {
  type        = map(string)
  description = "Valor para AWS Instance Tags"
  default = {
    Name    = "Terraform - T2 Micro"
    Project = "Aprendendo Terraform"
  }
}

variable "vpc_cidr_block" {
  type        = string
  description = "Valor para AWS VPC CIDR Block"
  default     = "10.20.0.0/16"
}

variable "subnet_cidr_block1" {
  type        = string
  description = "Valor para AWS SUBNET CIDR Block"
  default     = "10.20.1.0/24"
}

variable "subnet_cidr_block2" {
  type        = string
  description = "Valor para AWS SUBNET CIDR Block"
  default     = "10.20.2.0/24"
}

variable "vpc_tags" {
  type        = map(string)
  description = "Valor para AWS VPC Tags"
  default = {
    Name    = "Terraform VPC"
    Project = "Aprendendo Terraform"
  }
}

variable "route_table_cidr_block" {
  type        = string
  description = "Valor para AWS VPC CIDR Block"
  default     = "0.0.0.0/0"
}