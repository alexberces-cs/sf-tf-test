terraform {
  required_providers {
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}

resource "snowflake_schema" "dev_db_schema" {
  name     = var.dev_db_schema_name
  database = var.dev_db_name
}