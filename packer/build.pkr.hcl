build {

  sources = ["source.amazon-ebs.centos8"]

  provisioner "file" {
    source      = "ssh/id_rsa"
    destination = "/tmp/.ssh"
  }

  provisioner "file" {
    source      = "ssh/id_rsa.pub"
    destination = "/tmp/.ssh"
  }

  provisioner "file" {
    source      = "ssh/config"
    destination = "/tmp/.ssh"
  }

  provisioner "file" {
    source      = "ssh/_ssh.sh"
    destination = "/tmp/_ssh.sh"
  }

  provisioner "file" {
    source      = "ssh/_sshd_config"
    destination = "/tmp/sshd_config"
  }

  provisioner "shell" {
    inline = [
      "sudo rm -rvf /root/.ssh",
      "sudo cp -rf /tmp/.ssh /root/",
      "sudo rm -rf /etc/ssh/sshd_config",
      "sudo cp -rf /tmp/sshd_config /etc/ssh/sshd_config",
      "sudo echo 'DevOps321' | sudo passwd --stdin root",
      "sudo chmod 700 /root/.ssh",
      "sudo sudo service sshd restart",
    ]
  }

  post-processor "manifest" {
    output     = "manifest.json"
    strip_path = true
  }

}