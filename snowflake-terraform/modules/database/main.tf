resource "snowflake_database" "tf_db" {
  name         = var.database_name
  is_transient = false
}
