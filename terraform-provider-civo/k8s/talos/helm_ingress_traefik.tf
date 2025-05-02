  resource "helm_release" "traefik_ingress" {
    name = "traefik"

    repository = "https://helm.traefik.io/traefik"
    chart      = "traefik"
    timeout          = 900 # Increase timeout to 15 minutes
    create_namespace = true
    namespace        = "traefik"

    set {
      type  = "string"
      name  = "service.annotations.kubernetes\\.civo\\.com/firewall-id"
      value = civo_firewall.firewall-ingress.id
    }


    set {
      name  = "metrics.prometheus.service.enabled"
      value = "true"
    }
    # served directly by the Traefik internal service

  # set {
  #   name  = "ports.metrics.port"
  #   value = "9100" # Set as string, Helm typically converts to number if needed
  # }

  # set {
  #   name  = "ports.metrics.exposedPort"
  #   value = "9100" # Set as string
  # }

  # set {
  #   name  = "ports.metrics.protocol"
  #   value = "TCP" # Set as string
  # }

  set {
    name  = "ports.metrics.expose.default"
    value = "true" # Set as string, Helm converts "true" to boolean true
  }

  
  }
