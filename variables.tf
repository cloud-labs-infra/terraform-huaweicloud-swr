variable "organization_name" {
  description = "Specifies the name of the organization (namespace) the repository belongs"
  type        = string
  nullable    = false
}

variable "region" {
  description = "Specifies the region in which to create the resource, if omitted, the provider-level region will be used"
  type        = string
  default     = null
}

variable "repositories" {
  description = <<DES
  Specifies the repository name and parameters"
  * `description` - specifies the description of the repository;
  * `is_public` - specifies whether the repository is public;
  * `category` - the value can be app_server, linux, framework_app, database, lang, other, windows, arm.
  DES
  type = map(object({
    description = optional(string, null)
    is_public   = optional(bool, false)
    category    = optional(string, "other")
  }))
  default = {}
}

variable "permissions" {
  description = <<DES
  Specifies the repository name and parameters"
  * `user_id` - IAM User ID;
  * `user_name` - IAM User name;
  * `permission` -the values can be `Manage`, `Write` and `Read`.
  DES
  type = set(object({
    user_id    = string
    user_name  = optional(string, null)
    permission = optional(string, "Read")
  }))
  default = []
}
