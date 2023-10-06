build {

  sources = ["source.amazon-ebs.centos7"]

  provisioner "file" {
    source      = "scripts/packages.sh"
    destination = "/tmp/packages.sh"
  }

  provisioner "file" {
    source      = "scripts/sshConf.sh"
    destination = "/tmp/sshConf.sh"
  }

  provisioner "shell" {
    inline = [
      "sh /tmp/sshConf.sh"
    ]
  }

  provisioner "shell" {
    inline = [
        "sh /tmp/packages.sh"
        ]
  }

  post-processor "manifest" {
    output     = "manifest.json"
    strip_path = true
  }

}