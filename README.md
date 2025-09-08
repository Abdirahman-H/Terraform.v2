AWS Web Server with Terraform
A web server infrastructure built on AWS using Infrastructure as Code principles.
What it does
Creates a complete web server setup on AWS that you can access from anywhere on the internet. Everything is automated - just run the code and get a working website.
What I built

Custom network setup - VPC with public and private subnets
Web server - EC2 instance running Nginx
Security - Proper firewall rules and network isolation
Automation - Everything deployed automatically with Terraform

Challenges I solved along the way
Multiple EC2 instances: When I updated my AMI configuration, Terraform created a second instance instead of replacing the first one. Used terraform state list and terraform state show to identify which resources Terraform manages, then cleaned up manually created instances with aws ec2 terminate-instances.
Cross-region AMI issues: My hardcoded AMI ID didn't work in eu-west-2. Implemented dynamic AMI data sources and used aws ec2 describe-images to find the correct AMI for the region.
Git large file problems: Initially tried to push 648MB Terraform provider files to GitHub, hitting the 100MB limit. Fixed it with proper .gitignore patterns and git rm --cached .terraform/ to remove large files from tracking.
Networking connectivity: Debugged why my web server wasn't accessible. Used curl http://IP_ADDRESS to test connectivity and terraform output public_ip to verify the correct IP address.
Terraform state management: Learned the difference between terraform destroy removing only Terraform-managed resources versus manually created ones. Used terraform refresh to sync state and handled divergent Git histories with git pull --allow-unrelated-histories.
Technical skills used

Terraform (Infrastructure as Code)
AWS (VPC, EC2, Security Groups, Internet Gateway)
Linux system administration
Git version control
Network configuration and troubleshooting

Result
A working web server accessible at a public IP address, demonstrating modern cloud infrastructure practices and DevOps automation.