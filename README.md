AWS Web Server with Terraform
A web server infrastructure built on AWS using Infrastructure as Code principles.
What it does
Creates a complete web server setup on AWS that you can access from anywhere on the internet. Everything is automated - just run the code and get a working website.
What I built

Custom network setup - VPC with public and private subnets
Web server - EC2 instance running Nginx
Security - Proper firewall rules and network isolation
Automation - Everything deployed automatically with Terraform

Key challenges solved
Multiple EC2 instances

Issue: AMI update created second instance instead of replacing first
Solution: Used terraform state list and terraform state show to identify managed resources
Tools: aws ec2 terminate-instances for cleanup

Cross-region compatibility

Issue: Hardcoded AMI ID failed in eu-west-2
Solution: Implemented dynamic AMI data sources
Verification: aws ec2 describe-images to validate region-specific AMIs

Git repository management

Issue: 648MB Terraform files exceeded GitHub's 100MB limit
Solution: Configured .gitignore and git rm --cached .terraform/
Result: Clean repository with only source code tracked

Network connectivity debugging

Issue: Web server not accessible from internet
Solution: Used curl testing and terraform output public_ip
Process: Verified security groups, routing, and connectivity step-by-step

State management

Issue: Terraform vs manual resource confusion
Solution: terraform refresh for state sync, git pull --allow-unrelated-histories
Learning: Understanding Terraform resource lifecycle

Technical skills used

Terraform (Infrastructure as Code)
AWS (VPC, EC2, Security Groups, Internet Gateway)
Linux system administration
Git version control
Network configuration and troubleshooting

Result
A working web server accessible at a public IP address, demonstrating modern cloud infrastructure practices and DevOps automation.