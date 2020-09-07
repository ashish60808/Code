---
---
# Problem Statement


## Exercises
### Generate 100 files
* Each file should contain a line with between 1 and 65 randomly chosen
  printable characters (both the number of the characters and the characters
  themselves are random)
* Line "This is every 5th file!" should appear in every 5th file
* Every 7th file ignores the previous two rules and contains the concatencated
  contents of all of the previous files.
* Write test-suite for your implementation.

### Write a Terraform code that
* Creates an EC2 instance with
  * The latest Ubuntu LTS AMI (AMI should be discovered dynamically, not hard-coded)
  * A Security Group enabling access only on 22, 80, 443 from 5.148.131.186/32
  * Uses SSH public key from path supplied as an variable (default value
    ~/.ssh/id_rsa.pub)
* Uses an S3 bucket as the Terraform backend (to store state)

### Write a Dockerfile for redis
* That uses the latest Ubuntu LTS Docker image as its base
* That accepts port configuration from an environment variable when the server
  is started
* That accepts memory limit configuration from an environment variable when the
  server is started

