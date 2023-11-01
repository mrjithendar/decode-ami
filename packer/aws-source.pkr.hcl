source "amazon-ebs" "centos8" {
  ami_name       = "roboshop-8-{{timestamp}}"
  instance_type  = "t3.large"
  region         = var.aws_region
  source_ami     = "ami-073d44ded6fa7b67c" # ami-05f6efa8e92a404ce # ami-073d44ded6fa7b67c org
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