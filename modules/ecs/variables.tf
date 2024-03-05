variable "prefix" {
  description = "The prefix"
}

variable "vpc_id" {
  description = "The VPC id"
}

variable "availability_zones" {
  type        = list(string)
  description = "The azs to use"
}

variable "security_groups_ids" {
  description = "The SGs to use"
}

variable "subnets_ids" {
  type    = list(string)
  description = "The private subnets to use"
}

variable "public_subnet_ids" {
  description = "The private subnets to use"
}

variable "repository_name" {
  description = "The name of the repisitory"
}

variable "execution_arn_role" {
  description = "arn of execution role"
}

variable "session_token_aws" {
  description = "AWS session token"
}

variable "access_key_aws" {
  description = "AWS session token"
}

variable "secret_aws" {
  description = "AWS session token"
}

variable "output_sqs_url" {
  description = "SQS Payment response"
}

variable input_sqs_url {
  description = "SQS url to receive events"
}

variable sqs_polling_interval {
}

variable sqs_message_group {
}

variable secret_key_jwt_token {
}
