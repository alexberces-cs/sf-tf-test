terraform {
  required_providers {
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}

resource "snowflake_warehouse" "elt_dev_wh" {
  name                      = var.elt_dev_wh_name
  warehouse_type            = "STANDARD"
  warehouse_size            = "XSMALL"
  max_cluster_count         = 1
  min_cluster_count         = 1
  auto_suspend              = 60
  auto_resume               = true
  enable_query_acceleration = false
  initially_suspended       = true
}

resource "snowflake_warehouse" "bi_dev_wh" {
  name                      = var.bi_dev_wh_name
  warehouse_type            = "STANDARD"
  warehouse_size            = "XSMALL"
  max_cluster_count         = 1
  min_cluster_count         = 1
  auto_suspend              = 60
  auto_resume               = true
  enable_query_acceleration = false
  initially_suspended       = true
}