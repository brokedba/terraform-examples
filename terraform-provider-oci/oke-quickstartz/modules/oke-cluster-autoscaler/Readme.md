<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2 |
| <a name="requirement_local"></a> [local](#requirement\_local) | ~> 2 |
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | ~> 4, < 5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | ~> 2 |
| <a name="provider_oci"></a> [oci](#provider\_oci) | ~> 4, < 5 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_cluster_role.cluster_autoscaler_cr](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cluster_role) | resource |
| [kubernetes_cluster_role_binding.cluster_autoscaler_crb](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cluster_role_binding) | resource |
| [kubernetes_deployment.cluster_autoscaler_deployment](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment) | resource |
| [kubernetes_role.cluster_autoscaler_role](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/role) | resource |
| [kubernetes_role_binding.cluster_autoscaler_rb](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/role_binding) | resource |
| [kubernetes_service_account_v1.cluster_autoscaler_sa](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account_v1) | resource |
| [oci_containerengine_node_pool_option.node_pool](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/containerengine_node_pool_option) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_autoscaler_extra_args"></a> [cluster\_autoscaler\_extra\_args](#input\_cluster\_autoscaler\_extra\_args) | Extra arguments to pass to OKE cluster autoscaler | `list` | `[]` | no |
| <a name="input_cluster_autoscaler_log_level_verbosity"></a> [cluster\_autoscaler\_log\_level\_verbosity](#input\_cluster\_autoscaler\_log\_level\_verbosity) | Log level verbosity for OKE cluster autoscaler | `number` | `4` | no |
| <a name="input_cluster_autoscaler_max_node_provision_time"></a> [cluster\_autoscaler\_max\_node\_provision\_time](#input\_cluster\_autoscaler\_max\_node\_provision\_time) | Maximum time in minutes for a node to be provisioned. If the node is not ready after this time, it will be deleted and recreated | `string` | `"25m"` | no |
| <a name="input_cluster_autoscaler_num_of_replicas"></a> [cluster\_autoscaler\_num\_of\_replicas](#input\_cluster\_autoscaler\_num\_of\_replicas) | Number of replicas for OKE cluster autoscaler | `number` | `3` | no |
| <a name="input_cluster_autoscaler_scale_down_delay_after_add"></a> [cluster\_autoscaler\_scale\_down\_delay\_after\_add](#input\_cluster\_autoscaler\_scale\_down\_delay\_after\_add) | Time to wait after scale up before attempting to scale down | `string` | `"10m"` | no |
| <a name="input_cluster_autoscaler_scale_down_unneeded_time"></a> [cluster\_autoscaler\_scale\_down\_unneeded\_time](#input\_cluster\_autoscaler\_scale\_down\_unneeded\_time) | Time after which a node should be deleted after it has been unneeded for this long | `string` | `"10m"` | no |
| <a name="input_cluster_autoscaler_supported_k8s_versions"></a> [cluster\_autoscaler\_supported\_k8s\_versions](#input\_cluster\_autoscaler\_supported\_k8s\_versions) | Supported Kubernetes versions for OKE cluster autoscaler | `map(string)` | <pre>{<br/>  "1.23": "1.23.0-4",<br/>  "1.24": "1.24.0-5",<br/>  "1.25": "1.25.0-6",<br/>  "1.26": "1.26.2-7"<br/>}</pre> | no |
| <a name="input_cluster_autoscaler_unremovable_node_recheck_timeout"></a> [cluster\_autoscaler\_unremovable\_node\_recheck\_timeout](#input\_cluster\_autoscaler\_unremovable\_node\_recheck\_timeout) | Time after which a node which failed to be removed is retried | `string` | `"5m"` | no |
| <a name="input_custom_cluster_autoscaler_image"></a> [custom\_cluster\_autoscaler\_image](#input\_custom\_cluster\_autoscaler\_image) | Custom Image for OKE cluster autoscaler | `string` | `""` | no |
| <a name="input_oke_node_pools"></a> [oke\_node\_pools](#input\_oke\_node\_pools) | Node pools (id, min\_nodes, max\_nodes, k8s\_version) to use with Cluster Autoscaler | `list(any)` | `[]` | no |
| <a name="input_region"></a> [region](#input\_region) | OCI Provider | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->