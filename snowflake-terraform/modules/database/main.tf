terraform {
  required_providers {
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}

resource "snowflake_database" "tf_db" {
  name         = var.database_name
  is_transient = false
}
