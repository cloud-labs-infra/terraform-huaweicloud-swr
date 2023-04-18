output "id" {
  description = "ID of the organization"
  value       = huaweicloud_swr_organization.main.id
}

output "creator" {
  description = "The creator user name of the organization"
  value       = huaweicloud_swr_organization.main.creator
}

output "login_server" {
  description = " The URL that can be used to log into the container registry"
  value       = huaweicloud_swr_organization.main.login_server
}
