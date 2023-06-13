# Huawei Cloud Software Repository for Container (SWR)
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.4 |
| <a name="requirement_huaweicloud"></a> [huaweicloud](#requirement\_huaweicloud) | ~> 1.47 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_huaweicloud"></a> [huaweicloud](#provider\_huaweicloud) | ~> 1.47 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [huaweicloud_swr_image_retention_policy.main](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/swr_image_retention_policy) | resource |
| [huaweicloud_swr_organization.main](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/swr_organization) | resource |
| [huaweicloud_swr_organization_permissions.main](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/swr_organization_permissions) | resource |
| [huaweicloud_swr_repository.main](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/swr_repository) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_organization_name"></a> [organization\_name](#input\_organization\_name) | Specifies the name of the organization (namespace) the repository belongs | `string` | n/a | yes |
| <a name="input_permissions"></a> [permissions](#input\_permissions) | Specifies the repository name and parameters"<br>  * `user_id` - IAM User ID;<br>  * `user_name` - IAM User name;<br>  * `permission` -the values can be `Manage`, `Write` and `Read`. | <pre>set(object({<br>    user_id    = string<br>    user_name  = optional(string, null)<br>    permission = optional(string, "Read")<br>  }))</pre> | `[]` | no |
| <a name="input_region"></a> [region](#input\_region) | Specifies the region in which to create the resource, if omitted, the provider-level region will be used | `string` | `null` | no |
| <a name="input_repositories"></a> [repositories](#input\_repositories) | Specifies the repository name and parameters"<br>  * `description` - specifies the description of the repository;<br>  * `is_public` - specifies whether the repository is public;<br>  * `category` - the value can be app\_server, linux, framework\_app, database, lang, other, windows, arm. | <pre>map(object({<br>    description = optional(string, null)<br>    is_public   = optional(bool, false)<br>    category    = optional(string, "other")<br>  }))</pre> | `{}` | no |
| <a name="input_retention_policy"></a> [retention\_policy](#input\_retention\_policy) | Is retention policy enabled? | `bool` | `false` | no |
| <a name="input_retention_policy_number"></a> [retention\_policy\_number](#input\_retention\_policy\_number) | Specifies the number of retention:<br><br>  * If type is set to 'date\_rule', it represents the number of retention days;<br>  * If type is set to 'tag\_rule', it represents the retention number. | `number` | `50` | no |
| <a name="input_retention_policy_type"></a> [retention\_policy\_type](#input\_retention\_policy\_type) | Specifies the retention policy type | `string` | `"tag_rule"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_creator"></a> [creator](#output\_creator) | The creator user name of the organization |
| <a name="output_id"></a> [id](#output\_id) | ID of the organization |
| <a name="output_login_server"></a> [login\_server](#output\_login\_server) | The URL that can be used to log into the container registry |
<!-- END_TF_DOCS -->