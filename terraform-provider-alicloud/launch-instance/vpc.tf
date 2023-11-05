#################
# Resorce Group
#################
# alicloud Resource group
resource "alicloud_resource_manager_resource_group"  "rg" {
  resource_group_name     = "${var.prefix}-rg"
  display_name            = "${var.prefix}-rg"
}

#################
# VPC
#################
resource "alicloud_vpc" "terra_vpc" {
    vpc_name          = var.vpc_name
    cidr_block        = var.vpc_cidr
    resource_group_id = alicloud_resource_manager_resource_group.rg.id
    }

#################
# VSWITCH
#################
# ali_vswitch.terra_sub:
resource "alicloud_vswitch" "terra_sub" {
    vpc_id                          = alicloud_vpc.terra_vpc.id
    zone_id                         = var.ali_zone[var.ali_region]
    cidr_block                      = var.vswitch_cidr
    vswitch_name                    = var.vswitch_name
    }

######################
# Security Group
######################    
# ali_security_group.terra_sg:
resource "alicloud_security_group" "terra_sg" {
  name              = var.sg_name
  description       = "Terra security group"
  vpc_id            = alicloud_vpc.terra_vpc.id
  resource_group_id = alicloud_resource_manager_resource_group.rg.id
}

resource "alicloud_security_group_rule" "allow_http_80" {
  type              = "ingress"
  ip_protocol       = "tcp"
  description       = "allow_http_80"
  #nic_type          = "internet"  # var.nic_type
  policy            = "accept"
  port_range        = "80/80"
  priority          = 1
  security_group_id = alicloud_security_group.terra_sg.id
  cidr_ip           = "0.0.0.0/0"
}

resource "alicloud_security_group_rule" "allow_https_443" {
  type              = "ingress"
  ip_protocol       = "tcp"
  description       = "allow_https_443"
  #nic_type          = "internet" #var.nic_type
  policy            = "accept"
  port_range        = "443/443"
  priority          = 1
  security_group_id = alicloud_security_group.terra_sg.id
  cidr_ip           = "0.0.0.0/0"
}

resource "alicloud_security_group_rule" "allow_https_22" {
  type              = "ingress"
  ip_protocol       = "tcp"
  description       = "allow_https_22"
  #nic_type          = "internet" # var.nic_type
  policy            = "accept"
  port_range        = "22/22"
  priority          = 1
  security_group_id = alicloud_security_group.terra_sg.id
  cidr_ip           = "0.0.0.0/0"
}

################################################
#  Internet Gateway desn't exist in alicloud
############################################### 
###############################
# Route Table isn't necessary
############################### 
/*  ali_route_table.terra_rt:
resource "alicloud_route_table" "terra_rt" {
  description      = "test-description"
  vpc_id           = alicloud_vpc.defaultVpc.id
  route_table_name = var.name
  associate_type   = "VSwitch"
}
# add route rules
resource "alicloud_route_entry" "foo" {
  route_table_id        = alicloud_vpc.foo.route_table_id
  destination_cidrblock = "172.11.1.1/32"
  nexthop_type          = "Instance"
  nexthop_id            = alicloud_instance.foo.id
}
# ali_route_table_association.terra_rt_sub:
resource "alicloud_route_table_attachment" "foo" {
  vswitch_id     = alicloud_vswitch.terra_sub.id
  route_table_id = alicloud_route_table.terra_rt.id
}
*/