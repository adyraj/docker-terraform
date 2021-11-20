terraform {
  backend "remote" {
    organization = "adyraj"

    workspaces {
      name = "docker-terraform"
    }
  }
}

provider "aws" {
   region = "ap-south-1"
}

resource "null_resource" "example1" {
  provisioner "local-exec" {
    command = <<-EOT
      chmod +x script.sh
      ./script.sh
    EOT
    interpreter = ["/bin/bash"]
  }
}