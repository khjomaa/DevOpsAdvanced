# Lesson 10 HomeWork

### **Exercise**
Create a terraform project that will do the following:
1. Define an S3 bucket {your-name}-assets
2. Upload to the bucket the attached ZIP file HERE
3. Create a lambda function with the following attributes:
    - Allocate it 128MB of RAM
    - It’s name is “HelloWorldFunction” and
    - It’s source code will be S3 under s3://{your-name}-assets/app.zip
    - The function handler will be “app.handler”
    - IAM assumable role by lambda service with the following policy:
        ```json5
       {
         "Version": "2012-10-17",
         "Statement": [
           {
             "Action": "sts:AssumeRole",
             "Principal": {
               "Service": "lambda.amazonaws.com"
             },
             "Effect": "Allow",
             "Sid": ""
           }
         ]
       }
        ```

### **BONUS:**
1. Use CloudWatch to trigger the function every 10 minutes
2. Create a repository on github: https://github.com/<github_user>/lambda_app.git
3. Push the code (app.py and terraform project) from the previous section to the repository
4. Write a jenkins pipeline with the following stages:
    - Clone repository
    - Zip app.py
    - Upload app.zip to s3://{your-name}-assets/app.zip
    - Run terraform init, terraform plan and terraform apply.
    - Change the terraform state to be saved in S3 backend

### **Solutions:**
* **QQ1**
    - See folder Q1
    
* **Bonus**
    - See folder BONUS