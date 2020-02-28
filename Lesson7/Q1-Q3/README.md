## Q1 - Q3

### How to:

#### Q1 : Create **Launch Templates**
1. Sign In to the [AWS Management Console](https://console.aws.amazon.com/console/home?nc2=h_ct&src=header-signin)
2. Click on **EC2** service
3. Expand **INSTANCES** on the left panel and click on **Launch Templates**

    ![](images/aws1.png)
4. Click **Create launch template**
    
    ![](images/aws2.png)
5. Define the following properties:
    - Template name: **bookstack**
    ![](images/aws3.png)
    - Amazon machine image (AMI): **Amazon Linux 2 AMI (HVM), SSD Volume type (ami-0a887e401f7654935)**
    ![](images/aws4.png)
    - Instance type: **t2.micro**
    ![](images/aws5.png)
    - Network settings: Set "Security groups" to "default"
    ![](images/aws6.png)
    - Advanced details: set "User data" to:
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
        ![](images/aws7.png)
6. Click **Create launch template**
 
    ![](images/aws8.png)
7. Click **View launch template**

    ![](images/aws9.png)
8. You should get the following screen:
    
    ![](images/aws10.png)
---

#### Q2 : Create **Auto Scaling Groups**
1. Expand **AUTO SCALING** on the left panel and click on **Auto Scaling Groups**
    
    ![](images/aws11.png)
2. Click **Create Auto Scaling group**

    ![](images/aws12.png)
3. Select **Launch Template**

    ![](images/aws13.png)
4. Select the **bookstack** template
    
    ![](images/aws14.png)
5. Click **Next Step**
    
    ![](images/aws15.png)
6. Define the following:
    - Group name: **bookstack**
    - Launch Template Version: **1 (Default)**
    - Subnet: choose 1
    ![](images/aws16.png)
7. Click **Next: Configure scaling policies**
    
    ![](images/aws17.png)
8. Click **Next: Configure Notifications**
   
    ![](images/aws18.png)
9. Click **Next: Configure Tags**
    
    ![](images/aws19.png)
10. Click **Review**
    
    ![](images/aws20.png)
11. Click **Create Auto Scaling group**
    
    ![](images/aws21.png)

12. You should get the following message:
    
    ![](images/aws22.png)

---

#### Q3 : Create **Define ingress rule to allow connections on port 8080 from anywhere in the default security group**
1. Expand **INSTANCES** on the left panel and click on **Instances**
    
    ![](images/aws23.png)
2. Select the instance
3. Under the **Description** tab click on **default** next to **Security groups**
    ![](images/aws24.png)
4. Click **Edit**
    
    ![](images/aws25.png)
5. Edit the rule as the following:
    - Type: Custom TCP
    - Port Range: 8080
    - Source: Anywhere
6. Click **Save**
    ![](images/aws26.png)

---

#### **Validate**
1. Copy instance **Public DNS (IPv4)** or **IPv4 Public IP**
2. Open browser and navigate to <Public DNS / IP>:8080
3. You should get the login page
4. User: **admin@admin.com**, Password: **password**

![](images/aws27.png)

![](images/aws28.png)

 