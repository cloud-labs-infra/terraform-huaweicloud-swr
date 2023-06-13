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

variable "retention_policy" {
  description = "Is retention policy enabled?"
  type        = bool
  default     = false
}

variable "retention_policy_type" {
  description = "Specifies the retention policy type"
  type        = string
  default     = "tag_rule"
  validation {
    condition     = contains(["tag_rule", "date_rule"], var.retention_policy_type)
    error_message = "Value options: date_rule, tag_rule."
  }
}

variable "retention_policy_number" {
  description = <<DES
  Specifies the number of retention:

  * If type is set to 'date_rule', it represents the number of retention days;
  * If type is set to 'tag_rule', it represents the retention number.
  DES
  type        = number
  default     = 50
}
