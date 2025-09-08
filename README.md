# Terraform.v2
AWS Web Server with Terraform
A web server infrastructure built on AWS using Infrastructure as Code principles.
What it does
Creates a complete web server setup on AWS that you can access from anywhere on the internet. Everything is automated - just run the code and get a working website.
What I built

Custom network setup - VPC with public and private subnets
Web server - EC2 instance running Nginx
Security - Proper firewall rules and network isolation
Automation - Everything deployed automatically with Terraform

How I approached it
Infrastructure as Code: Used Terraform to define all AWS resources in code, making it repeatable and version-controlled.
AWS Best Practices: Followed proper networking patterns with VPC, subnets, and security groups for a production-like setup.
Problem Solving: Worked through several challenges including managing multiple instances, Git large files, and ensuring proper connectivity across different AWS regions.
Technical skills used

Terraform (Infrastructure as Code)
AWS (VPC, EC2, Security Groups, Internet Gateway)
Linux system administration
Git version control
Network configuration and troubleshooting

Result
A working web server accessible at a public IP address, demonstrating modern cloud infrastructure practices and DevOps automation.