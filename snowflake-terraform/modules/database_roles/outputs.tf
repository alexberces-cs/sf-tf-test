output "elt_db_role_name" {
  value = snowflake_database_role.elt_db_role.name
}

output "bi_db_role_name" {
  value = snowflake_database_role.bi_db_role.name
}