<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2 |
| <a name="requirement_local"></a> [local](#requirement\_local) | ~> 2 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | ~> 4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | ~> 2 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | ~> 2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cert-manager"></a> [cert-manager](#module\_cert-manager) | ./modules/cert-manager | n/a |

## Resources

| Name | Type |
|------|------|
| [helm_release.grafana](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.ingress_nginx](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.metrics_server](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.prometheus](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_ingress_v1.grafana](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/ingress_v1) | resource |
| [kubernetes_namespace.cluster_tools](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_secret.grafana](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/data-sources/secret) | data source |
| [kubernetes_service.ingress](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/data-sources/service) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cert_manager_enabled"></a> [cert\_manager\_enabled](#input\_cert\_manager\_enabled) | Enable x509 Certificate Management | `bool` | `true` | no |
| <a name="input_cluster_tools_namespace"></a> [cluster\_tools\_namespace](#input\_cluster\_tools\_namespace) | Namespace | `string` | `"cluster-tools"` | no |
| <a name="input_grafana_enabled"></a> [grafana\_enabled](#input\_grafana\_enabled) | Enable Grafana Dashboards. Includes example dashboards and Prometheus, OCI Logging and OCI Metrics datasources | `bool` | `true` | no |
| <a name="input_ingress_cluster_issuer"></a> [ingress\_cluster\_issuer](#input\_ingress\_cluster\_issuer) | Certificate issuer type. Currently supports the free Let's Encrypt and Self-Signed. Only *letsencrypt-prod* generates valid certificates | `string` | `"letsencrypt-prod"` | no |
| <a name="input_ingress_email_issuer"></a> [ingress\_email\_issuer](#input\_ingress\_email\_issuer) | You must replace this email address with your own. The certificate provider will use this to contact you about expiring certificates, and issues related to your account. | `string` | `"no-reply@example.cloud"` | no |
| <a name="input_ingress_hosts"></a> [ingress\_hosts](#input\_ingress\_hosts) | Enter a valid full qualified domain name (FQDN). You will need to map the domain name to the EXTERNAL-IP address on your DNS provider (DNS Registry type - A). If you have multiple domain names, include separated by comma. e.g.: mushop.example.com,catshop.com | `string` | `""` | no |
| <a name="input_ingress_hosts_include_nip_io"></a> [ingress\_hosts\_include\_nip\_io](#input\_ingress\_hosts\_include\_nip\_io) | Include app\_name.HEXXX.nip.io on the ingress hosts. e.g.: mushop.HEXXX.nip.io | `bool` | `true` | no |
| <a name="input_ingress_load_balancer_shape"></a> [ingress\_load\_balancer\_shape](#input\_ingress\_load\_balancer\_shape) | Shape that will be included on the Ingress annotation for the OCI Load Balancer creation | `string` | `"flexible"` | no |
| <a name="input_ingress_load_balancer_shape_flex_max"></a> [ingress\_load\_balancer\_shape\_flex\_max](#input\_ingress\_load\_balancer\_shape\_flex\_max) | Enter the maximum size of the flexible shape (Should be bigger than minimum size). The maximum service limit is set by your tenancy limits. | `string` | `"100"` | no |
| <a name="input_ingress_load_balancer_shape_flex_min"></a> [ingress\_load\_balancer\_shape\_flex\_min](#input\_ingress\_load\_balancer\_shape\_flex\_min) | Enter the minimum size of the flexible shape. | `string` | `"10"` | no |
| <a name="input_ingress_nginx_enabled"></a> [ingress\_nginx\_enabled](#input\_ingress\_nginx\_enabled) | Enable Ingress Nginx for Kubernetes Services (This option provision a Load Balancer) | `bool` | `true` | no |
| <a name="input_ingress_tls"></a> [ingress\_tls](#input\_ingress\_tls) | If enabled, will generate SSL certificates to enable HTTPS for the ingress using the Certificate Issuer | `bool` | `false` | no |
| <a name="input_metrics_server_enabled"></a> [metrics\_server\_enabled](#input\_metrics\_server\_enabled) | Enable Metrics Server for Metrics, HPA, VPA and Cluster Autoscaler | `bool` | `true` | no |
| <a name="input_nip_io_domain"></a> [nip\_io\_domain](#input\_nip\_io\_domain) | Dynamic wildcard DNS for the application hostname. Should support hex notation. e.g.: nip.io | `string` | `"nip.io"` | no |
| <a name="input_oci_tag_values"></a> [oci\_tag\_values](#input\_oci\_tag\_values) | Tags to be added to the resources | `any` | n/a | yes |
| <a name="input_prometheus_enabled"></a> [prometheus\_enabled](#input\_prometheus\_enabled) | Enable Prometheus | `bool` | `true` | no |
| <a name="input_region"></a> [region](#input\_region) | variable "compartment\_ocid" {} | `any` | n/a | yes |
| <a name="input_tenancy_ocid"></a> [tenancy\_ocid](#input\_tenancy\_ocid) | OCI Provider | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_grafana_admin_password"></a> [grafana\_admin\_password](#output\_grafana\_admin\_password) | n/a |
| <a name="output_ingress_controller_load_balancer_hostname"></a> [ingress\_controller\_load\_balancer\_hostname](#output\_ingress\_controller\_load\_balancer\_hostname) | output "ingress\_controller\_load\_balancer\_ip\_hex" { value = local.ingress\_controller\_load\_balancer\_ip\_hex } |
| <a name="output_ingress_controller_load_balancer_ip"></a> [ingress\_controller\_load\_balancer\_ip](#output\_ingress\_controller\_load\_balancer\_ip) | Outputs |
| <a name="output_url_protocol"></a> [url\_protocol](#output\_url\_protocol) | n/a |
<!-- END_TF_DOCS -->