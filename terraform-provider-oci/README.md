# Oracle Cloud Infrastructure Provider Examples

This directory contains Terraform configuration files showing how to create specific resources. 
1. **create-vcn** is intended to demonstrate how to create a vcn along with the route table, the subnets and their security lists.
2. **launch-instance** contains both the vcn configuration we used above and the instance provisioning configuration .
 For details on how to run these samples please refere to my blog post 
 https://brokedba.blogspot.com/2020/07/terraform-for-dummies-launch-instance.html

![Topology1](https://1.bp.blogspot.com/-xd37jpj29Is/Xv_8fPjXEpI/AAAAAAAABxM/B5XBjEakBpc944IWHIulDDPV9pVcRHKhgCK4BGAsYHg/s853/oci-Terraform.png)

`` Please run either one of them at a time ( apply and destroy before runing the other) as the vcn attributes are the same .
``

3. **compartments**
   - see blog : http://www.brokedba.com/2023/08/deploy-multilevel-oci-sub-compartment.html

5. **Database-system**
   - see blog :  http://www.brokedba.com/2022/04/terraform-for-dummies-part-6-deploy.html

7. **public IPs**
   - see blog :  http://www.brokedba.com/2023/06/how-to-deploy-multi-region-resources.html
9. **oke**
   - see blog : [my-terraform-oci-oke-quickstart-fork](https://cloudthrill.ca/my-terraform-oci-oke-quickstart-fork)

 **Terraform Console**:
- ***Functions:*** Although terraform is a declarative language, there are still myriads of functions you can use to process strings/number/lists/mappings etc. 
you will find an excellent all in one script with examples of most terraform functions in [terrafunctions.sh](https://github.com/brokedba/terraform-examples/blob/master/terraform-provider-azure/terrafunctions.sh) 

- ***expressions:***  Same goes for expressions here is a simple shell script that creates a main.tf with multiples expressions and apply it for you [terraexpression.sh](https://github.com/brokedba/terraform-examples/blob/master/terraform-provider-azure/terraexpressions.sh) No need to deploy anything in the cloud it's all local.

Credit : [CloudaFFair](https://cloudaffaire.com/terraform-functions/)
