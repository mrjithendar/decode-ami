source "amazon-ebs" "centos8" {
  ami_name       = "roboshop-8-{{timestamp}}"
  instance_type  = "t3.large"
  region         = var.aws_region
  source_ami     = var.srcAMI
  ssh_port       = 22
  ssh_username   = var.uName

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