# Lesson 9 HomeWork

### **Exercise**

Define a terraform project that does the following:
1. Create a security for the project
2. Creates an RDS instance with the following properties
    - MySQL version 5.7
    - Instance class is db.t2.micro
    - DB name: bookstack
    - Username: bookstack
    - Password: secret123
    - Attach it both the project security group and the VPCs Security group
    - Define a subnet group and attach the instance to it
    - set it to skip the final snapshot with “skip_final_snapshot = true”
3. Define a launch template as follows:
    - Based on image-id: ami-0b898040803850657
    - Instance type: t2.micro
    - Attach it both the project security group and the VPCs Security group
    - The following user data:
        ```shell script
        #!/usr/bin/bash
        yum install docker -y
        systemctl enable docker
        systemctl start docker
        docker run -d \
        -e DB_HOST=<the rds instance address>:3306 \
        -e DB_DATABASE=bookstack \
        -e DB_USERNAME=bookstack \
        -e DB_PASSWORD=secret123 \
        -p 8080:80 \
        solidnerd/bookstack:0.27.5
        ```
4. Create an autoscaling group which is based on the previously defined launch template, 1 desired instance

### **BONUS:**
1. Attach a load balancer to our autoscaling group.
2. Define autoscaling policy for our autoscaling policy

### **Solutions:**
* **Q1-Q4**
    - See folder Q1-Q4
* **Bonus**
    - See folder BONUS