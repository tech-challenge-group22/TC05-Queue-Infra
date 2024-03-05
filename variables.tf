variable "region" {
  description = "Region that the instances will be created"
}

/*====
environment specific variables
======*/

variable "lab_role_arn" {
  description = "The lab role"
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

variable "input_sqs_url" {
}

variable "sqs_message_group" {
}

variable "sqs_polling_interval" {
}

variable "secret_key_jwt_token" {
}
