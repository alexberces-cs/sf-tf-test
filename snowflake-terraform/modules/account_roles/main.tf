terraform {
  required_providers {
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}

resource "snowflake_account_role" "elt_dev_role" {
  name    = var.elt_dev_role_name
  comment = "Account Role for ELT developers"
}

resource "snowflake_account_role" "bi_dev_role" {
  name    = var.bi_dev_role_name
  comment = "Account Role for BI analysts"
}