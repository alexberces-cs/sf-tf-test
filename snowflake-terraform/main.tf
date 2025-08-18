module "database" {
  source        = "./modules/database"
  providers     = {
    snowflake = snowflake
  }
  database_name = var.database_name
}

module "warehouse" {
  source         = "./modules/warehouse"
  providers      = {
    snowflake = snowflake
  }
  warehouse_name = var.warehouse_name
}
