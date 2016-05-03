setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config

yum -y install httpd tomcat mariadb-server mariadb unzip nano wget

usermod -a -G vagrant apache
usermod -a -G vagrant tomcat
usermod -a -G vagrant nobody

#wget lucee jars
wget https://bitbucket.org/lucee/lucee/downloads/lucee-4.5.3.004-jars.zip -O "/opt/lucee-jars.zip"
unzip -o /opt/lucee-jars.zip -d /usr/share/tomcat/lib

#copy config files over
if [ ! -d "/var/www/html/WEB-INF" ]; then
	mkdir -p /var/www/html/WEB-INF
fi
if [ ! -d "/usr/share/tomcat/conf/Catalina/localhost" ]; then
	mkdir -p /usr/share/tomcat/conf/Catalina/localhost
fi
if [ ! -d "/usr/share/tomcat/lucee/config/server/lucee-server/context" ]; then
	mkdir -p /usr/share/tomcat/lucee/config/server/lucee-server/context
	chown -R tomcat:tomcat /usr/share/tomcat/lucee
fi
/bin/cp /var/www/html/vagrant_cfg/root.conf /etc/httpd/conf.d
/bin/cp /var/www/html/vagrant_cfg/.htaccess /var/www/html
/bin/cp /var/www/html/vagrant_cfg/ROOT.xml /usr/share/tomcat/conf/Catalina/localhost
/bin/cp /var/www/html/vagrant_cfg/web.xml /var/www/html/WEB-INF
/bin/cp /var/www/html/vagrant_cfg/lucee-server.xml /usr/share/tomcat/lucee/config/server/lucee-server/context
/bin/cp /var/www/html/vagrant_cfg/tomcat /etc/sysconfig

systemctl enable httpd.service
systemctl enable tomcat
systemctl enable mariadb

systemctl start httpd.service
systemctl start tomcat
systemctl start mariadb

sleep 5

#wget lucee jars
wget https://codeload.github.com/blueriver/MuraCMS/zip/master -O "/opt/mura.zip"
unzip -o /opt/mura.zip -d /opt
cp -R /opt/MuraCMS-master/* /var/www/html
chmod 775 -R /var/www/html

mysql -u root -e "create database if not exists mura;"
