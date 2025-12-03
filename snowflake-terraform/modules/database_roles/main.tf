terraform {
  required_providers {
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}

resource "snowflake_database_role" "sf_elt_dev_db_role" {
  name     = var.elt_dev_db_role_name
  database = var.database_name
  comment  = "Database Role for ELT developers"
}