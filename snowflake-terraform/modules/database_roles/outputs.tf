output "elt_dev_db_role_name" {
  value = snowflake_database_role.elt_dev_db_role.name
}

output "bi_dev_db_role_name" {
  value = snowflake_database_role.bi_dev_db_role.name
}