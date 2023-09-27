## TERRAFORM INSTALALTION ##
echo "installing Terraform latest"
sudo yum install -y yum-utils
sudo sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform
echo "installed terraform $(terraform -version)"