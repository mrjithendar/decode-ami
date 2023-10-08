source "amazon-ebs" "centos7" {
  ami_name       = "roboshop-{{timestamp}}"
  instance_type  = "t3.large"
  region         = var.aws_region
  source_ami     = "ami-0bb6af715826253bf"
  ssh_port       = 22
  ssh_username   = "centos"

  temporary_iam_instance_profile_policy_document {
    Version = "2012-10-17"
    Statement {
        Effect = "Allow"
        Action = ["*"]
        Resource = ["*"]
    }
  }

  tags = {
    Name    = "roboshop"
    Base_AMI_Name = "{{ .SourceAMIName }}"
  }
}