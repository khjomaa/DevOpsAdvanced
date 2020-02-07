# Lesson 3 HomeWork

## Exercise

1. Create a new helm chart that deploys a 3 pod deployment of the following docker image: **avielb/todo:latest**
2. Create for it also a service of type NodePort
3. Deploy that chart to a chart museum application
4. BONUS:
    * Helm:
        * Based on the following YAML files, create a helm chart that wraps the following YAML files:
          https://k8s.io/examples/application/wordpress/mysql-deployment.yaml
          https://k8s.io/examples/application/wordpress/wordpress-deployment.yaml
as one helm chart
        * Use Github Pages as helm repository to store your chart, as described here: 
          https://helm.sh/docs/topics/chart_repository/#github-pages-example

    * Kubespray:
        * Deploy a kubernetes cluster (1 master and 2 workers) using kubespray following the commands at:
          k8s-experts/on-premise/kubespray/commands.txt

What to send me?
1. Link to GitHub repository in the following format:
```https://github.com/<your github user>/todo```
2. The repository will contain your helm chart files and commands you used to deploy it.
3. Screenshot of your playbook finish successfully.

## Solution:
1. Q1 - Q3: https://github.com/khjomaa/todo
2. BONUS: 
    * Helm - Working On it
    * Kubespary - See README.md file inside kubespray folder  