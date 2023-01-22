# Create a vpc with dynamic seurity group rule block and local variables substitution 
 The create-vpc-dynamic is intended to demonstrate how to create a vpc with a dynamic block of securtiy group rules.
For details on how to run this sample please refere to my [blog post >>](https://brokedba.blogspot.com/2020/10/terraform-tricks-how-to-mimic-nested.html)

# In a nutshell  : 
To consolidate all sg rules combinations in one main map and still call them using the a local variable one would need to write it as below .

```
# all cases in one map 
    variable "main_sg" {
    default = {
    sg_ssh = {
       SSH = 22
             }, 
    sg_web = {  
       SSH = 22
       HTTP = 80
       HTTPS = 443 },
    sg_win { 
       RDP = 3389
       HTTP = 80
       HTTPS = 443 } 
                           }
}
 # Locals block  locals {
    sg_mapping = {           #  variable substitution within a variable
      SSH = var.main_sg.sg_ssh
      WEB = var.main_sg.sg_web
      WIN = var.main_sg.sg_win
  }
}

# DYNAMIC sg rules using FOR_EACH LOOP and local variable
resource "aws_security_group_rule" "terra_sg_rule" {
  for_each = local.sg_mapping[var.sg_type] 
...
```
