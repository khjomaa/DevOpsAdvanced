## BONUS

**Commands**:
- ```cd BONUS/projects/bookstack/```
- ```terraform init```
- ```terraform plan```
- ```terraform apply```

**Check:**
- Wait until instance fully initialize
- Copy LoadBalancer url from outputs
    ![](../images/elb_url.png)
- Browse to LB url
- Credentials:
    - Email: admin@admin.com
    - Password: password
![](../images/bookstack.png)

**Clean**:
- ```terraform destroy --auto-approve```