terraform {
  required_providers {
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}

resource "snowflake_grant_database_role" "grant_elt_dev_db_role" {
  database_role_name = "\"${var.database_name}\".\"${var.elt_dev_db_role_name}\""
  parent_role_name   = var.elt_dev_role_name
}