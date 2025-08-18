terraform {
  required_providers {
    snowflake = {
      source  = "snowflakedb/snowflake"
      version = ">= 2.0.0"
    }
  }
}

locals {
  organization_name = "vjzpvuk"
  account_name      = "pb11640"
  private_key_path  = "~/.ssh/snowflake_tf_snow_key.p8"
}

provider "snowflake" {
    account           = var.snowflake_account
    user              = var.snowflake_user
    role              = var.snowflake_role
    private_key       = base64decode(var.snowflake_private_key)
}