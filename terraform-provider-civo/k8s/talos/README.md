# My Terraform Template for Civo Kubernetes Cluster (Talos)

## 🚀 Overview
This repository provides a **lightweight Terraform template** to deploy a **Talos Kubernetes cluster** on **Civo Cloud**, enhanced with:
- ✅ Traefik as the Ingress Controller
- ✅ Cert-Manager with Self-Signed/ketsEncrypt TLS
- ✅ Clean, modular structure with monitoring stack included 

## 📋 What's Included
- ✅ **Civo Kubernetes (Talos) Cluster**
- ✅ **Traefik** Ingress Controller (via Helm)
- ✅ **Cert-Manager** for TLS certificates
- ✅ **Self-Signed ClusterIssuer** setup
- ✅ **LetsEncrypt http01 ClusterIssuer** setup
- ✅ **Grafana**
- ✅ **Prometheus**
- ✅ **Minimal setup** — easy to customize

## 🔧 Prerequisites
- [Terraform](https://developer.hashicorp.com/terraform/downloads) (>= 1.5)
- [kubectl](https://kubernetes.io/docs/tasks/tools/) (>= 1.25)
- [Helm](https://helm.sh/docs/intro/install/) (>= 3.10)
- [Civo Account](https://www.civo.com/signup) with API Key

---

## ⚡ Quick Start

### 1️⃣ Clone the repository
```bash
git clone https://github.com/brokedba/terraform-examples.git
cd terraform-examples/terraform-provider-civo/k8s/talos
```

### 2️⃣ Set up your variables
Create a terraform.tfvars or env-vars file:

```hcl
export CIVO_TOKEN="YOUR_CIVO_API_KEY"
export TF_VAR_region="NYC1"
export TF_VAR_compute_type="standard"
export TF_VAR_cluster_node_count=2
export TF_VAR_cluster_name_prefix="cloudthrill"
export TF_VAR_kubernetes_version="talos-v1.5.0"
export TF_VAR_label="k8s-pool" 
export TF_VAR_kubernetes_namespace="my-namespace"
### NETWORK ####
export TF_VAR_network_name="default"
export TF_VAR_network_cidr="10.20.0.0/16"
# Monitoring
export TF_VAR_grafana_enabled="true"  
export TF_VAR_prometheus_enabled="true"
export TF_VAR_app_name="grafana"
export TF_VAR_metrics_server_enabled="true"
export TF_VAR_ingress_email_issuer="no-reply@example.cloud"
# cluster_node_size="g4s.kube.medium"
```
Or use a source file using TF_VAR exports:
```bash
export CIVO_TOKEN="your-civo-api-key"
export TF_VAR_region="NYC1"
export TF_VAR_grafana_enabled="true"  
export TF_VAR_prometheus_enabled="true"
```
### 3️⃣ Deploy the cluster
```bash 
terraform init
terraform apply -auto-approve
```
### monitor the cluster
![WhatsApp Image 2025-04-30 at 11 54 34_e7656662](https://github.com/user-attachments/assets/bc759be4-2dda-480a-b00a-68e6f1c307b3)
![WhatsApp Image 2025-04-30 at 11 56 21_6811d470](https://github.com/user-attachments/assets/73870670-1d88-4505-bc4a-630c1ab511a0)
![WhatsApp Image 2025-04-30 at 12 01 34_ce03c190](https://github.com/user-attachments/assets/5af6c84d-eca5-4ef5-80ac-137d5be6121c)
![WhatsApp Image 2025-04-30 at 19 03 10_b4b00265](https://github.com/user-attachments/assets/1d5e27a7-5b6e-47fa-b236-e79ba6287af6)

## TLS troubleshooting: 
1. If a Let's Encrypt certificate fails with an invalid Order error 400 that's either because the issuer or cet-manager weren't 100 ready while grafana ingress was being deployed
**Slution**:
redeploy using terraform replace the ingress resource
```bash
$ terraform apply -replace=kubernetes_ingress_v1.grafana[0]
...

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
```
2. Rate Limit:
   
Up to 10000 certificates can be issued per registered domain (i.e we used nip.io) every 7 days. When this limit is reached you need to wait
```Error
Failed to create Order: 429 urn:ietf:params:acme:error:rateLimited: too many certificates (10000) already issued for "nip.io"
```
## PodSecurity Restrictions fails node-exporter creation
due to [extra privilege necessary](https://kubernetes.io/docs/concepts/security/pod-security-policy/#run-another-pod) to create node exporter pods that scrape Hostnetwork and HostPID metrics , I had to add a label for cluster-tools namespace to make it work.
```
Error creating: pods "prometheus-prometheus-node-exporter-b6jmf" is forbidden: violates PodSecurity "baseline:latest": host namespaces (hostNetwork=true, hostPID=true), hostPath volumes (volumes "proc", "sys", "root"), hostPort (container "node-exporter" uses hostPort 9100)
```
**Namespace Pod Secuirity label**
```hcl
resource "kubernetes_namespace" "cluster_tools" {
  metadata {
    name = var.cluster_tools_namespace
    # allow for privileged prometheus-node-exporter to scrape Hostnetwork & HostPID metrics
     labels = {
      "pod-security.kubernetes.io/enforce" = "privileged"
    # }
  }
```
## 🛠 Future Enhancements 
- Add External DNS integration
- Enable ArgoCD
- Deploy `kube-prometheus-stack`

## Contributions are welcome 🫶🏻
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_civo"></a> [civo](#requirement\_civo) | 1.1.4 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.10.1 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | >= 1.19.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.22.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | 2.4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_civo"></a> [civo](#provider\_civo) | 1.1.4 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.10.1 |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | 1.19.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.22.0 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.4.0 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [civo_firewall.firewall](https://registry.terraform.io/providers/civo/civo/1.1.4/docs/resources/firewall) | resource |
| [civo_firewall.firewall-ingress](https://registry.terraform.io/providers/civo/civo/1.1.4/docs/resources/firewall) | resource |
| [civo_kubernetes_cluster.cluster](https://registry.terraform.io/providers/civo/civo/1.1.4/docs/resources/kubernetes_cluster) | resource |
| [civo_network.network](https://registry.terraform.io/providers/civo/civo/1.1.4/docs/resources/network) | resource |
| [civo_object_store.template](https://registry.terraform.io/providers/civo/civo/1.1.4/docs/resources/object_store) | resource |
| [helm_release.cert_manager](https://registry.terraform.io/providers/hashicorp/helm/2.10.1/docs/resources/release) | resource |
| [helm_release.grafana](https://registry.terraform.io/providers/hashicorp/helm/2.10.1/docs/resources/release) | resource |
| [helm_release.metrics_server](https://registry.terraform.io/providers/hashicorp/helm/2.10.1/docs/resources/release) | resource |
| [helm_release.prometheus](https://registry.terraform.io/providers/hashicorp/helm/2.10.1/docs/resources/release) | resource |
| [helm_release.traefik_ingress](https://registry.terraform.io/providers/hashicorp/helm/2.10.1/docs/resources/release) | resource |
| [kubectl_manifest.app_certificate](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.grafana_replace_path](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.letsencrypt_prod_issuer](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.self_signed_cluster_issuer](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubernetes_deployment.nginx](https://registry.terraform.io/providers/hashicorp/kubernetes/2.22.0/docs/resources/deployment) | resource |
| [kubernetes_ingress_v1.grafana](https://registry.terraform.io/providers/hashicorp/kubernetes/2.22.0/docs/resources/ingress_v1) | resource |
| [kubernetes_namespace.cluster_tools](https://registry.terraform.io/providers/hashicorp/kubernetes/2.22.0/docs/resources/namespace) | resource |
| [kubernetes_namespace.landing_ns](https://registry.terraform.io/providers/hashicorp/kubernetes/2.22.0/docs/resources/namespace) | resource |
| [kubernetes_secret.object_store_access](https://registry.terraform.io/providers/hashicorp/kubernetes/2.22.0/docs/resources/secret) | resource |
| [local_file.cluster-config](https://registry.terraform.io/providers/hashicorp/local/2.4.0/docs/resources/file) | resource |
| [null_resource.wait_for_letsencrypt_prod_issuer_ready](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [civo_kubernetes_cluster.cluster](https://registry.terraform.io/providers/civo/civo/1.1.4/docs/data-sources/kubernetes_cluster) | data source |
| [civo_kubernetes_version.latest_talos](https://registry.terraform.io/providers/civo/civo/1.1.4/docs/data-sources/kubernetes_version) | data source |
| [civo_network.existing](https://registry.terraform.io/providers/civo/civo/1.1.4/docs/data-sources/network) | data source |
| [civo_object_store_credential.object_store](https://registry.terraform.io/providers/civo/civo/1.1.4/docs/data-sources/object_store_credential) | data source |
| [civo_size.ai](https://registry.terraform.io/providers/civo/civo/1.1.4/docs/data-sources/size) | data source |
| [civo_size.standard](https://registry.terraform.io/providers/civo/civo/1.1.4/docs/data-sources/size) | data source |
| [kubernetes_secret.grafana](https://registry.terraform.io/providers/hashicorp/kubernetes/2.22.0/docs/data-sources/secret) | data source |
| [kubernetes_service.traefik](https://registry.terraform.io/providers/hashicorp/kubernetes/2.22.0/docs/data-sources/service) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | Application name used for generating nip.io domains. | `string` | `"grafana"` | no |
| <a name="input_applications"></a> [applications](#input\_applications) | Comma Separated list of Application to be installed | `string` | `"metrics-server,cert-manager,traefik2-nodeport"` | no |
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | ################################## Cert Manager Variables  # ################################### | `string` | `"1.15.3"` | no |
| <a name="input_cluster_name_prefix"></a> [cluster\_name\_prefix](#input\_cluster\_name\_prefix) | Prefix to append to the name of the cluster being created | `string` | `"cloudthrill2"` | no |
| <a name="input_cluster_node_count"></a> [cluster\_node\_count](#input\_cluster\_node\_count) | Number of nodes in the default pool | `number` | `2` | no |
| <a name="input_cluster_node_size"></a> [cluster\_node\_size](#input\_cluster\_node\_size) | The size of the nodes to provision. Run `civo size list` for all options | `string` | `""` | no |
| <a name="input_cluster_tools_namespace"></a> [cluster\_tools\_namespace](#input\_cluster\_tools\_namespace) | n/a | `string` | `"cluster-tools"` | no |
| <a name="input_cluster_type"></a> [cluster\_type](#input\_cluster\_type) | The type of Kubernetes cluster to create | `string` | `"talos"` | no |
| <a name="input_cluster_web_access"></a> [cluster\_web\_access](#input\_cluster\_web\_access) | List of Subnets allowed to access port 80 via the Load Balancer | `list(any)` | <pre>[<br/>  "0.0.0.0/0"<br/>]</pre> | no |
| <a name="input_cluster_websecure_access"></a> [cluster\_websecure\_access](#input\_cluster\_websecure\_access) | List of Subnets allowed to access port 443 via the Load Balancer | `list(any)` | <pre>[<br/>  "0.0.0.0/0"<br/>]</pre> | no |
| <a name="input_cni"></a> [cni](#input\_cni) | The cni for the k3s to install | `string` | `"flannel"` | no |
| <a name="input_compute_type"></a> [compute\_type](#input\_compute\_type) | The type of compute to use for the cluster, e.g., 'ai' or 'standard'. | `string` | `"standard"` | no |
| <a name="input_grafana_enabled"></a> [grafana\_enabled](#input\_grafana\_enabled) | Enable Grafana Dashboards. Includes example dashboards and Prometheus, OCI Logging and OCI Metrics datasources | `bool` | `true` | no |
| <a name="input_ingress_cluster_issuer"></a> [ingress\_cluster\_issuer](#input\_ingress\_cluster\_issuer) | Certificate issuer type. Currently supports the free Let's Encrypt and Self-Signed. Only *letsencrypt-prod* generates valid certificates | `string` | `"letsencrypt-prod"` | no |
| <a name="input_ingress_email_issuer"></a> [ingress\_email\_issuer](#input\_ingress\_email\_issuer) | You must replace this email address with your own. The certificate provider will use this to contact you about expiring certificates, and issues related to your account. | `string` | `"no-reply@example.cloud"` | no |
| <a name="input_ingress_hosts"></a> [ingress\_hosts](#input\_ingress\_hosts) | Comma-separated list of FQDNs for the ingress. Example: app1.example.com,app2.example.com | `string` | `""` | no |
| <a name="input_ingress_hosts_include_nip_io"></a> [ingress\_hosts\_include\_nip\_io](#input\_ingress\_hosts\_include\_nip\_io) | Whether to include a dynamic nip.io domain in the ingress hosts. | `bool` | `true` | no |
| <a name="input_kubernetes_api_access"></a> [kubernetes\_api\_access](#input\_kubernetes\_api\_access) | List of Subnets allowed to access the Kube API | `list(any)` | <pre>[<br/>  "0.0.0.0/0"<br/>]</pre> | no |
| <a name="input_kubernetes_namespace"></a> [kubernetes\_namespace](#input\_kubernetes\_namespace) | The name of the Kubernetes namespace to create | `string` | `"my-namespace"` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | The version of Kubernetes to use | `string` | `"talos-v1.5.0"` | no |
| <a name="input_label"></a> [label](#input\_label) | Node pool label. If not provided, a default label will be generated. | `string` | `"k8s-pool"` | no |
| <a name="input_metrics_server_enabled"></a> [metrics\_server\_enabled](#input\_metrics\_server\_enabled) | Enable Metrics Server for Metrics, HPA, VPA and Cluster Autoscaler | `bool` | `true` | no |
| <a name="input_network_cidr"></a> [network\_cidr](#input\_network\_cidr) | The CIDR block for the network | `string` | `"10.20.0.0/16"` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | The name of the network | `string` | `"default"` | no |
| <a name="input_nip_io_domain"></a> [nip\_io\_domain](#input\_nip\_io\_domain) | Dynamic wildcard DNS domain for nip.io. | `string` | `"nip.io"` | no |
| <a name="input_node_pool_labels"></a> [node\_pool\_labels](#input\_node\_pool\_labels) | Additional labels for the node pool. | `map(string)` | `{}` | no |
| <a name="input_object_store_enabled"></a> [object\_store\_enabled](#input\_object\_store\_enabled) | Should an object store be configured | `bool` | `false` | no |
| <a name="input_object_store_prefix"></a> [object\_store\_prefix](#input\_object\_store\_prefix) | Prefix to append to the name of the object store being created | `string` | `"tf-template-"` | no |
| <a name="input_object_store_size"></a> [object\_store\_size](#input\_object\_store\_size) | Size of the Object Store to create (multiples of 500) | `number` | `500` | no |
| <a name="input_prometheus_enabled"></a> [prometheus\_enabled](#input\_prometheus\_enabled) | Enable Prometheus | `bool` | `true` | no |
| <a name="input_region"></a> [region](#input\_region) | The region to provision the cluster against | `string` | `"NYC1"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags | `string` | `"terraform"` | no |
| <a name="input_taints"></a> [taints](#input\_taints) | A list of taints to apply to the nodes in the node pool. | `list` | <pre>[<br/>  {<br/>    "effect": "NoSchedule",<br/>    "key": "My-app-workload",<br/>    "value": "frontend"<br/>  }<br/>]</pre> | no |
| <a name="input_telemetry_namespace"></a> [telemetry\_namespace](#input\_telemetry\_namespace) | The name of the telemetry namespace | `string` | `"telemetry-ns"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_installed_applications"></a> [cluster\_installed\_applications](#output\_cluster\_installed\_applications) | n/a |
| <a name="output_grafana_admin_password"></a> [grafana\_admin\_password](#output\_grafana\_admin\_password) | n/a |
| <a name="output_grafana_url"></a> [grafana\_url](#output\_grafana\_url) | n/a |
| <a name="output_ingress_controller_load_balancer_hostname"></a> [ingress\_controller\_load\_balancer\_hostname](#output\_ingress\_controller\_load\_balancer\_hostname) | n/a |
| <a name="output_kubernetes_cluster_endpoint"></a> [kubernetes\_cluster\_endpoint](#output\_kubernetes\_cluster\_endpoint) | n/a |
| <a name="output_kubernetes_cluster_id"></a> [kubernetes\_cluster\_id](#output\_kubernetes\_cluster\_id) | n/a |
| <a name="output_kubernetes_cluster_name"></a> [kubernetes\_cluster\_name](#output\_kubernetes\_cluster\_name) | n/a |
| <a name="output_kubernetes_cluster_ready"></a> [kubernetes\_cluster\_ready](#output\_kubernetes\_cluster\_ready) | n/a |
| <a name="output_kubernetes_cluster_status"></a> [kubernetes\_cluster\_status](#output\_kubernetes\_cluster\_status) | n/a |
| <a name="output_kubernetes_cluster_version"></a> [kubernetes\_cluster\_version](#output\_kubernetes\_cluster\_version) | n/a |
| <a name="output_master_ip"></a> [master\_ip](#output\_master\_ip) | n/a |
| <a name="output_network_id"></a> [network\_id](#output\_network\_id) | The ID of the Civo Network. |
