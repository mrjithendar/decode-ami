source "amazon-ebs" "centos7" {
  ami_name       = "roboshop-7-{{timestamp}}"
  instance_type  = "t3.large"
  region         = var.aws_region
  source_ami     = "ami-05f6efa8e92a404ce"
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
    Name    = "roboshop-7-{{timestamp}}"
    BaseAmiName = "{{ .SourceAMIName }}"
  }
}

source "amazon-ebs" "centos8" {
  ami_name       = "roboshop-8-{{timestamp}}"
  instance_type  = "t3.large"
  region         = var.aws_region
  source_ami     = "ami-0d2fee81a314136dc"
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