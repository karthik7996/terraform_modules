provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "sharath-terraform-bucket"
    key    = "Flask/terraform.tfstate"
    region = "us-east-1"
  }
}


module "vpc" {
  source = "/home/ec2-user/terraform/flask/module/vpc"
}

module "security_group" {
  source = "/home/ec2-user/terraform/flask/module/security"

  vpc_id = module.vpc.instance_vpc_id.id
}

module "instances" {
  source = "/home/ec2-user/terraform/flask/module/ec2"

  instance_name         = var.instance_name
  subnet_id             = module.vpc.subnet_id
  vpc_security_group_id = module.security_group.vpc_security_group_id

}


resource "null_resource" "flask_data" {
  provisioner "local-exec" {
    command = "echo ${module.instances.public_ip} > /home/ec2-user/terraform/flask/project/ip.txt"
  }

  provisioner "file" {
    source      = var.source
    destination = var.destination

    connection {
      type        = var.type
      user        = var.user
      private_key = file(var.key_pair)
      host        = module.instances.public_ip



    }
  }
  connection {
    type        = var.type
    user        = var.user
    private_key = file(var.key_pair)
    host        = module.instances.public_ip
  }


  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install epel -y",
      "sudo yum install python-pip python-devel gcc nginx -y",
      "sudo pip install virtualenv",
      "mkdir ~/myproject",
      "cp -f ~/project/myproject.py ~/myproject",
      "cp -f ~/project/wsgi.py ~/myproject",
      "cd ~/project",
      "/bin/bash public.bash",
      "cd ~/myproject",
      "virtualenv myprojectenv",
      "source myprojectenv/bin/activate",
      "pip install gunicorn flask",
      "deactivate",
      "sudo cp -f ~/project/myproject.service /etc/systemd/system/",
      "sudo systemctl start myproject",
      "sudo systemctl enable myproject",
      "cd ~/project/",
      "sudo sed -i '37 r file' /etc/nginx/nginx.conf",
      "sudo cd ~/myproject",
      "sudo usermod -a -G ec2-user nginx",
      "chmod 710 /home/ec2-user",
      "sudo nginx -t",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]
  }
}

