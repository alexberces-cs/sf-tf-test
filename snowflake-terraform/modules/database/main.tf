terraform {
  required_providers {
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}

resource "snowflake_database" "db" {
  name         = var.db_name
  is_transient = false
}
