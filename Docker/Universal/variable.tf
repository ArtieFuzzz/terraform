variable "docker_container_name" {
  description = "The name of the container"
  type = string
  default = "lovely"
}

variable "image_name" {
  description = "The name of the image (latest tag only)"
  type = string
}

variable "keep_docker_image" {
  description = "Whether to keep or not keep the docker image"
  type = bool
  default = false
}

variable "image_tag" {
  description = "The tag of the image (defaults to latest)"
  type = string
  default = "latest"
}