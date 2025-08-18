terraform {
  required_providers {
    snowflake = {
      source  = "snowflakedb/snowflake"
      version = ">= 2.0.0"
    }
  }
}

provider "snowflake" {
    organization_name = var.snowflake_org
    account_name      = var.snowflake_account
    user              = var.snowflake_user
    role              = var.snowflake_role
    authenticator     = "SNOWFLAKE_JWT"
    private_key       = var.snowflake_private_key
}