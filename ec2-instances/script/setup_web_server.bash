#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
mkdir -p /var/www/html | true
cat << EOF | tee /var/www/html/index.html
<html>
    <body>
        <h1><italic>Hola soy Matías Vargas y este es mi IaC!</italic></h1>
    </body>
</html>
EOF
