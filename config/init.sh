#!/bin/bash

# When the webapp depends on a jdbc driver then the following can be activated.
# it will deploy the jdbc driver on the shared libs which are seen by the webapp.
# 
#if [ -f /deployment/sqljdbc4.jar ] ; then
#	# make the jdbc driver globably available for all webapps
#	cd /usr/share/tomcat7/lib
#	ln -s /deployment/sqljdbc4.jar
#else 
#	echo "WARNING: missing Microsoft JDBC driver"
#        echo "See https://msdn.microsoft.com/en-us/library/mt683464%28v=sql.110%29.aspx"
#        # redistribution is not possible on github: https://msdn.microsoft.com/en-us/sqlserver/jj589698
#fi
