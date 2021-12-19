provider "libvirt" {
  uri = "qemu:///system"
}
 terraform {
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.6.2"
    }
  }
}
#provider "libvirt" {
#  alias = "server2"
#  uri   = "qemu+ssh://root@192.168.100.10/system"
#}

resource "libvirt_volume" "centos7-qcow2" {
  name = "centos7.qcow2"
  pool = "default"
  source = "https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2"
  #source = "./CentOS-7-x86_64-GenericCloud.qcow2"
  format = "qcow2"
}
# Use CloudInit to add our ssh-key to the instance
resource "libvirt_cloudinit_disk" "commoninit" {
 name           = "commoninit.iso"
 pool           = "default" #CHANGEME
 user_data      = data.template_file.user_data.rendered
}

data "template_file" "user_data" {
 template = file("${path.module}/cloud_init.cfg")
}
# Define KVM domain to create
resource "libvirt_domain" "centovm" {
  name   = "centovm"
  memory = "1024"
  vcpu   = 1

cloudinit = libvirt_cloudinit_disk.commoninit.id

  network_interface {
    network_name = "default"
    hostname = "terracentos"
  }

  disk {
    volume_id = "${libvirt_volume.centos7-qcow2.id}"
  }

  console {
    type = "pty"
    target_type = "serial"
    target_port = "0"
  }

  graphics {
    type = "spice"
    listen_type = "address"
    autoport = true
  }
}