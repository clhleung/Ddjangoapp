# instance_creation.tf
# Terraform file detailing the creation of an AWS Linux instance 
# Comes preloaded with commands to auto install Docker, Git, Java 1.8, and Jenkins
# May assign instance configuration to Puppet/Chef/Ansible later for better control as instances scale up

provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region     = "${var.region}"
}
           
resource "aws_instance" "web" {
    ami = "ami-922914f7"
    instance_type = "t2.micro"
    key_name = "my-ec2-key-pair1"
    security_groups = ["sshConnect"]  
    
    connection {
      type = "ssh"
      user = "ec2-user"
      private_key = "${file("my-ec2-key-pair1.pem")}"
    }
                 
    provisioner "remote-exec" {    
        inline = [        
          "sudo yum update -y",
          "sudo yum install -y docker",
          "sudo service docker start",
          "sudo usermod -aG docker ec2-user",          
          "sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo",  
          "sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key",
          "sudo yum install jenkins -y",
          "sudo yum install java-1.8.0 -y",
          "sudo yum remove java-1.7.0-openjdk -y",
          "sudo yum install git -y",                
        ]
    } 
}