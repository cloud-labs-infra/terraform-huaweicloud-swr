resource "huaweicloud_swr_organization" "main" {
  name   = var.organization_name
  region = var.region
}

resource "huaweicloud_swr_repository" "main" {
  for_each = var.repositories

  organization = huaweicloud_swr_organization.main.name
  region       = var.region
  name         = each.key
  description  = each.value.description
  is_public    = each.value.is_public
  category     = each.value.category
}

resource "huaweicloud_swr_organization_permissions" "main" {
  count = length(var.permissions) == 0 ? 0 : 1

  organization = huaweicloud_swr_organization.main.name

  dynamic "users" {
    for_each = var.permissions
    content {
      user_id    = users.value.user_id
      user_name  = users.value.user_name
      permission = users.value.permission
    }
  }
}

resource "huaweicloud_swr_image_retention_policy" "main" {
  for_each = var.retention_policy ? var.repositories : {}

  organization = huaweicloud_swr_organization.main.name
  repository   = each.key
  type         = var.retention_policy_type
  number       = var.retention_policy_number
}
