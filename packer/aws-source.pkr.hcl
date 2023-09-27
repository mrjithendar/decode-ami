# data "amazon-ami" "amazonLinux2" {
#   filters = {
#     name = "Amazon Linux 2023 AMI"
#   }
#   most_recent = true
#   owners      = ["amazon"]
#   region      = var.aws_region
# }

source "amazon-ebs" "amazonLinux2" {
  ami_name       = "roboshop-{{timestamp}}"
  instance_type  = "t3.large"
  region         = var.aws_region
  source_ami     = "ami-0cdb8266fcd5d3d63" #"ami-00c6177f250e07ec1" #"ami-03a6eaae9938c858c" #data.amazon-ami.amazonLinux2.id
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