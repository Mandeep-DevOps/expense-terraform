module "vpc" {
  source       = "./modules/vpc"
  for_each     = var.vpc
# vpc_cidr     = each.value["vpc_cidr"]
  vpc_cidr     = lookup(each.value, "vpc_cidr", null)
# subnets_cidr = each.value["subnets_cidr"]
  subnets_cidr = lookup(each.value, "subnets_cidr", null)
# az           = each.value["az"]
  az           = lookup(each.value, "az" , null)

  env          = var.env
  project_name = var.project_name
}