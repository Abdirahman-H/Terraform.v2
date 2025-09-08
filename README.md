🚀 AWS Web Server with Terraform

A complete web server infrastructure built on AWS using Infrastructure as Code (IaC) principles.

⸻

🌍 What This Project Does
	•	Creates a fully functional web server on AWS
	•	Accessible from anywhere on the internet
	•	Everything is automated → run the code and get a working website

⸻

🛠️ What I Built
	•	Custom networking → VPC with public & private subnets
	•	Web server → EC2 instance running Nginx
	•	Security → firewall rules & network isolation via Security Groups
	•	Automation → entire setup deployed with Terraform

⸻

⚡ Key Challenges & Solutions

1. Multiple EC2 Instances
	•	Issue: Updating the AMI created a second instance instead of replacing the first
	•	Solution:
	•	Used terraform state list & terraform state show to identify managed resources
	•	Cleaned up manually with aws ec2 terminate-instances

⸻

2. Cross-Region Compatibility
	•	Issue: Hardcoded AMI ID failed in eu-west-2
	•	Solution:
	•	Implemented dynamic AMI data sources in Terraform
	•	Verified with aws ec2 describe-images

⸻

3. Git Repository Management
	•	Issue: .terraform/ folder bloated repo to 648MB (exceeding GitHub’s 100MB limit)
	•	Solution:
	•	Configured .gitignore
	•	Cleaned repo with git rm --cached .terraform/
	•	✅ Result: Lean repo with only source code tracked

⸻

4. Network Connectivity Debugging
	•	Issue: Web server not accessible from the internet
	•	Solution:
	•	Tested with curl + terraform output public_ip
	•	Verified security groups, routing, and connectivity step-by-step

⸻

5. State Management
	•	Issue: Terraform state vs manual AWS changes caused confusion
	•	Solution:
	•	Ran terraform refresh to resync state
	•	Learned importance of Terraform resource lifecycle management

⸻

🧑‍💻 Technical Skills Used
	•	Terraform → Infrastructure as Code
	•	AWS → VPC, EC2, Security Groups, Internet Gateway
	•	Linux → system administration (Amazon Linux 2023, Nginx setup)
	•	Git → version control & repo cleanup
	•	Networking → routing, firewall rules, troubleshooting

⸻

✅ Result

A working AWS-hosted web server accessible via public IP, showcasing modern cloud infrastructure practices and DevOps automation with Terraform.
