
      terraform {
        required_version = ">= 0.12.0"
      }
######################
# DATA SOURCE
######################

data "aws_ami" "terra_img" {
   most_recent = true
  owners = ["679593333241"]
  
    filter {
    name = "name"
    values = ["centos-7*"]
  }

  filter {
    name = "state"
    values = ["available"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
    filter {
    name   = "block-device-mapping.volume-size"
    values = ["8"]
  }
}

locals {
  ebs_iops = var.ebs_volume_type == "io1" ? var.ebs_iops : 0
}

# resource "aws_key_pair" "terraform-demo" {
#  key_name   = "var.key_KeyPair"
#  public_key = "${file("/home/brokedba/id_rsa_aws.pub")}"
#}
 #     data  "aws_subnet" "terra_sub" {
    #Required
    #count     = length(data.oci_core_subnet.terrasub.id)
    #subnet_id =lookup(oci_core_subnet.terrasub[count.index],id)
  #  subnet_id =  aws_subnet.terra_sub.id
#}
######################
# INSTANCE
######################
#data "template_file" "user_data" {
#  template = file("../scripts/add-ssh-web-app.yaml")
#}
variable "key_name" { default= "demo_aws_KeyPair"}

resource "aws_key_pair" "terra_key" {
   key_name   = var.key_name
   public_key = file("~/id_rsa_aws.pub")
  }
 resource "aws_instance" "terra_inst" {
    ami                          = data.aws_ami.terra_img.id
    availability_zone            = data.aws_availability_zones.ad.names[0]
    #cpu_core_count               = 1
    #cpu_threads_per_core         = 1
    disable_api_termination      = false
    ebs_optimized                = false
    get_password_data            = false
    hibernation                  = false
    instance_type                = var.instance_type
    private_ip                   = var.private_ip
    associate_public_ip_address  = var.map_public_ip_on_launch
    key_name                     = aws_key_pair.terra_key.key_name
    #key_name = var.key_name
    monitoring                   = false
    secondary_private_ips        = []
    security_groups              = []
    source_dest_check            = true
    subnet_id                    = aws_subnet.terra_sub.id
    user_data                    = filebase64(var.user_data)
    #user_data = filebase64("${path.module}/example.sh") 
    # user_data                   = "${file(var.user_data)}"
    # user_data_base64            = var.user_data_base64
    tags                         = {
        "Name" = var.instance_name
    }
    vpc_security_group_ids       = [aws_security_group.terra_sg.id]

    
     dynamic "network_interface" {
    for_each = var.network_interface
    content {
      device_index          = network_interface.value.device_index
      network_interface_id  = lookup(network_interface.value, "network_interface_id", null)
      delete_on_termination = lookup(network_interface.value, "delete_on_termination", true)
    }
  }
    
    credit_specification {
        cpu_credits = "standard"
    }

    metadata_options {
        http_endpoint               = "enabled"
        http_put_response_hop_limit = 1
        http_tokens                 = "optional"
    }

    root_block_device {
        delete_on_termination = true
        encrypted             = false
        iops                  = 100
        volume_size           = 8
    }

    timeouts {}
}
######################
# VOLUME
######################      

  resource "aws_ebs_volume" "terra_vol" {
  count = var.ebs_volume_enabled == true ? 1 : 0
  availability_zone = data.aws_availability_zones.ad.names[0]
  size              = var.ebs_volume_size
  iops              = local.ebs_iops
  type              = var.ebs_volume_type
  #tags             = aws_instance.terra_inst.tags/"${var.vol_name}"
  tags              = {
    "Name" = format("%s_%s", lookup(aws_instance.terra_inst.tags,"Name"),var.vol_name) 
  }
}

resource "aws_volume_attachment" "terra_vol_attach" {
  count = var.ebs_volume_enabled == true ? 1 : 0
  device_name = var.ebs_device_name[count.index]
  volume_id   = aws_ebs_volume.terra_vol.*.id[count.index]
  instance_id = join("", aws_instance.terra_inst.*.id)
}