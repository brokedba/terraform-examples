resource "kubernetes_secret" "object_store_access" {
  count = var.object_store_enabled ? 1 : 0
    metadata {
      name = "object-store-access"
      namespace = "default"
    }

    data = {
      "region" = format("https://objectstore.%s.civo.com", lower(var.region))
      "access_key" = data.civo_object_store_credential.object_store[0].access_key_id
      "secret_key" = data.civo_object_store_credential.object_store[0].secret_access_key
    }
}
