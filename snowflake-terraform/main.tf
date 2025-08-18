module "database" {
  source       = "./modules/database"
  database_name = var.database_name
}

module "warehouse" {
  source        = "./modules/warehouse"
  warehouse_name = var.warehouse_name
}
