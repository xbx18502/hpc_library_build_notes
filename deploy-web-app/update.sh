git clone ....
cd web_app_test/xm-blog/springboot
mvn clean package

# stop systemd service
sudo systemctl stop myapp
# copy the jar file to the server
sudo cp target/xm-blog-0.0.1-SNAPSHOT.jar /opt/myapp/app.jar
# check application.yml file

# start systemd service
sudo systemctl daemon-reload
sudo systemctl start myapp
sudo systemctl enable myapp

# build vue project
cd web_app_test/xm-blog/vue
# edit the .env.production file
# example:
VUE_APP_BASEURL='http://216.238.80.124:9090'

npm run build

# stop nginx
sudo systemctl stop nginx
sudo cp -r dist/* /var/www/html

# reload nginx
sudo systemctl reload nginx
# start nginx
sudo systemctl start nginx
