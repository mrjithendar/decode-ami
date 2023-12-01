build {

  sources = ["source.amazon-ebs.centos8"]

  provisioner "file" {
    source      = "ssh/config"
    destination = "/tmp/config"
  }

  provisioner "file" {
    source      = "ssh/motd"
    destination = "/tmp/motd"
  }

  provisioner "file" {
    source      = "ssh/sshConfig.sh"
    destination = "/tmp/sshConfig.sh"
  }

  #ssh config
  provisioner "shell" {
    inline = [ "sudo sh /tmp/sshConfig.sh" ]
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
      "sudo yum install -y git wget vim net-tools unzip"
    ]
  }

  post-processor "manifest" {
    output     = "manifest.json"
    strip_path = true
  }

}
