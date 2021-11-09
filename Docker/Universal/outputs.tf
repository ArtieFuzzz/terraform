output "container_id" {
  description = "ID of the Docker container"
  value       = docker_container.docker_container.id
}

output "image_id" {
  description = "ID of the Docker image"
  value       = docker_image.docker_container.id
}
