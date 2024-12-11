1. git clone
2. create a multi-root workspace in vscode

Open Visual Studio Code.

Open the Vue.js project:

Go to File > Open Folder... and select the folder containing your Vue.js project.
Add the Spring Boot project to the workspace:

Go to File > Add Folder to Workspace... and select the folder containing your Spring Boot project.
Save the workspace:

Go to File > Save Workspace As... and save the workspace file (e.g., my-workspace.code-workspace).
Install necessary extensions:

For Vue.js development, install the Vetur extension.
For Spring Boot development, install the Spring Boot Extension Pack.
Configure the workspace:

Create a .vscode folder in your workspace if it doesn't exist.
Add a settings.json file in the .vscode folder with the following content to configure the workspace:
-----------------------------
{
  "folders": [
    {
      "path": "path/to/vue-project"
    },
    {
      "path": "path/to/spring-boot-project"
    }
  ],
  "settings": {
    "vetur.validation.template": true,
    "java.home": "path/to/your/java/home",
    "spring-boot.ls.java.home": "path/to/your/java/home"
  }
}
-----------------------------
3. open vscode, install extensions:
Spring Boot Extension Pack
Spring Boot Tools
Spring Boot Dashboard
Spring Initializr Java Support

vsc-mybatis

4. configure the mysql server

-- Create database if not exists
CREATE DATABASE IF NOT EXISTS `xm-blog`;

-- Create user with password
CREATE USER 'springuser'@'localhost' IDENTIFIED BY '19991210';

-- Grant privileges
GRANT ALL PRIVILEGES ON `xm-blog`.* TO 'springuser'@'localhost';

-- Apply privileges
FLUSH PRIVILEGES;

-- Verify
SHOW GRANTS FOR 'springuser'@'localhost';

-- test
mysql -u springuser -p19991210

# Check MySQL config
sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
# Ensure bind-address is 0.0.0.0

# if mysql server runs in a wsl2
# In Windows PowerShell
wsl hostname -I

# In mysql
-- In MySQL
CREATE USER 'springuser'@'%' IDENTIFIED BY '19991210';
GRANT ALL PRIVILEGES ON `xm-blog`.* TO 'springuser'@'%';
FLUSH PRIVILEGES;

5. update the application.properties file in the spring boot project
url: jdbc:mysql://172.17.86.171:3306/xm-blog?useUnicode=true&characterEncoding=utf-8&allowMultiQueries=true&useSSL=false&serverTimezone=GMT%2b8&allowPublicKeyRetrieval=true
username: springuser
password: 19991210

6. run the spring boot project in vscode
7. run the vue.js project in vscode
# if node_modules is not installed
npm install

npm run serve
