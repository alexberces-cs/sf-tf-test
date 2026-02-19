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

# database privileges
resource "snowflake_grant_privileges_to_database_role" "grant_db_privileges_elt_db_role" {
  privileges         = ["USAGE"]
  database_role_name = var.elt_db_role.fqn
  on_database        = var.elt_db_role.database
}

resource "snowflake_grant_privileges_to_database_role" "grant_db_privileges_bi_db_role" {
  privileges         = ["USAGE"]
  database_role_name = var.bi_db_role.fqn
  on_database        = var.bi_db_role.database
}

# schema privileges
# all schemas in database
resource "snowflake_grant_privileges_to_database_role" "grant_all_schema_privileges_elt_db_role" {
  database_role_name = var.elt_db_role.fqn
  on_schema {
    all_schemas_in_database = var.elt_db_role.database
  }
  all_privileges = true
}

# future schemas in database
resource "snowflake_grant_privileges_to_database_role" "grant_future_schema_privileges_elt_db_role" {
  database_role_name = var.elt_db_role.fqn
  on_schema {
    future_schemas_in_database = var.elt_db_role.database
  }
  all_privileges = true
}