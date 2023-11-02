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

  provisioner "file" {
    source      = "seLinux/config"
    destination = "/tmp/seLinuxConfig"
  }

  provisioner "file" {
    source      = "scripts/terminal_color"
    destination = "/tmp/"
  }
  #terminal colors
  provisioner "shell" {
    inline = [
      "sudo mv -vf /tmp/terminal_color/bash.bashrc /etc/bash.bashrc",
      "sudo mv /tmp/terminal_color/DIR_COLORS /etc/",
      "mv /tmp/terminal_color/.bashrc ~/.bashrc"
    ]
  }
  #remove SELinux in centos 8
  provisioner "shell" {
    inline = [
      "sudo rm -rvf /etc/selinux/config",
      "sudo mv -vf /tmp/seLinuxConfig /etc/selinux/config",
      "sudo setenforce 0"
    ]
  }
  #settingup SSH connection
  provisioner "shell" {
    inline = [
      "sudo rm -rvf /root/.ssh/config /root/.ssh/authorized_keys /etc/cloud/cloud.cfg /etc/ssh/sshd_config",
      "sudo mv -vf /tmp/config /root/.ssh/config",
      "sudo mv -vf /tmp/cloud.cfg /etc/cloud/cloud.cfg",
      "sudo mv -vf /tmp/sshd_config /etc/ssh/sshd_config",
      "sudo echo 'DevOps321' | sudo passwd --stdin root",
      "sudo chown root /root/.ssh/config"
      "sudo chmod 600 /root/.ssh/config"
      "sudo sudo service sshd restart",
    ]
  }

  post-processor "manifest" {
    output     = "manifest.json"
    strip_path = true
  }

}