terraform {
  required_providers {
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}

resource "snowflake_account_role" "elt_role" {
  name    = var.elt_role_name
  comment = "Account Role for ELT developers"
}

resource "snowflake_account_role" "bi_role" {
  name    = var.bi_role_name
  comment = "Account Role for BI analysts"
}