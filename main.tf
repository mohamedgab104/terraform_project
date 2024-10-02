provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./vpc"
}

module "frontend" {
  source    = "./frontend"
  vpc_id    = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnet_ids
}

module "backend" {
  source    = "./backend"
  vpc_id    = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnet_ids
}

output "frontend_load_balancer_dns" {
  value = module.frontend.load_balancer_dns
}

output "backend_load_balancer_dns" {
  value = module.backend.load_balancer_dns
}

