output "vpc_name" {
   description = "The Name of the newly created vpc"
    value      = google_compute_network.terra_vpc.name
 }
#  output "vpc_id" {
#      description = "id of created vpc."
#       value       = google_compute_network.terra_vpc.id
#    } 
    
output "Subnet_Name" {
      description = "Name of created vpc's Subnet. "
      value       =  google_compute_subnetwork.terra_sub.name
    }
output "Subnet_id" {
      description = "id of created vpc. "
      value       = google_compute_subnetwork.terra_sub.id
    }
output "Subnet_CIDR" {
      description = "cidr block of vpc's Subnet. "
      value       = google_compute_subnetwork.terra_sub.ip_cidr_range
    }

output "firewall_Name" {
       description = "Security Group Name. "
       value       = google_compute_firewall.web-server.name
   }
 
output "fire_wall_rules" {
      description = "Shows ingress rules of the Security group "
     value       = google_compute_firewall.web-server.allow
}           

output "secondary_sub_ip_range"  {
      description = "Shows ingress rules of the Security group "
      value       = google_compute_subnetwork.terra_sub.secondary_ip_range
}           



