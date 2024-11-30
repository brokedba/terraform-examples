<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1 |
| <a name="requirement_local"></a> [local](#requirement\_local) | ~> 2 |
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | ~> 4, < 5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci.home_region"></a> [oci.home\_region](#provider\_oci.home\_region) | ~> 4, < 5 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [oci_identity_dynamic_group.for_policies](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_dynamic_group) | resource |
| [oci_identity_policy.policies](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_compartment_ocid"></a> [compartment\_ocid](#input\_compartment\_ocid) | Compartment OCID where the policies will be created. If not specified, the policies will be created on the Tenancy OCID | `string` | `""` | no |
| <a name="input_create_dynamic_group"></a> [create\_dynamic\_group](#input\_create\_dynamic\_group) | Creates dynamic group to use with policies. Note: You need to have proper rights on the Tenancy. If you only have rights in a compartment, uncheck and ask you administrator to create the Dynamic Group for you | `bool` | `false` | no |
| <a name="input_create_policy"></a> [create\_policy](#input\_create\_policy) | Creates policy. e.g.: Compartment Policies to support Cluster Autoscaler, OCI Logging datasource on Grafana; Tenancy Policies to support OCI Metrics datasource on Grafana | `bool` | `false` | no |
| <a name="input_dynamic_group_main_condition"></a> [dynamic\_group\_main\_condition](#input\_dynamic\_group\_main\_condition) | Main condition for the dynamic group. e.g.: ALL, ANY | `string` | `"ANY"` | no |
| <a name="input_dynamic_group_matching_rules"></a> [dynamic\_group\_matching\_rules](#input\_dynamic\_group\_matching\_rules) | List of matching rules for the dynamic group. e.g.: ["ALL {instance.compartment.id = 'ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxx'}", "ALL {instance.id = 'ocid1.instance.oc1.phx.xxxxxxxx'}"] | `list(string)` | `[]` | no |
| <a name="input_dynamic_group_name"></a> [dynamic\_group\_name](#input\_dynamic\_group\_name) | Name of the dynamic group. e.g.: OKE Cluster Dynamic Group => <app\_name>-oke-cluster-dynamic-group-<deploy\_id> | `string` | `"Dynamic Group"` | no |
| <a name="input_oci_tag_values"></a> [oci\_tag\_values](#input\_oci\_tag\_values) | Tags to be added to the resources | `any` | n/a | yes |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | Name of the policy. e.g.: Compartment Policies => <app\_name>-compartment-policies-<deploy\_id> | `string` | `"Policies"` | no |
| <a name="input_policy_statements"></a> [policy\_statements](#input\_policy\_statements) | List of statements for the compartment policy. e.g.: ["Allow dynamic-group <DynamicGroupName> to manage instances in compartment <compartment>", "Allow dynamic-group <DynamicGroupName> to use instances in compartment <compartment> where ALL {instance.compartment.id = 'ocid1.compartment.oc1..aaaaaaaaxxxxxxxxxxxxxxxx', instance.id = 'ocid1.instance.oc1.phx.xxxxxxxx'}"] | `list(string)` | `[]` | no |
| <a name="input_tenancy_ocid"></a> [tenancy\_ocid](#input\_tenancy\_ocid) | OCI Provider | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_compartment_policy_id"></a> [compartment\_policy\_id](#output\_compartment\_policy\_id) | n/a |
| <a name="output_dynamic_group_id"></a> [dynamic\_group\_id](#output\_dynamic\_group\_id) | n/a |
| <a name="output_dynamic_group_name"></a> [dynamic\_group\_name](#output\_dynamic\_group\_name) | n/a |
<!-- END_TF_DOCS -->