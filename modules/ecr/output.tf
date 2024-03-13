output "ecr_url" {
  value = "${aws_ecr_repository.queue_app.repository_url}"
}