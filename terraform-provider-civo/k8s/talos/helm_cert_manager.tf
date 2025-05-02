resource "helm_release" "cert_manager" {
  name       = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  namespace  = "cert-manager"
  create_namespace = true

  set {
    name  = "installCRDs"
    value = "true" # Install Custom Resource Definitions
  }

  set {
    name  = "webhook.timeoutSeconds"
    value = "30"
  }
  
  set {
    name  = "global.leaderElection.namespace"
    value = "cert-manager"
  }


  # Optional: Pin the version if necessary
  # version = "v1.16.3"
}

#############################
# Self-signed ClusterIssuer #
#############################

#  Define a ClusterIssuer for cert-manager to generate self-signed certificates

resource "kubectl_manifest" "self_signed_cluster_issuer" {
  yaml_body = <<YAML
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: self-signed-cluster-issuer
spec:
  selfSigned: {}
YAML
depends_on = [helm_release.cert_manager]
}


###############################
#    apptest certificat           #
###############################
# Add Certificate resource will reference the selfsigned-clusterissuer 
# and create the apptest-tls-secret
# you can change apptest to any name or match it with landing_ns
# The Certificate resource will use the hostname and IP of the default ingress to generate the certificate.
resource "kubectl_manifest" "app_certificate" {
  yaml_body = <<YAML
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: apptest-tls
  namespace: ${kubernetes_namespace.landing_ns.metadata[0].name}
  annotations:
    cert-manager.io/issuer-kind: ClusterIssuer
    cert-manager.io/issuer-name: self-signed-cluster-issuer
    cert-manager.io/common-name: ${data.civo_kubernetes_cluster.cluster.dns_entry}
spec:
  secretName: apptest-tls-secret
  issuerRef:
    name: self-signed-cluster-issuer
    kind: ClusterIssuer
  dnsNames:
    - ${data.civo_kubernetes_cluster.cluster.dns_entry}
YAML
# - ${data.civo_kubernetes_cluster.cluster.dns_entry}
  depends_on = [kubectl_manifest.self_signed_cluster_issuer,kubernetes_namespace.landing_ns]
}
# The above code will create a self-signed certificate for the apptest application.
# The certificate will be stored in the apptest-tls-secret secret in the default namespace.
# command to check secret the issuer and apptest-tls-secret:
#      1. kubectl describe clusterissuer selfsigned-clusterissuer
#      2. kubectl get secret apptest-tls-secret -n apptest
#      3. kubectl describe certificate apptest-tls -n apptest

 ################
 # let's ecrypt #
 #################
# Define a ClusterIssuer for cert-manager to generate Let's Encrypt certificates
# Grafana Ingress 
resource "kubectl_manifest" "letsencrypt_prod_issuer" {
  yaml_body = <<YAML
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: letsencrypt-prod
spec:
  acme:
    server: https://acme-v02.api.letsencrypt.org/directory
    email: ${var.ingress_email_issuer}
    privateKeySecretRef:
      name: letsencrypt-prod
    solvers:
      - http01:
          ingress:
            class: traefik
YAML

  depends_on = [helm_release.cert_manager]
}

  # Wait for the ClusterIssuer to be ready
  resource "null_resource" "wait_for_letsencrypt_prod_issuer_ready" {
  triggers = {
    issuer_id = kubectl_manifest.letsencrypt_prod_issuer.id
  }

  provisioner "local-exec" {
    command = <<EOT
kubectl wait --for=jsonpath='{.status.conditions[?(@.type=="Ready")].status}'=True clusterissuer/letsencrypt-prod --timeout=5m
    EOT
    interpreter = ["/bin/bash", "-c"]
    environment = {
      KUBECONFIG = local_file.cluster-config.filename
    }
  }

  depends_on = [kubectl_manifest.letsencrypt_prod_issuer]
}

#  The HTTP-01 challenge works like this:
# Let's Encrypt gives a URL:
# http://grafan.d402f4e6.nip.io/.well-known/acme-challenge/<TOKEN>

# Cert-manager:
# 1. Creates a short-lived pod that serves this token
# 2. Creates a temporary Ingress to route traffic to that pod
# 3. Deletes both immediately after validation succeeds

# you can see details in the certificate order in the cert-manager namespace 
# kuvectl get orders -n cluster-tools
# kubectl describe  grafana-letsencrypt-prod-tls-1-2757660719 -n cluster-tools
# ouput
# Status:
  # Authorizations:
  #   Challenges:
#       token:        WFYw6gxxxxxxx 
#       Type:         http-01
#       URL:          https://acme-v02.api.letsencrypt.org/acme/chall/2370855017/513317203147/WFYw6g
#     Identifier:     grafan.d402f4e6.nip.io
#        Wildcard:       false
#   Certificate: xx
#  Finalize URL:     https://acme-v02.api.letsencrypt.org/acme/finalize/2370855017/379355861187
#   State:            valid
#   URL:              https://acme-v02.api.letsencrypt.org/acme/order/2370855017/379355861187

# curl https://acme-v02.api.letsencrypt.org/acme/chall/2370855017/513317203147/WFYw6g
# {
#   "type": "http-01",
#   "url": "https://acme-v02.api.letsencrypt.org/acme/chall/2370855017/513317203147/WFYw6g",
#   "status": "valid",
#   "validated": "2025-04-30T08:56:03Z",
#   "token": "_HBHQGYyP0dV8ax9Zu5_aI7FhJPfziVr79IpSMKgFAE",
#   "validationRecord": [
#     {
#       "url": "http://grafan.d402f4e6.nip.io/.well-known/acme-challenge/_HBHQGYyP0dV8ax9Zu5_aI7FhJPfziVr79IpSMKgFAE",
#       "hostname": "grafan.d402f4e6.nip.io",
#       "port": "80",
#       "addressesResolved": [
#         "212.2.244.230"
#       ],
#       "addressUsed": "212.2.244.230"
#     }
#   ]
# }
