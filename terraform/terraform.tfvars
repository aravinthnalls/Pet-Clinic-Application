# Generated from pipeline_request.txt configuration
# Environment Configuration
environment = "production"

# EC2 Configuration  
instance_type = "t2.micro"
ami_id = "ami-0c7217cdde317cfec"

# Project Configuration
project_name = "spring-petclinic"

# Additional tags based on configuration
tags = {
  Project = "Spring Petclinic"
  Environment = "production"
  ManagedBy = "Terraform"
  GeneratedFrom = "pipeline_request.txt"
  Labels = "ai-generated,demo,spring-boot,petclinic"
}

# AWS Configuration (update these values as needed)
aws_region = "us-west-2"

# Key Pair (REQUIRED: Set this to your AWS key pair name)
# key_pair_name = "your-key-pair-name"

# Application Configuration (from pipeline_request.txt)
# These ports are used in security group rules and outputs
frontend_port = 8080
backend_port = 8080

# Deployment Configuration
deploy_method = "spring-boot"
target_platform = "aws_ec2"
