#!/bin/bash

echo "
CREATE USER 'keycloak'@'%' IDENTIFIED BY 'JUQ7XUG02wZ1gZfXgs5g';
CREATE DATABASE keycloak;
GRANT ALL PRIVILEGES ON keycloak.* TO 'keycloak'@'%';" > /tmp/1.sql

mysql --user="root" --password="9uvEJqmzkZqpwiWGxRdn" </tmp/1.sql