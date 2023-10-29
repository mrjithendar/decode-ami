build {

  sources = ["source.amazon-ebs.centos7"]

  provisioner "file" {
    source      = "scripts/packages.sh"
    destination = "/tmp/packages.sh"
  }

  provisioner "file" {
    source      = "scripts/update.sh"
    destination = "/tmp/update.sh"
  }

  provisioner "shell" {
    inline = [
      "sh /tmp/update.sh"
    ]
  }

  # provisioner "shell" {
  #   inline = [
  #       "sh /tmp/packages.sh"
  #       ]
  # }

  post-processor "manifest" {
    output     = "manifest.json"
    strip_path = true
  }

}

build {

  sources = ["source.amazon-ebs.centos8"]

  provisioner "file" {
    source      = "scripts/packages.sh"
    destination = "/tmp/packages.sh"
  }

  provisioner "file" {
    source      = "scripts/update.sh"
    destination = "/tmp/update.sh"
  }

  provisioner "shell" {
    inline = [
      "sh /tmp/update.sh"
    ]
  }

  # provisioner "shell" {
  #   inline = [
  #       "sh /tmp/packages.sh"
  #       ]
  # }

  post-processor "manifest" {
    output     = "manifest.json"
    strip_path = true
  }

}