resource "civo_object_store" "template" {
  count       = var.object_store_enabled ? 1 : 0
  name        = "${var.cluster_name_prefix}objectstore"
  max_size_gb = var.object_store_size
}


data "civo_object_store_credential" "object_store" {
  count = var.object_store_enabled ? 1 : 0
  id    = civo_object_store.template[0].access_key_id
}
