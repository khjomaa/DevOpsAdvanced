#!/usr/bin/bash

yum install docker -y
systemctl enable docker
systemctl start docker
docker run -d \
-e DB_HOST=${db_host}:3306 \
-e DB_DATABASE=${db_database} \
-e DB_USERNAME=${db_database} \
-e DB_PASSWORD=${db_password} \
-p 8080:80 \
solidnerd/bookstack:0.27.5