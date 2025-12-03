module "database" {
  source      = "./modules/database"
  dev_db_name = var.dev_db_name
}

module "warehouse" {
  source          = "./modules/warehouse"
  elt_dev_wh_name = var.elt_dev_wh_name
  bi_dev_wh_name  = var.bi_dev_wh_name
}

module "schema" {
  source             = "./modules/schema"
  for_each           = toset(var.dev_db_schema_name)
  dev_db_schema_name = each.key
  dev_db_name        = module.database.dev_db_name
}

module "account_roles" {
  source            = "./modules/account_roles"
  elt_dev_role_name = var.elt_dev_role_name
  bi_dev_role_name  = var.bi_dev_role_name
}

module "database_roles" {
  source               = "./modules/database_roles"
  elt_dev_db_role_name = var.elt_dev_db_role_name
  bi_dev_db_role_name  = var.bi_dev_db_role_name
  dev_db_name          = module.database.dev_db_name
}

module "grants" {
  source               = "./modules/grants"
  elt_dev_role_name    = module.account_roles.elt_dev_role_name
  elt_dev_db_role_name = module.database_roles.elt_dev_db_role_name
  dev_db_name          = module.database.dev_db_name
}