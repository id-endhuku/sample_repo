
# Create the VPC network
module "vpc" {
  source = "./vpc"
  name   = "my-vpc-network"
}

# Create the firewall rule
module "firewall" {
  source   = "./firewall"
  network  = module.vpc.network
  http_allowed = true
}

# Create the application tier
module "app_tier" {
  source          = "./tier"
  name            = "app"
  instance_count  = var.app_instance_count
  instance_type   = var.app_instance_type
  instance_image  = var.app_instance_image
  data_disk       = var.app_instance_data_disk
  service_account = var.service_account
  scopes          = var.scopes
  network         = module.vpc.network
  subnetwork      = module.vpc.subnetwork_app
}

# Create the database tier
module "db_tier" {
  source          = "./tier"
  name            = "db"
  instance_count  = var.db_instance_count
  instance_type   = var.db_instance_type
  instance_image  = var.db_instance_image
  data_disk       = var.db_instance_data_disk
  service_account = var.service_account
  scopes          = var.scopes
  network         = module.vpc.network
  subnetwork      = module.vpc.subnetwork_db
}

# Create the load balancer
module "lb" {
  source = "./lb"
  name = "lb"
  instances = module.app_tier.instances
}

