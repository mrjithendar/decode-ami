build {

  sources = ["source.amazon-ebs.centos7"]

  provisioner "file" {
    source      = "scripts/_ssh_config"
    destination = "/etc/ssh/ssh_config"
  }

  provisioner "file" {
    source      = "scripts/_ssh.sh"
    destination = "/tmp/_ssh.sh"
  }

  provisioner "shell" {
    inline = [
      "sh /tmp/_ssh.sh"
    ]
  }

  post-processor "manifest" {
    output     = "manifest.json"
    strip_path = true
  }

}