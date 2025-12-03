module "database" {
  source        = "./modules/database"
  database_name = var.database_name
}

module "warehouse" {
  source         = "./modules/warehouse"
  warehouse_name = var.warehouse_name
}

module "schema" {
  source         = "./modules/schema"
  for_each       = toset(var.schema_name)
  schema_name    = each.key
  database_name  = module.database.database_name
}

module "account_roles" {
  source            = "./modules/account_roles"
  elt_dev_role_name = var.elt_dev_role_name
}

module "database_roles" {
  source               = "./modules/database_roles"
  elt_dev_db_role_name = var.elt_dev_db_role_name
  database_name  = module.database.database_name
}

module "grants" {
  source            = "./modules/grants"
  elt_dev_role_name = module.account_roles.elt_dev_role_name
  elt_dev_db_role_name = module.database_roles.elt_dev_db_role_name
  database_name     = module.database.database_name
}