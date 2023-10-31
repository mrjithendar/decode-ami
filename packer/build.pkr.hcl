build {

  sources = ["source.amazon-ebs.centos8"]

  provisioner "file" {
    source      = "scripts/_ssh.sh"
    destination = "/tmp/_ssh.sh"
  }

  provisioner "file" {
    source      = "scripts/_sshd_config"
    destination = "/tmp/sshd_config"
  }

  provisioner "shell" {
    inline = [
      "sudo rm -rf /etc/ssh/sshd_config",
      "sudo cp -rf /tmp/sshd_config /etc/ssh/sshd_config",
      "sudo sh /tmp/_ssh.sh"
    ]
  }

  post-processor "manifest" {
    output     = "manifest.json"
    strip_path = true
  }

}