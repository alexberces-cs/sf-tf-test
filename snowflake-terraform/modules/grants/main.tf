terraform {
  required_providers {
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}

resource "snowflake_grant_database_role" "grant_elt_db_role" {
  database_role_name = var.elt_db_role.fqn
  parent_role_name   = var.elt_role_name
}

resource "snowflake_grant_database_role" "grant_bi_db_role" {
  database_role_name = var.bi_db_role.fqn
  parent_role_name   = var.bi_role_name
}

# privileges
resource "snowflake_grant_privileges_to_database_role" "grant_privileges_elt_db_role" {
  privileges         = ["CREATE", "MONITOR"]
  database_role_name = var.elt_db_role.fqn
  on_database        = var.elt_db_role.database
}

resource "snowflake_grant_privileges_to_database_role" "grant_privileges_bi_db_role" {
  privileges         = ["MONITOR"]
  database_role_name = var.bi_db_role.fqn
  on_database        = var.bi_db_role.database
}