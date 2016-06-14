#!/bin/sh
CLASSPATH="$CLASSPATH:/deployment"

JAVA_OPTS="${JAVA_OPTS} -Xmx1g -Xms512m"

# use this configuration instead of creating the .aduna files
# -Dinfo.aduna.platform.appdata.basedir=/var/lib/tomcat6/data
