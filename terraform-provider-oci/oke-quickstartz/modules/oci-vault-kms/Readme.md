<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1 |
| <a name="requirement_local"></a> [local](#requirement\_local) | ~> 2 |
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | ~> 4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | ~> 4 |
| <a name="provider_oci.home_region"></a> [oci.home\_region](#provider\_oci.home\_region) | ~> 4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [oci_identity_dynamic_group.app_dynamic_group](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_dynamic_group) | resource |
| [oci_identity_policy.app_compartment_policies](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_policy) | resource |
| [oci_identity_policy.kms_user_group_compartment_policies](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_policy) | resource |
| [oci_kms_key.oke_key](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/kms_key) | resource |
| [oci_kms_vault.oke_vault](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/kms_vault) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_compartment_policies"></a> [create\_compartment\_policies](#input\_create\_compartment\_policies) | Creates policies for KMS that will reside on the compartment. | `bool` | `false` | no |
| <a name="input_create_dynamic_group_for_nodes_in_compartment"></a> [create\_dynamic\_group\_for\_nodes\_in\_compartment](#input\_create\_dynamic\_group\_for\_nodes\_in\_compartment) | Creates dynamic group of Nodes in the compartment. Note: You need to have proper rights on the Tenancy. If you only have rights in a compartment, uncheck and ask you administrator to create the Dynamic Group for you | `bool` | `false` | no |
| <a name="input_create_new_encryption_key"></a> [create\_new\_encryption\_key](#input\_create\_new\_encryption\_key) | Creates new vault and key on OCI Vault/Key Management/KMS and assign to boot volume of the worker nodes | `bool` | `false` | no |
| <a name="input_create_vault_policies_for_group"></a> [create\_vault\_policies\_for\_group](#input\_create\_vault\_policies\_for\_group) | Creates policies to allow the user applying the stack to manage vault and keys. If you are on the Administrators group or already have the policies for a compartment, this policy is not needed. If you do not have access to allow the policy, ask your administrator to include it for you | `bool` | `false` | no |
| <a name="input_existent_encryption_key_id"></a> [existent\_encryption\_key\_id](#input\_existent\_encryption\_key\_id) | Use an existent master encryption key to encrypt boot volume and object storage bucket. NOTE: If the key resides in a different compartment or in a different tenancy, make sure you have the proper policies to access, or the provision of the worker nodes will fail | `string` | `""` | no |
| <a name="input_oci_tag_values"></a> [oci\_tag\_values](#input\_oci\_tag\_values) | Tags to be added to the resources | `any` | n/a | yes |
| <a name="input_oke_cluster_compartment_ocid"></a> [oke\_cluster\_compartment\_ocid](#input\_oke\_cluster\_compartment\_ocid) | Compartment OCID used by the OKE Cluster | `string` | n/a | yes |
| <a name="input_tenancy_ocid"></a> [tenancy\_ocid](#input\_tenancy\_ocid) | OCI Provider | `any` | n/a | yes |
| <a name="input_use_encryption_from_oci_vault"></a> [use\_encryption\_from\_oci\_vault](#input\_use\_encryption\_from\_oci\_vault) | By default, Oracle manages the keys that encrypts Kubernetes Secrets at Rest in Etcd, but you can choose a key from a vault that you have access to, if you want greater control over the key's lifecycle and how it's used | `bool` | `false` | no |
| <a name="input_user_admin_group_for_vault_policy"></a> [user\_admin\_group\_for\_vault\_policy](#input\_user\_admin\_group\_for\_vault\_policy) | User Identity Group to allow manage vault and keys. The user running the Terraform scripts or Applying the ORM Stack need to be on this group | `string` | `"Administrators"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_oci_vault_key_id"></a> [oci\_vault\_key\_id](#output\_oci\_vault\_key\_id) | n/a |
<!-- END_TF_DOCS -->