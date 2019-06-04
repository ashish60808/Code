## Exercise 2
### Write a Terraform code that
* Creates an EC2 instance with
  * The latest Ubuntu LTS AMI (AMI should be discovered dynamically, not hard-coded)
  * A Security Group enabling access only on 22, 80, 443 from 5.148.131.186/32
  * Uses SSH public key from path supplied as an variable (default value
    ~/.ssh/id_rsa.pub)
* Uses an S3 bucket as the Terraform backend (to store state)

I have created the terraform code that will provision the EC2 instance on AWS eu-east-2 region.
## Solution : terraform code
### How to provision the EC2 instance.
* .  terraform init
This will download AWS relate packages under.terraform directoy.
* . terraform apply command do the following things
  * The latest Ubuntu LTS AMI (AMI should be discovered dynamically, not hard-coded)
  * A Security Group enabling access only on 22, 80, 443 from 5.148.131.186/32
  * Uses SSH public key from path supplied as an variable 
* Created and Uses an S3 bucket as the Terraform backend (to store state) it is storing the terraform.state file under bucket


I have put the following file under .gitignore file.

**/.terraform

**/terraform.tfstate

**/terraform.tfstate.backup

**/terraform.tfvars
