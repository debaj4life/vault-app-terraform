variable "instance_type" {
  default = "t3.medium"
  type    = string
}

variable "key_name" {
  default = "tutorial-key"
  type    = string
}

variable "subnet_id" {
  default = "subnet-0ac8b28d64573460b"
  type    = string

}

variable "env" {
  default = "dev"
  type    = string
}

variable "subnet_ranges" {
  type = list(string)
  default = ["subnet-0ac8b28d64573460b", "subnet-08b711d075f9a142a", "subnet-0a66a5cfe19424c28"]
}

variable "vpc_id" {
  type = string
  default = "vpc-071a935c677dbb90c"
  
}
variable "volume_size" {
  type = number
  default = 13
  
}

variable "domain_name" {
  type = string
  description = "domain"
  default = "vault.techrite.org"
}

variable "zone_id" {
  type = string
  description = "zone id"
  default = "Z01752471FYWFTVEJ68WX"
}

variable "ami_id" {
  type        = string
  description = "ami"
  default     = "ami-0acc77abdfc7ed5a6"
}
