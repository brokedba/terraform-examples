##  Terraform: Expressions  ##
##----------------------------
## Create a directory and get inside it
## v0 -- Author Debjeet Bhowmik https://cloudaffaire.com/terraform-expressions/
## v1 -- brokedba => replaced the vi by a Heredoc (EOF) to print the input into the main.tf and added the terraform init before the apply.
#mkdir terraform && cd terraform
 
## Create main.tf
cat <<EOF > main.tf
variable "ENV" {
default = "PROD"
}
variable "A" {
default = 20
}
variable "B" {
default = 10
}
variable "C" {
default = 3
}
resource "null_resource" "myresource" { #creates three null resources
count = var.C
#for(i=0;i<3;i++){return i}
}
output "myoutput1" {
value = "\${var.ENV == "PROD" ? "PRODUCTION" : "NONPRODUCTION"}"
#if(ENV=="PROD"){return "PRODUCTION"} else{return "NONPRODUCTION"}
}
output "myoutput2" {
value = "A + B = \${var.A + var.B}\n A - B = \${var.A - var.B}\n A * B = \${var.A * var.B}\n A / B = \${var.A / var.B}\n A % C = \${var.A % var.C}"
}
output "myoutput3" {
value = "\${((var.A > var.B && var.A > var.C) ? "A is greatest" : (var.B > var.C ? "B is greatest" : "C is greatest"))}"
#if(A>B && A>C){return A} elseif(B>C){return B} else{return C}
}
output "myoutput4" {
value = ["\${null_resource.myresource.*.id}"]
}
EOF
## Format the code
terraform fmt
terraform init
## Apply
terraform apply -auto-approve
 
## Cleanup
