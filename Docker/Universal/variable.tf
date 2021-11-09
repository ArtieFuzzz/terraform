variable "docker_container_name" {
  description = "The name of the container"
  type = string
  default = "lovely"
}

variable "image_name" {
  description = "The name of the image (latest tag only)"
  type = string
}