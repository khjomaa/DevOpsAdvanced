# Lesson 8 HomeWork

### **Exercise**

Define in terraform the following resources:
1. Security group with ingress rule allowing communication from anywhere on port 80 named: **dokuwiki-sg**
2. AWS instance with the following attributes:
    - based on amazon linux AMI
    - t2.micro size
    - The following user data:
        ```shell script
        #!/usr/bin/bash
        yum install docker -y
        systemctl enable docker
        systemctl start docker
        docker run -d -p 80:80 --name dokuwiki bitnami/dokuwiki:latest```

    - Security groups: default and dokuwiki
3. Define the previous EC2 instance as an autoscaling group with 1 instance

### **BONUS:**
1. Define the following resources with terraform:
    - Define a new VPC with 2 subnets on us-east-1 region
    - Define the project above in the VPC you just created
    
    
### **Solutions:**

* **Q1, Q2**
    - See folder Q1-Q2
* **Q3**
    - See folder Q3
* **Bonus**
    - See folder BONUS