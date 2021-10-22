 provider "google" {
    credentials = file(var.gcp_credentials)
    project = var.project 
    region  = var.region
    zone    = var.zone
  }
#####################  
# PROJECT DATA SOURCE
#####################

data "google_client_config" "current" {

}
#variable "project_id" {
#  default = data.google_client_config.current.project 
#}
#############
# Instances
#############

 resource "google_compute_instance" "terra_instance" {
  name     = var.instances_name
  hostname = var.hostname
  project  = data.google_client_config.current.project
  zone     = var.zone 
  machine_type = var.vm_type
  
  metadata = {
   ssh-keys = "${var.admin}:${file("~/id_rsa_gcp.pub")}"   # Change Me
    startup-script        = ("${file(var.user_data)}")
  #  startup-script-custom = "stdlib::info Hello World"
  }
  network_interface {
    network            = google_compute_network.terra_vpc.self_link
    subnetwork         = google_compute_subnetwork.terra_sub.self_link
    subnetwork_project = data.google_client_config.current.project 
    network_ip         = var.private_ip
  access_config {
      // Include this section to give the VM an external ip address
   }
 }
 
  depends_on = [data.google_client_config.current]
######################
# IMAGE
######################
 
  boot_disk {
    initialize_params {
      image = var.os_image[var.OS].name      #"debian-cloud/debian-9"
    }
  }
 # scratch_disk {
  #  interface = "SCSI"
  #}

scheduling {
  on_host_maintenance = "MIGRATE"
  automatic_restart   =  true
}


# service account
  service_account {
    scopes = ["https://www.googleapis.com/auth/compute.readonly"]
  }
 tags = ["web-server"]
} 
 
######################
# ADDRESS
######################
# Reserving a static internal IP address 
resource "google_compute_address" "internal_reserved_subnet_ip" {
  name         = "internal-address"
  subnetwork   = google_compute_subnetwork.terra_sub.id
  address_type = "INTERNAL"
  address      = var.private_ip
  region       = var.region
}

#resource "google_compute_address" "static" {
#  name = "ipv4-address"
#}
 
  
output "ip" {
 value = google_compute_instance.terra_instance.network_interface.0.access_config.0.nat_ip
}

  
  




