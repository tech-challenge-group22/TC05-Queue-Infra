/*====
ECR repository to store our Docker images
======*/
resource "aws_ecr_repository" "queue_app" {
  name = "queue/production"
}