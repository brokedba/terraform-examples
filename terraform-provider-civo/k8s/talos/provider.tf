terraform {
  required_providers {
    #  User to provision resources (firewal / cluster) in civo.com
    civo = {
      source  = "civo/civo"
      version = "1.1.4"
    }

    # Used to output the kubeconfig to the local dir for local cluster access
    local = {
      source  = "hashicorp/local"
      version = "2.4.0"
    }

    # Used to provision helm charts into the k8s cluster
    helm = {
      source  = "hashicorp/helm"
      version = "2.10.1"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.22.0"
    }

    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.19.0"
    }
  }
}


# Configure the Civo Provider
provider "civo" { 
  region = var.region
}

provider "helm" {
  kubernetes {
    host                   = civo_kubernetes_cluster.cluster.api_endpoint
    client_certificate     = base64decode(yamldecode(civo_kubernetes_cluster.cluster.kubeconfig).users[0].user.client-certificate-data)
    client_key             = base64decode(yamldecode(civo_kubernetes_cluster.cluster.kubeconfig).users[0].user.client-key-data)
    cluster_ca_certificate = base64decode(yamldecode(civo_kubernetes_cluster.cluster.kubeconfig).clusters[0].cluster.certificate-authority-data)
  }
}

provider "kubernetes" {
  host                   = civo_kubernetes_cluster.cluster.api_endpoint
  client_certificate     = base64decode(yamldecode(civo_kubernetes_cluster.cluster.kubeconfig).users[0].user.client-certificate-data)
  client_key             = base64decode(yamldecode(civo_kubernetes_cluster.cluster.kubeconfig).users[0].user.client-key-data)
  cluster_ca_certificate = base64decode(yamldecode(civo_kubernetes_cluster.cluster.kubeconfig).clusters[0].cluster.certificate-authority-data)

}

provider "kubectl" {
  host                   = civo_kubernetes_cluster.cluster.api_endpoint
  client_certificate     = base64decode(yamldecode(civo_kubernetes_cluster.cluster.kubeconfig).users[0].user.client-certificate-data)
  client_key             = base64decode(yamldecode(civo_kubernetes_cluster.cluster.kubeconfig).users[0].user.client-key-data)
  cluster_ca_certificate = base64decode(yamldecode(civo_kubernetes_cluster.cluster.kubeconfig).clusters[0].cluster.certificate-authority-data)
  load_config_file       = false
}