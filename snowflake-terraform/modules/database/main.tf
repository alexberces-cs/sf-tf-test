terraform {
  required_providers {
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}

resource "snowflake_database" "dev_db" {
  name         = var.dev_db_name
  is_transient = false
}
