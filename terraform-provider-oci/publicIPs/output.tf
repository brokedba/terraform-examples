# display the Public Ips
output "Toronto_public_ips" {
      description = "Shows all public IPs and their OCIDs in Primary site [Toronto]"
      value        = { for ip,p in  oci_core_public_ip.primary_firewall_public_ip : ip => format("name: %s IP:%s OCID:%s",p.display_name,p.ip_address, p.id) }
}

output "Montreal_public_ips" {
      description = "Shows all public IPs and their OCIDs in DR site [Montreal]"
      value        = { for ip,p in  oci_core_public_ip.dr_firewall_public_ip : ip => format("name: %s IP:%s OCID:%s",p.display_name,p.ip_address, p.id) }
}