build {

  sources = ["source.amazon-ebs.centos8"]

  provisioner "file" {
    source      = "ssh/config"
    destination = "/tmp/_config"
  }

  provisioner "file" {
    source      = "ssh/motd"
    destination = "/tmp/_motd"
  }

  #ssh config
  provisioner "shell" {
    inline = [
      "sudo cp -f /tmp/_motd /etc/motd",
      "sudo cp -f /tmp/_config /root/.ssh/config",
      "sudo sed -i -e 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config",
      "sudo sed -i -e 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config",
      "sudo echo 'DevOps321' | sudo passwd --stdin root",
      "sudo chown root /root/.ssh/config",
      "sudo chmod 600 /root/.ssh/config",
      "sudo sudo service sshd restart"
    ]
  }

  #remove SELinux in centos 8
  provisioner "shell" {
    inline = [
      "sudo sed -i -e 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config",
      "sudo setenforce 0"
    ]
  }

  #installing required tools
  provisioner "shell" {
    inline = [
      "sudo yum install -y git wget vim net-tools",
      "sudo yum remove cockpit -y"
    ]
  }

  post-processor "manifest" {
    output     = "manifest.json"
    strip_path = true
  }

}