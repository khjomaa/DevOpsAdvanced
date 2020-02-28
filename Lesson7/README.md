# Lesson 7 HomeWork

### **Exercise**

1. Using AWS console define a launch template called ‘bookstack’ that is defined from the following properties:
    - Instance type is: t2.micro
    - AMI: Amazon Linux 2 AMI (HVM), SSD Volume Type (ami-00068cd7555f543d5)
    - Network Settings: set Security groups with default security group.
    - Instance Type: t2.micro
    - In advanced details define the following user data:
    ```shell script
    #!/usr/bin/bash
    yum install docker -y
    systemctl enable docker
    systemctl start docker
    docker network create bookstack_nw
    docker run -d --net bookstack_nw \
    -e MYSQL_ROOT_PASSWORD=secret \
    -e MYSQL_DATABASE=bookstack \
    -e MYSQL_USER=bookstack \
    -e MYSQL_PASSWORD=secret \
    --name="bookstack_db" \
    mysql:5.7.21
    docker run -d --net bookstack_nw \
    -e DB_HOST=bookstack_db:3306 \
    -e DB_DATABASE=bookstack \
    -e DB_USERNAME=bookstack \
    -e DB_PASSWORD=secret \
    -p 8080:80 \
    solidnerd/bookstack:0.27.5
    ```

2. Define an Autoscaling group named 'bookstack', with 1 instance based on 'bookstack' launch template.
3. Define ingress rule to allow connections on port 8080 from anywhere in default security group.

### **BONUS:**
1. Define the tasks above with AWS CLI.
2. Split it into two templates and groups. One for the MySQL database and the other one is for the application
    - The first template is 'mysql' and is defined exactly the same and it’s user data content is:
    ```shell script
    #!/usr/bin/bash
    yum install docker -y
    systemctl enable docker
    systemctl start docker
    docker run -d \
    -e MYSQL_ROOT_PASSWORD=secret \
    -e MYSQL_DATABASE=bookstack \
    -e MYSQL_USER=bookstack \
    -e MYSQL_PASSWORD=secret \
    -p 3306:3306 \
    mysql:5.7.21
    ```
    - Create an autoscaling group named 'mysql' which 1 instance
    - After the MySQL instance is created go to EC2 instance screen click on the MySQL instance created and save it’s public address
    - The second template is 'bookstack' and is defined exactly the same and it’s user data content is:
    ```shell script
    #!/usr/bin/bash
    yum install docker -y
    systemctl enable docker
    systemctl start docker
    docker run -d \
    -e DB_HOST=<set here public address of the mysql>:3306 \
    -e DB_DATABASE=bookstack \
    -e DB_USERNAME=bookstack \
    -e DB_PASSWORD=secret \
    -p 8080:80 \
    solidnerd/bookstack:0.27.5
    ```


### **Solutions:**

* **Q1, Q2 and Q3**
    - See folder Q1-Q3

* **Bonus**
    - See folder BONUS