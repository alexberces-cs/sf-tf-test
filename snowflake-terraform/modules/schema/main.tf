terraform {
  required_providers {
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}

resource "snowflake_schema" "db_schema" {
  name     = var.db_schema_name
  database = var.db_name
}