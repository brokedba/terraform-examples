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
    # formatlist("%s:  %s" ,azurerm_network_security_group.terra_sg.ingress[*].description,formatlist("%s , CIDR: %s", azurerm_network_security_group.terra_sg.ingress[*].to_port,azurerm_network_security_group.terra_sg.ingress[*].cidr_blocks[0]))


  




