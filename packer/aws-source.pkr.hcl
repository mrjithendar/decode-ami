source "amazon-ebs" "amazonLinux2" {
  ami_name       = "roboshop-{{timestamp}}"
  instance_type  = "t3.large"
  region         = var.aws_region
  source_ami     = "ami-002070d43b0a4f171" # CentOs 8::: "ami-0cdb8266fcd5d3d63"
//   user_data_file = "./scripts/script.sh"
  ssh_port = 22
  ssh_username = "centos" #"ec2-user"

#   launch_block_device_mappings {
#     device_name           = "/dev/sda1"
#     volume_size           = 40
#     volume_type           = "gp2"
#     delete_on_termination = true
#   }

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