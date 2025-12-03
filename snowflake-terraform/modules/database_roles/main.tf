terraform {
  required_providers {
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}

resource "snowflake_database_role" "elt_dev_db_role" {
  name     = var.elt_dev_db_role_name
  database = var.dev_db_name
  comment  = "Database Role for ELT developers"
}

resource "snowflake_database_role" "bi_dev_db_role" {
  name     = var.bi_dev_db_role_name
  database = var.dev_db_name
  comment  = "Database Role for BI analysts"
}