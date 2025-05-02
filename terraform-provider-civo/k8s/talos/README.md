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
Create a terraform.tfvars file:

```hcl
civo_token = "your-civo-api-key"
region     = "NYC1"
grafana_enabled="true"
prometheus_enabled="true"
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
due to extra privilege necessary to create node exporter pods that scrape Hostnetwork and HostPID metrics , I had to add a label for cluster-tools namespace to make it work.
```
Error creating: pods "prometheus-prometheus-node-exporter-b6jmf" is forbidden: violates PodSecurity "baseline:latest": host namespaces (hostNetwork=true, hostPID=true), hostPath volumes (volumes "proc", "sys", "root"), hostPort (container "node-exporter" uses hostPort 9100)
```
**Namespace Pod Secuirity label**
```
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
