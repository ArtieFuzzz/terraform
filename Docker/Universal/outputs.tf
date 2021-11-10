output "container_id" {
  description = "ID of the Docker container"
  value       = resource.docker_container.container.id
}

output "image_id" {
  description = "ID of the Docker image"
  value       = resource.docker_image.image.id
}
