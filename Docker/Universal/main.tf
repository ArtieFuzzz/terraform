provider "docker" {
	host ="npipe:////.//pipe//docker_engine"
}

resource "docker_image" "image" {
  name         = "${var.image_name}:latest"
  keep_locally = false
}

resource "docker_container" "container" {
  image = docker_image.image.latest
  name  = var.docker_container_name
}
