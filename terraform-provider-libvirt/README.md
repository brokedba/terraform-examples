
KVM Libvirt Provider Examples
This directory contains On-premises Terraform configuration files in order to create a vrtual machine (Centos 7) in a local KVM environment.
![image](https://user-images.githubusercontent.com/29458929/151416418-a4137b5f-3804-4a2b-90ac-d6ff3033e73a.png)
All you need to know about the deployment examples and steps are in my blog post : 
- http://www.brokedba.com/2021/12/terraform-for-dummies-part-5-terraform.html 


# QEMU environments workaround

- As nested virtualization with virtualbox doesn't quite support kvm domain type yet it seems.
- the goal was to make libvirt provider chose qemu instead of kvm while provisioning the resource.
- this issue is similar to what openstak and miniduke encounter when they use kvm within vbox "could not find capabilities for domaintype=kvm"

- with the help of @titogarrido we found out that the the logic inside terraform-provider-libvirt/libvirt/domain_def.go check implied kvm only supported virtualization.

- In case of nested or non baremetal environment, qemu had to be specified for the vm to launch

Therefore the workaround is to set the below variable right before runing terraform apply: 

```
export TERRAFORM_LIBVIRT_TEST_DOMAIN_TYPE="qemu" 

```
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_libvirt"></a> [libvirt](#requirement\_libvirt) | 0.6.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_libvirt"></a> [libvirt](#provider\_libvirt) | 0.6.2 0.6.2 |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [libvirt_cloudinit_disk.commoninit](https://registry.terraform.io/providers/dmacvicar/libvirt/0.6.2/docs/resources/cloudinit_disk) | resource |
| [libvirt_domain.centovm](https://registry.terraform.io/providers/dmacvicar/libvirt/0.6.2/docs/resources/domain) | resource |
| [libvirt_domain.ubuntu-vm](https://registry.terraform.io/providers/dmacvicar/libvirt/0.6.2/docs/resources/domain) | resource |
| [libvirt_volume.centos7-qcow2](https://registry.terraform.io/providers/dmacvicar/libvirt/0.6.2/docs/resources/volume) | resource |
| [libvirt_volume.ubuntu-disk](https://registry.terraform.io/providers/dmacvicar/libvirt/0.6.2/docs/resources/volume) | resource |
| [template_file.user_data](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

No inputs.

## Outputs

No outputs.
# Note
you can try this in my vagrant build if you don't have a KVM environment to play with . It will create a qemu based vm within a virtualbox vm which makes it even cooler !!
 > GitHub: https://github.com/brokedba/KVM-on-virtualbox

Enjoy!!
