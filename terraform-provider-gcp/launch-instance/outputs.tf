output "vpc_name" {
  description = "The Name of the newly created vpc"
  value       = google_compute_network.terra_vpc.name
}
#output "vpc_id" {
#      description = "id of created vpc. "
#      value       = google_compute_network.terra_vpc.id
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

output "fire_wall_rules" {
      description = "Shows ingress rules of the Security group "
     value       = google_compute_firewall.web-server.allow
}         
    
##  INSTANCE OUTPUT

      output "instance_name" {
        description = " id of created instances. "
        value       = google_compute_instance.terra_instance.name
      }

      output "hostname" {
        description = " id of created instances. "
        value       = google_compute_instance.terra_instance.hostname
      }
      
      output "private_ip" {
        description = "Private IPs of created instances. "
        value       = google_compute_instance.terra_instance.network_interface.0.network_ip
      }
      
      output "public_ip" {
        description = "Public IPs of created instances. "
        value       = google_compute_instance.terra_instance.network_interface.0.access_config.0.nat_ip
      }

 output "SSH_Connection" {
     value      = format("ssh connection to instance  ${var.instance_name} ==> sudo ssh -i ~/id_rsa_gcp  ${var.admin}@%s",google_compute_instance.terra_instance.network_interface.0.access_config.0.nat_ip)
}

  
  
    