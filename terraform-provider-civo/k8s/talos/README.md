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
```
Or export them manually:
```bash
export CIVO_TOKEN="your-civo-api-key"
export TF_VAR_region="NYC1"
```
### 3️⃣ Deploy the cluster
```bash 
terraform init
terraform apply -auto-approve
```

## 🛠 Future Enhancements 
- Add External DNS integration
- Enable ArgoCD or FluxCD
- Deploy monitoring (Prometheus, Grafana)

## Contributions are welcome 🫶🏻
