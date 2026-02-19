module "database" {
  source  = "./modules/database"
  db_name = var.db_name
}

module "warehouse" {
  source      = "./modules/warehouse"
  elt_wh_name = var.elt_wh_name
  bi_wh_name  = var.bi_wh_name
}

module "schema" {
  source         = "./modules/schema"
  for_each       = toset(var.db_schema_name)
  db_schema_name = each.key
  db_name        = module.database.db_name
}

module "account_roles" {
  source        = "./modules/account_roles"
  elt_role_name = var.elt_role_name
  bi_role_name  = var.bi_role_name
}

module "database_roles" {
  source           = "./modules/database_roles"
  elt_db_role_name = var.elt_db_role_name
  bi_db_role_name  = var.bi_db_role_name
  db_name          = module.database.db_name
}

module "grants" {
  source           = "./modules/grants"
  elt_role_name    = module.account_roles.elt_role_name
  bi_role_name     = module.account_roles.bi_role_name
  elt_db_role      = module.database_roles.elt_db_role
  bi_db_role       = module.database_roles.bi_db_role
}