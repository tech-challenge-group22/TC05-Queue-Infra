/*====
Variables used across all modules
======*/
locals {
  production_availability_zones = ["us-east-1a", "us-east-1b"]
}

provider "aws" {
  region  = "${var.region}"
}

terraform {
  backend "s3" {
    bucket         = "tc05-tfstate-queue"
    key            = "terraform.tfstate"
    region         = "us-east-1"
  }
}

module "networking" {
  source               = "./modules/networking"
  prefix               = "queue"
  vpc_cidr             = "10.0.0.0/16"
  public_subnets_cidr  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets_cidr = ["10.0.10.0/24", "10.0.20.0/24"]
  region               = "${var.region}"
  availability_zones   = "${local.production_availability_zones}"
  key_name             = "production_key"
}

module dynamo {
  source = "./modules/dynamo"
}

module ecr {
  source = "./modules/ecr"
}

module "ecs" {
  source              = "./modules/ecs"
  prefix              = "queue"
  vpc_id              = "${module.networking.vpc_id}"
  availability_zones  = "${local.production_availability_zones}"
  subnets_ids         = module.networking.private_subnets_id
  public_subnet_ids   = module.networking.public_subnets_id
  security_groups_ids = [
    module.networking.security_groups_ids
  ]
  ecr_url             = "${module.ecr.ecr_url}"
  session_token_aws    = "${var.session_token_aws}"
  access_key_aws       = "${var.access_key_aws}"
  secret_aws           = "${var.secret_aws}"
  execution_arn_role   = "${var.lab_role_arn}"
  order_queue_finished       = "${var.order_queue_finished}"
  order_received        = "${var.order_received}"
  sqs_message_group    = "${var.sqs_message_group}"
  sqs_polling_interval = "${var.sqs_polling_interval}"
  secret_key_jwt_token = "${var.secret_key_jwt_token}"
  depends_on = [
    module.dynamo,
    module.networking
  ]
}
