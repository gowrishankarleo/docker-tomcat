#!/bin/sh
set -x
echo "deploy the configuration files"

service tomcat7 stop


if [ -f /config/init.sh ];
then
        echo "Running custom init script"
        chmod +x /config/init.sh
	# add sync to avoid the bug "Text file busy" 
	sync
        /config/init.sh
fi

if [ -n "${Xmx}" ];
then
        sed -i s/Xmx.*\ /Xmx${Xmx}\ /g /etc/default/tomcat7
fi

if [ -n "${JAVA_OPTS}" ];
then
        # Add any Java opts that are set in the container
        echo "Adding JAVA OPTS"
        echo "JAVA_OPTS=\"\${JAVA_OPTS} ${JAVA_OPTS} \"" >> /etc/default/tomcat7
fi

if [ -n "${JAVA_HOME}" ];
then
	# Add java home if set in container
	echo "Adding JAVA_HOME"
	echo "JAVA_HOME=\"${JAVA_HOME}\"" >> /etc/default/tomcat7
fi

# deploy the configuration files
echo "deploy the configuration files"
chown tomcat7:tomcat7 /config
cp /config/tomcat-setenv.sh /usr/share/tomcat7/bin/setenv.sh
cp /config/tomcat-users.xml /var/lib/tomcat7/conf/tomcat-users.xml
chown root:tomcat7 /var/lib/tomcat7/conf/tomcat-users.xml

# deploy the webapps 
cp /contexts/* /etc/tomcat7/Catalina/localhost/


echo "Start the tomcat7 service" 
service tomcat7 start

#Override the exit command to prevent accidental container distruction 
echo 'alias exit="echo Are you sure? this will kill the container. use Ctrl + p, Ctrl + q to detach or ctrl + d to exit"' > ~/.bashrc

# tail the catalina logs to the terminal
# this makes the docker logs work properly and ensures that the proces does not end
tail -f /var/log/tomcat7/catalina.out
