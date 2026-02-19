variable "elt_role_name" {}
variable "bi_role_name" {}

variable "elt_db_role" {
  type = object({
    database = string
    name     = string
    fqn      = string
  })
}

variable "bi_db_role" {
  type = object({
    database = string
    name     = string
    fqn      = string
  })
}