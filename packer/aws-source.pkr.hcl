source "amazon-ebs" "centos8" {
  ami_name       = "roboshop-7-{{timestamp}}"
  instance_type  = "t3.large"
  region         = var.aws_region
  source_ami     = "ami-0de3437fface34613" #centos8ORG
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
    Name    = "roboshop-8-{{timestamp}}"
    BaseAmiName = "{{ .SourceAMIName }}"
  }
}