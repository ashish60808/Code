# SRE Tech Challenge

## Rules
* Please include this file unmodified in your submission.
* Feel free to use Google.
* Don't copy someone else's code.
* Keep it short - we don't expect an essay.
* Please write a short README for the solution to each of the problems.
* Please version your answer with one of the DVCS (git, hg, bzr).
* Please submit your answer as a tar/zip of the entire local repository.


## Exercises
x   

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
