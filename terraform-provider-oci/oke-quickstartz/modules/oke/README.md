# Terraform OKE Submodule

This module deploys an OKE Kubernetes cluster.

## Usage

```hcl
module "oke" {
  source = "./modules/oke"

  providers = {
    oci             = oci
    oci.home_region = oci.home_region
  }

  # Oracle Cloud Infrastructure Tenancy and Compartment OCID
  tenancy_ocid     = var.tenancy_ocid
  compartment_ocid = local.oke_compartment_ocid
  region           = var.region

  # Deployment Tags + Freeform Tags + Defined Tags
  cluster_tags        = local.oci_tag_values
  load_balancers_tags = local.oci_tag_values
  block_volumes_tags  = local.oci_tag_values

  # OKE Cluster
  ## create_new_oke_cluster
  create_new_oke_cluster  = var.create_new_oke_cluster
  existent_oke_cluster_id = var.existent_oke_cluster_id

  ## Network Details
  vcn_id                 = module.vcn.vcn_id
  network_cidrs          = local.network_cidrs
  k8s_endpoint_subnet_id = local.create_subnets ? module.subnets["oke_k8s_endpoint_subnet"].subnet_id : var.existent_oke_k8s_endpoint_subnet_ocid
  lb_subnet_id           = local.create_subnets ? module.subnets["oke_lb_subnet"].subnet_id : var.existent_oke_load_balancer_subnet_ocid
  cni_type               = local.cni_type
  ### Cluster Workers visibility
  cluster_workers_visibility = var.cluster_workers_visibility
  ### Cluster API Endpoint visibility
  cluster_endpoint_visibility = var.cluster_endpoint_visibility

  ## Control Plane Kubernetes Version
  k8s_version = var.k8s_version

  ## Create Dynamic group and Policies for Autoscaler and OCI Metrics and Logging
  create_dynamic_group_for_nodes_in_compartment = var.create_dynamic_group_for_nodes_in_compartment
  create_compartment_policies                   = var.create_compartment_policies

  ## Encryption (OCI Vault/Key Management/KMS)
  oci_vault_key_id_oke_secrets      = module.vault.oci_vault_key_id
  oci_vault_key_id_oke_image_policy = module.vault.oci_vault_key_id
}
```

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
| <a name="provider_local"></a> [local](#provider\_local) | ~> 2 |
| <a name="provider_oci"></a> [oci](#provider\_oci) | ~> 4, < 5 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [local_file.oke_kubeconfig](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [oci_containerengine_cluster.oke_cluster](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/containerengine_cluster) | resource |
| [oci_resourcemanager_private_endpoint.private_kubernetes_endpoint](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/resourcemanager_private_endpoint) | resource |
| [oci_containerengine_cluster_kube_config.oke](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/containerengine_cluster_kube_config) | data source |
| [oci_containerengine_cluster_option.oke](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/containerengine_cluster_option) | data source |
| [oci_containerengine_clusters.oke](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/containerengine_clusters) | data source |
| [oci_identity_availability_domains.ADs](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/identity_availability_domains) | data source |
| [oci_resourcemanager_private_endpoint_reachable_ip.private_kubernetes_endpoint](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/resourcemanager_private_endpoint_reachable_ip) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_block_volumes_tags"></a> [block\_volumes\_tags](#input\_block\_volumes\_tags) | Tags to be added to the block volumes resources | `any` | n/a | yes |
| <a name="input_cluster_endpoint_visibility"></a> [cluster\_endpoint\_visibility](#input\_cluster\_endpoint\_visibility) | The Kubernetes cluster that is created will be hosted on a public subnet with a public IP address auto-assigned or on a private subnet. If Private, additional configuration will be necessary to run kubectl commands | `string` | `"Public"` | no |
| <a name="input_cluster_options_add_ons_is_kubernetes_dashboard_enabled"></a> [cluster\_options\_add\_ons\_is\_kubernetes\_dashboard\_enabled](#input\_cluster\_options\_add\_ons\_is\_kubernetes\_dashboard\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_cluster_options_admission_controller_options_is_pod_security_policy_enabled"></a> [cluster\_options\_admission\_controller\_options\_is\_pod\_security\_policy\_enabled](#input\_cluster\_options\_admission\_controller\_options\_is\_pod\_security\_policy\_enabled) | If true: The pod security policy admission controller will use pod security policies to restrict the pods accepted into the cluster. | `bool` | `false` | no |
| <a name="input_cluster_tags"></a> [cluster\_tags](#input\_cluster\_tags) | Tags to be added to the cluster resources | `any` | n/a | yes |
| <a name="input_cluster_type"></a> [cluster\_type](#input\_cluster\_type) | The type of OKE cluster to create. Valid values are: BASIC\_CLUSTER or ENHANCED\_CLUSTER | `string` | `"BASIC_CLUSTER"` | no |
| <a name="input_cluster_workers_visibility"></a> [cluster\_workers\_visibility](#input\_cluster\_workers\_visibility) | The Kubernetes worker nodes that are created will be hosted in public or private subnet(s) | `string` | `"Private"` | no |
| <a name="input_cni_type"></a> [cni\_type](#input\_cni\_type) | The CNI type to use for the cluster. Valid values are: FLANNEL\_OVERLAY or OCI\_VCN\_IP\_NATIVE | `string` | `"FLANNEL_OVERLAY"` | no |
| <a name="input_compartment_ocid"></a> [compartment\_ocid](#input\_compartment\_ocid) | n/a | `any` | n/a | yes |
| <a name="input_create_new_compartment_for_oke"></a> [create\_new\_compartment\_for\_oke](#input\_create\_new\_compartment\_for\_oke) | Creates new compartment for OKE Nodes and OCI Services deployed.  NOTE: The creation of the compartment increases the deployment time by at least 3 minutes, and can increase by 15 minutes when destroying | `bool` | `false` | no |
| <a name="input_create_new_oke_cluster"></a> [create\_new\_oke\_cluster](#input\_create\_new\_oke\_cluster) | Creates a new OKE cluster and node pool | `bool` | `false` | no |
| <a name="input_create_orm_private_endpoint"></a> [create\_orm\_private\_endpoint](#input\_create\_orm\_private\_endpoint) | Creates a new private endpoint for the OKE cluster | `bool` | `false` | no |
| <a name="input_create_vault_policies_for_group"></a> [create\_vault\_policies\_for\_group](#input\_create\_vault\_policies\_for\_group) | Creates policies to allow the user applying the stack to manage vault and keys. If you are on the Administrators group or already have the policies for a compartment, this policy is not needed. If you do not have access to allow the policy, ask your administrator to include it for you | `bool` | `false` | no |
| <a name="input_existent_oke_cluster_id"></a> [existent\_oke\_cluster\_id](#input\_existent\_oke\_cluster\_id) | Using existent OKE Cluster. Only the application and services will be provisioned. If select cluster autoscaler feature, you need to get the node pool id and enter when required | `string` | `""` | no |
| <a name="input_existent_oke_cluster_private_endpoint"></a> [existent\_oke\_cluster\_private\_endpoint](#input\_existent\_oke\_cluster\_private\_endpoint) | Resource Manager Private Endpoint to access the OKE Private Cluster | `string` | `""` | no |
| <a name="input_k8s_endpoint_subnet_id"></a> [k8s\_endpoint\_subnet\_id](#input\_k8s\_endpoint\_subnet\_id) | Kubernetes Endpoint Subnet OCID to deploy OKE Cluster | `any` | n/a | yes |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | Kubernetes version installed on your Control Plane | `string` | `"Latest"` | no |
| <a name="input_lb_subnet_id"></a> [lb\_subnet\_id](#input\_lb\_subnet\_id) | Load Balancer Subnet OCID to deploy OKE Cluster | `any` | n/a | yes |
| <a name="input_load_balancers_tags"></a> [load\_balancers\_tags](#input\_load\_balancers\_tags) | Tags to be added to the load balancers resources | `any` | n/a | yes |
| <a name="input_network_cidrs"></a> [network\_cidrs](#input\_network\_cidrs) | n/a | `any` | n/a | yes |
| <a name="input_oci_vault_key_id_oke_image_policy"></a> [oci\_vault\_key\_id\_oke\_image\_policy](#input\_oci\_vault\_key\_id\_oke\_image\_policy) | OCI Vault OCID for the Image Policy | `any` | `null` | no |
| <a name="input_oci_vault_key_id_oke_secrets"></a> [oci\_vault\_key\_id\_oke\_secrets](#input\_oci\_vault\_key\_id\_oke\_secrets) | OCI Vault OCID to encrypt OKE secrets. If not provided, the secrets will be encrypted with the default key | `any` | `null` | no |
| <a name="input_oke_compartment_description"></a> [oke\_compartment\_description](#input\_oke\_compartment\_description) | n/a | `string` | `"Compartment for OKE, Nodes and Services"` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `any` | n/a | yes |
| <a name="input_show_advanced"></a> [show\_advanced](#input\_show\_advanced) | ORM Schema visual control variables | `bool` | `false` | no |
| <a name="input_tenancy_ocid"></a> [tenancy\_ocid](#input\_tenancy\_ocid) | OCI Provider | `any` | n/a | yes |
| <a name="input_user_admin_group_for_vault_policy"></a> [user\_admin\_group\_for\_vault\_policy](#input\_user\_admin\_group\_for\_vault\_policy) | User Identity Group to allow manage vault and keys. The user running the Terraform scripts or Applying the ORM Stack need to be on this group | `string` | `"Administrators"` | no |
| <a name="input_vcn_id"></a> [vcn\_id](#input\_vcn\_id) | VCN OCID to deploy OKE Cluster | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_comments"></a> [comments](#output\_comments) | n/a |
| <a name="output_deployed_oke_kubernetes_version"></a> [deployed\_oke\_kubernetes\_version](#output\_deployed\_oke\_kubernetes\_version) | n/a |
| <a name="output_deployed_to_region"></a> [deployed\_to\_region](#output\_deployed\_to\_region) | n/a |
| <a name="output_dev"></a> [dev](#output\_dev) | n/a |
| <a name="output_kubeconfig"></a> [kubeconfig](#output\_kubeconfig) | n/a |
| <a name="output_kubeconfig_for_kubectl"></a> [kubeconfig\_for\_kubectl](#output\_kubeconfig\_for\_kubectl) | If using Terraform locally, this command set KUBECONFIG environment variable to run kubectl locally |
| <a name="output_oke_cluster_compartment_ocid"></a> [oke\_cluster\_compartment\_ocid](#output\_oke\_cluster\_compartment\_ocid) | Compartment OCID used by the OKE Cluster |
| <a name="output_oke_cluster_ocid"></a> [oke\_cluster\_ocid](#output\_oke\_cluster\_ocid) | OKE Cluster OCID |
| <a name="output_orm_private_endpoint_oke_api_ip_address"></a> [orm\_private\_endpoint\_oke\_api\_ip\_address](#output\_orm\_private\_endpoint\_oke\_api\_ip\_address) | OCI Resource Manager Private Endpoint ip address for OKE Kubernetes API Private Endpoint |
<!-- END_TF_DOCS -->