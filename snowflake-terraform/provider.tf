terraform {
  required_providers {
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}

/*
provider "snowflake" {
  organization_name = var.snowflake_org
  account_name      = var.snowflake_account
  user              = var.snowflake_user
  role              = var.snowflake_role
  authenticator     = "SNOWFLAKE_JWT"
  private_key       = var.snowflake_private_key
}*/

/* for local testing purposes*/
provider "snowflake" {
  organization_name = "DETUXDN"
  account_name      = "BP08388"
  user              = "TERRAFORM_SVC"
  role              = "TERRAFORM_ROLE"
  authenticator     = "SNOWFLAKE_JWT"
  private_key       = file("~/.ssh/snowflake_tf_snow_key.p8")
}
