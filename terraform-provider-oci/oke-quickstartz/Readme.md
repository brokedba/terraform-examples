<p align="center"> 

<img src="https://github.com/user-attachments/assets/06ba6698-9c0a-4e3e-bfa1-82fc74395f7f" width="600px" >
</p>
<!-- BEGIN_TF_DOCS -->

Please read my blog for further details [here](https://cloudthrill.ca/my-terraform-oci-oke-quickstart-fork) . 

**Note:** The private endpoint scenario only works from OCI Resource managerfor now . THe bug for the local TF execution is currently being investigated.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2 |
| <a name="requirement_local"></a> [local](#requirement\_local) | ~> 2 |
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | ~> 4, < 5 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | ~> 4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | 4.123.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.2 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.5 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cluster-compartment-policies"></a> [cluster-compartment-policies](#module\_cluster-compartment-policies) | ./modules/oci-policies | n/a |
| <a name="module_cluster-dynamic-group"></a> [cluster-dynamic-group](#module\_cluster-dynamic-group) | ./modules/oci-policies | n/a |
| <a name="module_cluster-tools"></a> [cluster-tools](#module\_cluster-tools) | ./modules/cluster-tools | n/a |
| <a name="module_gateways"></a> [gateways](#module\_gateways) | ./modules/oci-networking/gateway | n/a |
| <a name="module_oke"></a> [oke](#module\_oke) | ./modules/oke | n/a |
| <a name="module_oke_cluster_autoscaler"></a> [oke\_cluster\_autoscaler](#module\_oke\_cluster\_autoscaler) | ./modules/oke-cluster-autoscaler | n/a |
| <a name="module_oke_node_pools"></a> [oke\_node\_pools](#module\_oke\_node\_pools) | ./modules/oke-node-pool | n/a |
| <a name="module_route_tables"></a> [route\_tables](#module\_route\_tables) | ./modules/oci-networking/route_table | n/a |
| <a name="module_security_lists"></a> [security\_lists](#module\_security\_lists) | ./modules/oci-networking/security_list | n/a |
| <a name="module_subnets"></a> [subnets](#module\_subnets) | ./modules/oci-networking/subnet | n/a |
| <a name="module_vault"></a> [vault](#module\_vault) | ./modules/oci-vault-kms | n/a |
| <a name="module_vcn"></a> [vcn](#module\_vcn) | ./modules/oci-networking/vcn | n/a |

## Resources

| Name | Type |
|------|------|
| [oci_identity_compartment.oke_compartment](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_compartment) | resource |
| [random_string.deploy_id](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [tls_private_key.oke_worker_node_ssh_key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [oci_core_services.all_services_network](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/core_services) | data source |
| [oci_identity_regions.home_region](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/identity_regions) | data source |
| [oci_identity_tenancy.tenant_details](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/identity_tenancy) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | Application name. Will be used as prefix to identify resources, such as OKE, VCN, ATP, and others | `string` | `"K8s App"` | no |
| <a name="input_cert_manager_enabled"></a> [cert\_manager\_enabled](#input\_cert\_manager\_enabled) | Enable x509 Certificate Management | `bool` | `false` | no |
| <a name="input_cluster_cni_type"></a> [cluster\_cni\_type](#input\_cluster\_cni\_type) | The CNI type to use for the cluster. Valid values are: FLANNEL\_OVERLAY or OCI\_VCN\_IP\_NATIVE | `string` | `"FLANNEL_OVERLAY"` | no |
| <a name="input_cluster_endpoint_visibility"></a> [cluster\_endpoint\_visibility](#input\_cluster\_endpoint\_visibility) | The Kubernetes cluster that is created will be hosted on a public subnet with a public IP address auto-assigned or on a private subnet. If Private, additional configuration will be necessary to run kubectl commands | `string` | `"Public"` | no |
| <a name="input_cluster_load_balancer_visibility"></a> [cluster\_load\_balancer\_visibility](#input\_cluster\_load\_balancer\_visibility) | The Load Balancer that is created will be hosted on a public subnet with a public IP address auto-assigned or on a private subnet. This affects the Kubernetes services, ingress controller and other load balancers resources | `string` | `"Public"` | no |
| <a name="input_cluster_type"></a> [cluster\_type](#input\_cluster\_type) | The type of OKE cluster to create. Valid values are: BASIC\_CLUSTER or ENHANCED\_CLUSTER | `string` | `"ENHANCED_CLUSTER"` | no |
| <a name="input_cluster_workers_visibility"></a> [cluster\_workers\_visibility](#input\_cluster\_workers\_visibility) | The Kubernetes worker nodes that are created will be hosted in public or private subnet(s) | `string` | `"Private"` | no |
| <a name="input_compartment_ocid"></a> [compartment\_ocid](#input\_compartment\_ocid) | n/a | `any` | n/a | yes |
| <a name="input_create_compartment_policies"></a> [create\_compartment\_policies](#input\_create\_compartment\_policies) | Creates policies that will reside on the compartment. e.g.: Policies to support Cluster Autoscaler, OCI Logging datasource on Grafana | `bool` | `true` | no |
| <a name="input_create_dynamic_group_for_nodes_in_compartment"></a> [create\_dynamic\_group\_for\_nodes\_in\_compartment](#input\_create\_dynamic\_group\_for\_nodes\_in\_compartment) | Creates dynamic group of Nodes in the compartment. Note: You need to have proper rights on the Tenancy. If you only have rights in a compartment, uncheck and ask you administrator to create the Dynamic Group for you | `bool` | `true` | no |
| <a name="input_create_new_compartment_for_oke"></a> [create\_new\_compartment\_for\_oke](#input\_create\_new\_compartment\_for\_oke) | Creates new compartment for OKE Nodes and OCI Services deployed.  NOTE: The creation of the compartment increases the deployment time by at least 3 minutes, and can increase by 15 minutes when destroying | `bool` | `false` | no |
| <a name="input_create_new_encryption_key"></a> [create\_new\_encryption\_key](#input\_create\_new\_encryption\_key) | Creates new vault and key on OCI Vault/Key Management/KMS and assign to boot volume of the worker nodes | `bool` | `false` | no |
| <a name="input_create_new_oke_cluster"></a> [create\_new\_oke\_cluster](#input\_create\_new\_oke\_cluster) | Creates a new OKE cluster, node pool and network resources | `bool` | `true` | no |
| <a name="input_create_new_vcn"></a> [create\_new\_vcn](#input\_create\_new\_vcn) | Creates a new Virtual Cloud Network (VCN). If false, the VCN must be provided in the variable 'existent\_vcn\_ocid'. | `bool` | `true` | no |
| <a name="input_create_pod_network_subnet"></a> [create\_pod\_network\_subnet](#input\_create\_pod\_network\_subnet) | Create PODs Network subnet for OKE. To be used with CNI Type OCI\_VCN\_IP\_NATIVE | `bool` | `false` | no |
| <a name="input_create_subnets"></a> [create\_subnets](#input\_create\_subnets) | Create subnets for OKE: Endpoint, Nodes, Load Balancers. If CNI Type OCI\_VCN\_IP\_NATIVE, also creates the PODs VCN. If FSS Mount Targets, also creates the FSS Mount Targets Subnet | `bool` | `true` | no |
| <a name="input_create_tenancy_policies"></a> [create\_tenancy\_policies](#input\_create\_tenancy\_policies) | Creates policies that need to reside on the tenancy. e.g.: Policies to support OCI Metrics datasource on Grafana | `bool` | `false` | no |
| <a name="input_create_vault_policies_for_group"></a> [create\_vault\_policies\_for\_group](#input\_create\_vault\_policies\_for\_group) | Creates policies to allow the user applying the stack to manage vault and keys. If you are on the Administrators group or already have the policies for a compartment, this policy is not needed. If you do not have access to allow the policy, ask your administrator to include it for you | `bool` | `false` | no |
| <a name="input_existent_dynamic_group_for_nodes_in_compartment"></a> [existent\_dynamic\_group\_for\_nodes\_in\_compartment](#input\_existent\_dynamic\_group\_for\_nodes\_in\_compartment) | Enter previous created Dynamic Group for the policies | `string` | `""` | no |
| <a name="input_existent_encryption_key_id"></a> [existent\_encryption\_key\_id](#input\_existent\_encryption\_key\_id) | Use an existent master encryption key to encrypt boot volume and object storage bucket. NOTE: If the key resides in a different compartment or in a different tenancy, make sure you have the proper policies to access, or the provision of the worker nodes will fail | `string` | `""` | no |
| <a name="input_existent_oke_cluster_id"></a> [existent\_oke\_cluster\_id](#input\_existent\_oke\_cluster\_id) | Using existent OKE Cluster. Only the application and services will be provisioned. If select cluster autoscaler feature, you need to get the node pool id and enter when required | `string` | `""` | no |
| <a name="input_existent_oke_fss_mount_targets_subnet_ocid"></a> [existent\_oke\_fss\_mount\_targets\_subnet\_ocid](#input\_existent\_oke\_fss\_mount\_targets\_subnet\_ocid) | The OCID of the subnet where the Kubernetes FSS mount targets will be hosted | `string` | `""` | no |
| <a name="input_existent_oke_k8s_endpoint_subnet_ocid"></a> [existent\_oke\_k8s\_endpoint\_subnet\_ocid](#input\_existent\_oke\_k8s\_endpoint\_subnet\_ocid) | The OCID of the subnet where the Kubernetes cluster endpoint will be hosted | `string` | `""` | no |
| <a name="input_existent_oke_load_balancer_subnet_ocid"></a> [existent\_oke\_load\_balancer\_subnet\_ocid](#input\_existent\_oke\_load\_balancer\_subnet\_ocid) | The OCID of the subnet where the Kubernetes load balancers will be hosted | `string` | `""` | no |
| <a name="input_existent_oke_nodepool_id_for_autoscaler_1"></a> [existent\_oke\_nodepool\_id\_for\_autoscaler\_1](#input\_existent\_oke\_nodepool\_id\_for\_autoscaler\_1) | Nodepool Id of the existent OKE to use with Cluster Autoscaler (pool1) | `string` | `""` | no |
| <a name="input_existent_oke_nodes_subnet_ocid"></a> [existent\_oke\_nodes\_subnet\_ocid](#input\_existent\_oke\_nodes\_subnet\_ocid) | The OCID of the subnet where the Kubernetes worker nodes will be hosted | `string` | `""` | no |
| <a name="input_existent_oke_vcn_native_pod_networking_subnet_ocid"></a> [existent\_oke\_vcn\_native\_pod\_networking\_subnet\_ocid](#input\_existent\_oke\_vcn\_native\_pod\_networking\_subnet\_ocid) | The OCID of the subnet where the Kubernetes VCN Native Pod Networking will be hosted | `string` | `""` | no |
| <a name="input_existent_vcn_compartment_ocid"></a> [existent\_vcn\_compartment\_ocid](#input\_existent\_vcn\_compartment\_ocid) | Compartment OCID for existent Virtual Cloud Network (VCN). | `string` | `""` | no |
| <a name="input_existent_vcn_ocid"></a> [existent\_vcn\_ocid](#input\_existent\_vcn\_ocid) | Using existent Virtual Cloud Network (VCN) OCID. | `string` | `""` | no |
| <a name="input_extra_initial_node_labels_1"></a> [extra\_initial\_node\_labels\_1](#input\_extra\_initial\_node\_labels\_1) | Extra initial node labels to be added to the node pool 1 | `list` | `[]` | no |
| <a name="input_extra_node_pools"></a> [extra\_node\_pools](#input\_extra\_node\_pools) | Extra node pools to be added to the cluster | `list` | `[]` | no |
| <a name="input_extra_route_tables"></a> [extra\_route\_tables](#input\_extra\_route\_tables) | Extra route tables to be created. | `list` | `[]` | no |
| <a name="input_extra_security_list_name_for_api_endpoint"></a> [extra\_security\_list\_name\_for\_api\_endpoint](#input\_extra\_security\_list\_name\_for\_api\_endpoint) | Extra security list name previosly created to be used by the K8s API Endpoint Subnet. | `any` | `null` | no |
| <a name="input_extra_security_list_name_for_nodes"></a> [extra\_security\_list\_name\_for\_nodes](#input\_extra\_security\_list\_name\_for\_nodes) | Extra security list name previosly created to be used by the Nodes Subnet. | `any` | `null` | no |
| <a name="input_extra_security_list_name_for_vcn_native_pod_networking"></a> [extra\_security\_list\_name\_for\_vcn\_native\_pod\_networking](#input\_extra\_security\_list\_name\_for\_vcn\_native\_pod\_networking) | Extra security list name previosly created to be used by the VCN Native Pod Networking Subnet. | `any` | `null` | no |
| <a name="input_extra_security_lists"></a> [extra\_security\_lists](#input\_extra\_security\_lists) | Extra security lists to be created. | `list` | `[]` | no |
| <a name="input_extra_subnets"></a> [extra\_subnets](#input\_extra\_subnets) | Extra subnets to be created. | `list` | `[]` | no |
| <a name="input_fingerprint"></a> [fingerprint](#input\_fingerprint) | n/a | `string` | `""` | no |
| <a name="input_generate_public_ssh_key"></a> [generate\_public\_ssh\_key](#input\_generate\_public\_ssh\_key) | n/a | `bool` | `true` | no |
| <a name="input_grafana_enabled"></a> [grafana\_enabled](#input\_grafana\_enabled) | Enable Grafana Dashboards. Includes example dashboards and Prometheus, OCI Logging and OCI Metrics datasources | `bool` | `false` | no |
| <a name="input_home_region"></a> [home\_region](#input\_home\_region) | n/a | `string` | `""` | no |
| <a name="input_image_operating_system_1"></a> [image\_operating\_system\_1](#input\_image\_operating\_system\_1) | The OS/image installed on all nodes in the node pool. | `string` | `"Oracle Linux"` | no |
| <a name="input_image_operating_system_version_1"></a> [image\_operating\_system\_version\_1](#input\_image\_operating\_system\_version\_1) | The OS/image version installed on all nodes in the node pool. | `string` | `"8"` | no |
| <a name="input_ingress_cluster_issuer"></a> [ingress\_cluster\_issuer](#input\_ingress\_cluster\_issuer) | Certificate issuer type. Currently supports the free Let's Encrypt and Self-Signed. Only *letsencrypt-prod* generates valid certificates | `string` | `"letsencrypt-prod"` | no |
| <a name="input_ingress_email_issuer"></a> [ingress\_email\_issuer](#input\_ingress\_email\_issuer) | You must replace this email address with your own. The certificate provider will use this to contact you about expiring certificates, and issues related to your account. | `string` | `"no-reply@example.cloud"` | no |
| <a name="input_ingress_hosts"></a> [ingress\_hosts](#input\_ingress\_hosts) | Enter a valid full qualified domain name (FQDN). You will need to map the domain name to the EXTERNAL-IP address on your DNS provider (DNS Registry type - A). If you have multiple domain names, include separated by comma. e.g.: mushop.example.com,catshop.com | `string` | `""` | no |
| <a name="input_ingress_hosts_include_nip_io"></a> [ingress\_hosts\_include\_nip\_io](#input\_ingress\_hosts\_include\_nip\_io) | Include app\_name.HEXXX.nip.io on the ingress hosts. e.g.: mushop.HEXXX.nip.io | `bool` | `true` | no |
| <a name="input_ingress_load_balancer_shape"></a> [ingress\_load\_balancer\_shape](#input\_ingress\_load\_balancer\_shape) | Shape that will be included on the Ingress annotation for the OCI Load Balancer creation | `string` | `"flexible"` | no |
| <a name="input_ingress_load_balancer_shape_flex_max"></a> [ingress\_load\_balancer\_shape\_flex\_max](#input\_ingress\_load\_balancer\_shape\_flex\_max) | Enter the maximum size of the flexible shape (Should be bigger than minimum size). The maximum service limit is set by your tenancy limits. | `string` | `"100"` | no |
| <a name="input_ingress_load_balancer_shape_flex_min"></a> [ingress\_load\_balancer\_shape\_flex\_min](#input\_ingress\_load\_balancer\_shape\_flex\_min) | Enter the minimum size of the flexible shape. | `string` | `"10"` | no |
| <a name="input_ingress_nginx_enabled"></a> [ingress\_nginx\_enabled](#input\_ingress\_nginx\_enabled) | Enable Ingress Nginx for Kubernetes Services (This option provision a Load Balancer) | `bool` | `false` | no |
| <a name="input_ingress_tls"></a> [ingress\_tls](#input\_ingress\_tls) | If enabled, will generate SSL certificates to enable HTTPS for the ingress using the Certificate Issuer | `bool` | `false` | no |
| <a name="input_ipv6private_cidr_blocks"></a> [ipv6private\_cidr\_blocks](#input\_ipv6private\_cidr\_blocks) | The list of one or more ULA or Private IPv6 CIDR blocks for the Virtual Cloud Network (VCN). | `list` | `[]` | no |
| <a name="input_is_ipv6enabled"></a> [is\_ipv6enabled](#input\_is\_ipv6enabled) | Whether IPv6 is enabled for the Virtual Cloud Network (VCN). | `bool` | `false` | no |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | Kubernetes version installed on your Control Plane and worker nodes. If not version select, will use the latest available. | `string` | `"Latest"` | no |
| <a name="input_metrics_server_enabled"></a> [metrics\_server\_enabled](#input\_metrics\_server\_enabled) | Enable Metrics Server for Metrics, HPA, VPA and Cluster Autoscaler | `bool` | `true` | no |
| <a name="input_nip_io_domain"></a> [nip\_io\_domain](#input\_nip\_io\_domain) | Dynamic wildcard DNS for the application hostname. Should support hex notation. e.g.: nip.io | `string` | `"nip.io"` | no |
| <a name="input_node_pool_autoscaler_enabled_1"></a> [node\_pool\_autoscaler\_enabled\_1](#input\_node\_pool\_autoscaler\_enabled\_1) | Enable Cluster Autoscaler on the node pool (pool1). Node pools will auto scale based on the resources usage and will add or remove nodes (Compute) based on the min and max number of nodes | `bool` | `true` | no |
| <a name="input_node_pool_boot_volume_size_in_gbs_1"></a> [node\_pool\_boot\_volume\_size\_in\_gbs\_1](#input\_node\_pool\_boot\_volume\_size\_in\_gbs\_1) | Specify a custom boot volume size (in GB) | `string` | `"60"` | no |
| <a name="input_node_pool_cloud_init_parts_1"></a> [node\_pool\_cloud\_init\_parts\_1](#input\_node\_pool\_cloud\_init\_parts\_1) | Node Pool nodes Cloud init parts | <pre>list(object({<br/>    content_type = string<br/>    content      = string<br/>    filename     = string<br/>  }))</pre> | `[]` | no |
| <a name="input_node_pool_cni_type_1"></a> [node\_pool\_cni\_type\_1](#input\_node\_pool\_cni\_type\_1) | The CNI type to use for the cluster. Valid values are: FLANNEL\_OVERLAY or OCI\_VCN\_IP\_NATIVE | `string` | `"FLANNEL_OVERLAY"` | no |
| <a name="input_node_pool_initial_num_worker_nodes_1"></a> [node\_pool\_initial\_num\_worker\_nodes\_1](#input\_node\_pool\_initial\_num\_worker\_nodes\_1) | The number of worker nodes in the node pool. If enable Cluster Autoscaler, will assume the minimum number of nodes on the node pool to be scheduled by the Kubernetes (pool1) | `number` | `2` | no |
| <a name="input_node_pool_instance_shape_1"></a> [node\_pool\_instance\_shape\_1](#input\_node\_pool\_instance\_shape\_1) | A shape is a template that determines the number of OCPUs, amount of memory, and other resources allocated to a newly created instance for the Worker Node. Select at least 2 OCPUs and 16GB of memory if using Flex shapes | `map(any)` | <pre>{<br/>  "instanceShape": "VM.Standard.E4.Flex",<br/>  "memory": 16,<br/>  "ocpus": 2<br/>}</pre> | no |
| <a name="input_node_pool_max_num_worker_nodes_1"></a> [node\_pool\_max\_num\_worker\_nodes\_1](#input\_node\_pool\_max\_num\_worker\_nodes\_1) | Maximum number of nodes on the node pool to be scheduled by the Kubernetes (pool1) | `number` | `2` | no |
| <a name="input_node_pool_name_1"></a> [node\_pool\_name\_1](#input\_node\_pool\_name\_1) | Name of the node pool 1 | `string` | `"pool1"` | no |
| <a name="input_node_pool_oke_init_params_1"></a> [node\_pool\_oke\_init\_params\_1](#input\_node\_pool\_oke\_init\_params\_1) | OKE Init params | `string` | `""` | no |
| <a name="input_node_pool_shape_specific_ad_1"></a> [node\_pool\_shape\_specific\_ad\_1](#input\_node\_pool\_shape\_specific\_ad\_1) | The number of the AD to get the shape for the node pool | `number` | `0` | no |
| <a name="input_oke_compartment_description"></a> [oke\_compartment\_description](#input\_oke\_compartment\_description) | n/a | `string` | `"Compartment for OKE, Nodes and Services"` | no |
| <a name="input_pods_network_visibility"></a> [pods\_network\_visibility](#input\_pods\_network\_visibility) | The PODs that are created will be hosted on a public subnet with a public IP address auto-assigned or on a private subnet. This affects the Kubernetes services and pods | `string` | `"Private"` | no |
| <a name="input_private_key_path"></a> [private\_key\_path](#input\_private\_key\_path) | n/a | `string` | `""` | no |
| <a name="input_prometheus_enabled"></a> [prometheus\_enabled](#input\_prometheus\_enabled) | Enable Prometheus | `bool` | `false` | no |
| <a name="input_public_ssh_key"></a> [public\_ssh\_key](#input\_public\_ssh\_key) | In order to access your private nodes with a public SSH key you will need to set up a bastion host (a.k.a. jump box). If using public nodes, bastion is not needed. Left blank to not import keys. | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `any` | n/a | yes |
| <a name="input_tag_values"></a> [tag\_values](#input\_tag\_values) | Use Tagging to add metadata to resources. All resources created by this stack will be tagged with the selected tag values. | `map(any)` | <pre>{<br/>  "definedTags": {},<br/>  "freeformTags": {<br/>    "DeploymentType": "generic",<br/>    "Environment": "Development"<br/>  }<br/>}</pre> | no |
| <a name="input_tenancy_ocid"></a> [tenancy\_ocid](#input\_tenancy\_ocid) | ############################################################################### OCI Provider Variables ############################################################################### | `any` | n/a | yes |
| <a name="input_use_encryption_from_oci_vault"></a> [use\_encryption\_from\_oci\_vault](#input\_use\_encryption\_from\_oci\_vault) | By default, Oracle manages the keys that encrypts Kubernetes Secrets at Rest in Etcd, but you can choose a key from a vault that you have access to, if you want greater control over the key's lifecycle and how it's used | `bool` | `false` | no |
| <a name="input_user_admin_group_for_vault_policy"></a> [user\_admin\_group\_for\_vault\_policy](#input\_user\_admin\_group\_for\_vault\_policy) | User Identity Group to allow manage vault and keys. The user running the Terraform scripts or Applying the ORM Stack need to be on this group | `string` | `"Administrators"` | no |
| <a name="input_user_ocid"></a> [user\_ocid](#input\_user\_ocid) | n/a | `string` | `""` | no |
| <a name="input_vcn_cidr_blocks"></a> [vcn\_cidr\_blocks](#input\_vcn\_cidr\_blocks) | IPv4 CIDR Blocks for the Virtual Cloud Network (VCN). If use more than one block, separate them with comma. e.g.: 10.20.0.0/16,10.80.0.0/16. If you plan to peer this VCN with another VCN, the VCNs must not have overlapping CIDRs. | `string` | `"10.20.0.0/16"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_url"></a> [app\_url](#output\_app\_url) | Application URL |
| <a name="output_cluster_type_value"></a> [cluster\_type\_value](#output\_cluster\_type\_value) | n/a |
| <a name="output_comments"></a> [comments](#output\_comments) | OKE Outputs |
| <a name="output_deploy_id"></a> [deploy\_id](#output\_deploy\_id) | n/a |
| <a name="output_deployed_oke_kubernetes_version"></a> [deployed\_oke\_kubernetes\_version](#output\_deployed\_oke\_kubernetes\_version) | n/a |
| <a name="output_deployed_to_region"></a> [deployed\_to\_region](#output\_deployed\_to\_region) | n/a |
| <a name="output_dev"></a> [dev](#output\_dev) | n/a |
| <a name="output_generated_private_key_pem"></a> [generated\_private\_key\_pem](#output\_generated\_private\_key\_pem) | ## Important Security Notice ### The private key generated by this resource will be stored unencrypted in your Terraform state file. Use of this resource for production deployments is not recommended. Instead, generate a private key file outside of Terraform and distribute it securely to the system where Terraform will be run. |
| <a name="output_grafana_admin_password"></a> [grafana\_admin\_password](#output\_grafana\_admin\_password) | Cluster Tools Outputs # grafana |
| <a name="output_grafana_url"></a> [grafana\_url](#output\_grafana\_url) | Grafana Dashboards URL |
| <a name="output_kubeconfig"></a> [kubeconfig](#output\_kubeconfig) | n/a |
| <a name="output_kubeconfig_for_kubectl"></a> [kubeconfig\_for\_kubectl](#output\_kubeconfig\_for\_kubectl) | If using Terraform locally, this command set KUBECONFIG environment variable to run kubectl locally |
| <a name="output_oke_cluster_ocid"></a> [oke\_cluster\_ocid](#output\_oke\_cluster\_ocid) | n/a |
| <a name="output_oke_node_pools"></a> [oke\_node\_pools](#output\_oke\_node\_pools) | n/a |
| <a name="output_stack_version"></a> [stack\_version](#output\_stack\_version) | Deployment outputs |
| <a name="output_subnets"></a> [subnets](#output\_subnets) | n/a |
<!-- END_TF_DOCS -->
