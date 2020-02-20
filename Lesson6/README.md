# Lesson 6 HomeWork

### **Exercise**

1. Deploy jenkins with the helm chart here:
https://github.com/helm/charts/tree/master/stable/jenkins

2. Write a pipeline that is using the PodTemplate plugin that will do the following as two
different steps on different containers:
    - Start a CentOS 7 container, and will run on it:
    
        ```cat /etc/*-release```
    - Start an Ubuntu container, and will run on it:
    
        ```cat /etc/*-release```

3. Write a pipeline that will do two steps:
    - checks out the following repository:
    https://github.com/web3j/sample-project-maven
    - inside a maven:3.3.9-jdk-8-alpine docker image:
        
        ```mvn clean install```

4. BONUS: Wrap the podtemplate definitions to be jenkins shared libraries.


### **What to send me?**
2 Jenkins pipelines groovy code.

### **Solutions:**

* **Q1, Q2 and Q3**
    - See folder Q1-Q3

* **Bonus**
    - See BONUS folder
