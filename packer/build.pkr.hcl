build {

  sources = ["source.amazon-ebs.centos8"]

  provisioner "file" {
    source      = "ssh/config"
    destination = "/tmp/config"
  }

  provisioner "file" {
    source      = "ssh/_sshd_config"
    destination = "/tmp/sshd_config"
  }

  provisioner "file" {
    source      = "ssh/cloud.cfg"
    destination = "/tmp/cloud.cfg"
  }

  provisioner "shell" {
    inline = [
      "sudo rm -rvf /root/.ssh/config",
      "sudo mv -vf /tmp/config /root/.ssh/config",
      "sudo rm -rvf /etc/cloud/cloud.cfg",
      "sudo mv -vf /tmp/cloud.cfg /etc/cloud/cloud.cfg",
      "sudo rm -rf /etc/ssh/sshd_config",
      "sudo mv -vf /tmp/sshd_config /etc/ssh/sshd_config",
      "sudo echo 'DevOps321' | sudo passwd --stdin root",
      "sudo chmod 700 /root/.ssh",
      "sudo chmod 600 /root/.ssh/authorized_keys",
      "sudo sudo service sshd restart",
    ]
  }

  post-processor "manifest" {
    output     = "manifest.json"
    strip_path = true
  }

}