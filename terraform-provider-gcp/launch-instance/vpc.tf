############################
# SERVICE ACCOUNT (OPTIONAL)
############################
# Note: The user running terraform needs to have the IAM Admin role assigned to them before you can do this.
# resource "google_service_account" "instance_admin" { 
#  account_id   = "instance-admin"
#  display_name = "instance s-account"
#  }
# resource "google_project_iam_binding" "instance_sa_iam" {
#  project = data.google_client_config.current.project # < PROJECT ID>
#  role    = "roles/compute.instanceAdmin.v1"
#  members = [
#    "serviceAccount:${google_service_account.instance_admin.email}"
#  ]

#################
# VPC
#################

resource "google_compute_network" "terra_vpc" {
    project   = data.google_client_config.current.project 
    name = "terra-vpc"
    auto_create_subnetworks = false
    mtu                     = 1460 
    }

#################
# SUBNET
#################
resource "google_compute_subnetwork" "terra_sub" {
  name          = "terra-sub"
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.terra_vpc.name
  description   = "This is a custom subnet "
  private_ip_google_access = "true"
  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }   

    secondary_ip_range {
                range_name    = "subnet-01-secondary-01"
                ip_cidr_range = "192.168.64.0/24"
            }
        

}
######################
# Firewall
######################    
# web network tag
resource "google_compute_firewall" "web-server" {
  project     = data.google_client_config.current.project  # you can Replace this with your project ID in quotes var.project_id
  name        = "allow-http-rule"
  network     = google_compute_network.terra_vpc.name
  description = "Creates firewall rule targeting tagged instances"

  allow {
    protocol = "tcp"
    ports    = ["80","22","443","3389"]
         }
   source_ranges = ["0.0.0.0/0"]
   target_tags = ["web-server"]
    timeouts {}
}

output "project" {
  value = "${data.google_client_config.current.project}"
}