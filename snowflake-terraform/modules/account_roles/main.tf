terraform {
  required_providers {
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}

resource "snowflake_account_role" "sf_elt_dev_role" {
  name    = var.elt_dev_role_name
  comment = "Account Role for ELT developers"
}