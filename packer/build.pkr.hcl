build {

  sources = ["source.amazon-ebs.amazonLinux2"]

  provisioner "file" {
    source      = "scripts/patch.sh"
    destination = "/tmp/patch.sh"
  }
  
  provisioner "shell" {
    inline = [
      "id"
    ]
  }

  provisioner "shell" {
    # script = "/tmp/patch.sh"
    inline = [
        "sh /tmp/patch.sh"
        ]
  }

  post-processor "manifest" {
    output     = "manifest.json"
    strip_path = true
  }

}