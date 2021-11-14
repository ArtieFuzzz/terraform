variable "instance_name" {
  description = "The name of the instance"
  type = string
  default = "star"
}

variable "provider_region" {
  description = "The region of the provider"
  type = string
  default = "ap-southeast-2"
}

variable "key_pair" {
 description = "The name of the key pair to be used to autheticate in SSH"
 sensitive = false
}

variable "secret_key_name" {
  description = "The name of the secret key to be used in SSH"
  sensitive = false
}

variable "ebs_volume_size" {
  description = "The size of the EBS Storage"
  type = number
  sensitive = false
  default = 8
}