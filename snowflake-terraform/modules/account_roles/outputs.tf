output "elt_dev_role_name" {
  value = snowflake_account_role.elt_dev_role.name
}

output "bi_dev_role_name" {
  value = snowflakedb.bi_dev_role.name
}