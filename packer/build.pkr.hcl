build {

  sources = ["source.amazon-ebs.centos8"]

  provisioner "file" {
    source      = "scripts/_ssh.sh"
    destination = "/tmp/_ssh.sh"
  }

  provisioner "file" {
    source      = "scripts/_sshd_config"
    destination = "/etc/ssg/sshd_config"
  }

  provisioner "shell" {
    inline = [
      "sudo sh /tmp/_ssh.sh"
    ]
  }

  post-processor "manifest" {
    output     = "manifest.json"
    strip_path = true
  }

}