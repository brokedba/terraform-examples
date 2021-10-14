output "vnet_name" {
  description = "The Name of the newly created vNet"
  value       = azurerm_virtual_network.terra_vnet.name
}
output "vnet_id" {
      description = "id of created VNET. "
      value       = azurerm_virtual_network.terra_vnet.id
    }
output "vnet_CIDR" {
      description = "cidr block of created VNET. "
      value       = azurerm_virtual_network.terra_vnet.address_space
    }    
    
output "Subnet_Name" {
      description = "Name of created VNET's Subnet. "
      value       =  azurerm_subnet.terra_sub.name
    }
output "Subnet_id" {
      description = "id of created VNET. "
      value       = azurerm_subnet.terra_sub.id
    }
output "Subnet_CIDR" {
      description = "cidr block of VNET's Subnet. "
      value       = azurerm_subnet.terra_sub.address_prefixes
    }


output "vnet_dedicated_security_group_Name" {
       description = "Security Group Name. "
       value       = azurerm_network_security_group.terra_nsg.name
   }
output "vnet_dedicated_security_group_id" {
       description = "Security group id. "
       value       = azurerm_network_security_group.terra_nsg.id
   }
output "vnet_dedicated_security_ingress_rules" {
      description = "Shows ingress rules of the Security group "
     value       = azurerm_network_security_group.terra_nsg.security_rule
}           
    
##  INSTANCE OUTPUT

      output "instance_id" {
        description = " id of created instances. "
        value       = azurerm_linux_virtual_machine.terravm.id
      }
      
      output "private_ip" {
        description = "Private IPs of created instances. "
        value       = azurerm_linux_virtual_machine.terravm.private_ip_address
      }
      
      output "public_ip" {
        description = "Public IPs of created instances. "
        value       = azurerm_public_ip.terrapubip.ip_address
      }

 output "SSH_Connection" {
     value      = format("ssh connection to instance  ${var.prefix}-vm ==> sudo ssh -i ~/id_rsa_az centos@%s",azurerm_public_ip.terrapubip.ip_address)
}

  
  
    