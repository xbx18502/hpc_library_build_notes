# 1.install ubuntu 24.04

# 2.update system 
sudo apt update && sudo apt upgrade -y

# install all dependencies
# ------------------------------------------------------------
# install java
sudo apt install openjdk-8-jdk
java -version

# install node.js
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install -y nodejs

node -v
npm -v

sudo apt install nginx -y

sudo systemctl start nginx
sudo systemctl enable nginx

# install mysql
sudo apt install mysql-server -y
sudo systemctl start mysql
sudo systemctl enable mysql
sudo mysql_secure_installation

# ------------------------------------------------------------

# create database
CREATE DATABASE `xb-blog`

# export sql file
mysql -u root -p xb-blog > backup.sql

# import sql file
mysql -u root -p xb-blog < backup.sql

# check mysql auth plugin
SELECT user, host, plugin FROM mysql.user WHERE user='root';

# change mysql auth plugin
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'your_new_password';
FLUSH PRIVILEGES;

# create a new mysql user
CREATE USER 'springuser'@'localhost' IDENTIFIED BY 'your_password';
GRANT ALL PRIVILEGES ON your_database_name.* TO 'springuser'@'localhost';
FLUSH PRIVILEGES;

# export .jar file
mvn clean package

# upload .jar file to server



# configure backend springboot application
# ------------------------------------------------------------

# create a new application.yml file
sudo nano /opt/myapp/config/application.yml

# example of application.yml

spring:
  datasource:
    url: jdbc:mysql://localhost:3306/your_database_name?useSSL=false&serverTimezone=UTC
    username: your_db_username
    password: your_db_password
  jpa:
    hibernate:
      ddl-auto: update
    show-sql: true
server:
  port: 8080

# encure privilige of application.yml file
sudo chown your_username:your_username /opt/myapp/config/application.yml
sudo chmod 600 /opt/myapp/config/application.yml

# create systemd service
sudo nano /etc/systemd/system/myapp.service

# example of myapp.service
[Unit]
Description=My Spring Boot Application
After=network.target

[Service]
User=your_username
Group=your_group
# 如果使用外部配置文件，添加以下行
ExecStart=/usr/bin/java -jar /opt/myapp/app.jar --spring.config.location=/opt/myapp/config/application.yml
# 如果配置文件在jar内，使用以下行
# ExecStart=/usr/bin/java -jar /opt/myapp/app.jar
SuccessExitStatus=143
Restart=on-failure
RestartSec=10

[Install]
WantedBy=multi-user.target

sudo systemctl daemon-reload
sudo systemctl start myapp
sudo systemctl enable myapp

# check the status of the service
sudo systemctl status myapp

# check the logs of the service
sudo journalctl -u myapp.service

# ------------------------------------------------------------

# configure frontend vue application

cd ~/vue

npm install

npm run build

# upload dist folder to server

# configure nginx

sudo nano /etc/nginx/sites-available/myapp
# example

server {
    listen 80;
    server_name your_actual_domain.com www.your_actual_domain.com;  # 替换为您的实际域名

    # 前端静态文件的根目录
    root /home/xiao/vue-project/www/myapp;
    index index.html;

    # 处理前端路由
    location / {
        try_files $uri $uri/ /index.html;
    }

    # 反向代理后端API请求
    location /api/ {
        proxy_pass http://localhost:9090/api/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    # 可选：处理其他静态资源（如图片、CSS、JS）
    location /static/ {
        alias /home/xiao/vue-project/www/myapp/static/;
    }

    # 错误页面
    error_page 500 502 503 504 /50x.html;
    location = /50x.html {
        root /usr/share/nginx/html;
    }
}

sudo ln -s /etc/nginx/sites-available/myapp /etc/nginx/sites-enabled/
sudo nginx -t

sudo systemctl reload nginx

sudo nginx -s reload

sudo systemctl restart nginx


#check nginx log
sudo tail -n 50 /var/log/nginx/error.log
# check firewall
sudo ufw status

# ensure ngix has privilege to access myapp and all its parent folders
sudo chmod 755 /home/xiao
sudo chmod 755 /home/xiao/vue-project
sudo chmod 755 /home/xiao/vue-project/www

sudo journalctl -u myapp -f

sudo tail -f /var/log/nginx/error.log

# edit .env.production file
nano /home/xiao/web_app_test/xm-blog/vue/.env.production

# for development
server {
    listen 80;
    server_name 216.238.80.124;

    location / {
        proxy_pass http://localhost:8080;  # 假设 Vue 开发服务器运行在 8080 端口
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}

# if do not proxy the backend api
# ------------------------------------------------------------
server {
    listen 80;
    server_name 216.238.80.124;  # 替换为您的实际域名

    # 前端静态文件的根目录
    root /home/xiao/vue-project/www/myapp;
    index index.html;

    # 处理前端路由
    location / {
        try_files $uri $uri/ /index.html;
    }

    # location ~ ^/(login|front|user|products) {
    #     proxy_pass 'http://216.238.80.124:9090';
    #     proxy_set_header Host $host;
    #     proxy_set_header X-Real-IP $remote_addr;
    #     proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    #     proxy_set_header X-Forwarded-Proto $scheme;
    # }

    # 处理静态资源
    location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg|woff|woff2|ttf|eot)$ {
        expires max;
        add_header Cache-Control "public, max-age=31536000";
    }

    # 错误页面
    error_page 500 502 503 504 /50x.html;
    location = /50x.html {
        root /usr/share/nginx/html;
    }
}
# ------------------------------------------------------------

















