# security_group.tf
# Terraform file to generate AWS secrity group for created instances
# File is used to open up ports for inbound traffic and allow all outbound traffic

resource "aws_security_group" "connect"{
    name = "sshConnect"
    description = "Accept SSH connections"       
             
    # TCP access
    ingress {
        from_port = 22
        to_port = "22"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # HTTP access from anywhere
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    # Access from localhost port 8080
    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }    
    
    # All Traffic Out Bound
    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]       
    }
}