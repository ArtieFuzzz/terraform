provider "docker" {
	host ="npipe:////.//pipe//docker_engine"
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx_container" {
  image = docker_image.nginx.latest
  name  = var.docker_container_name
  ports {
    internal = 80
    external = 80
  }
}
