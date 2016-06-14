# Docker-tomcat

This docker deploys a tomcat service with a clear combination of java and tomcat version. 
It exploits the Linux Tomcat deployment strategy and applies the TenForce docker setup guidelines.


Deploying a webapp is as simple as downloading the webapp in the webapps directory and creating a context file for it in the contexts.
The Tomcat context can be configured by overwriting the init.sh script and the content of the base tomcat configuration files that are in config.



## version



## Running the docker

create a directory structure

/mywebapp/
      contexts
      data
      logs
      

with default configurations
```
sudo docker run  -p 8080:8080 --name my-tomcat    \
             -v /home/vagrant/mywebapp/data:/data \ 
             -v /home/vagrant/mywebapp/contexts:/contexts \
             tenforce/docker-tomcat7-java8
```

with default configurations & exposing the logs on a known location
```
sudo docker run  -p 8080:8080 --name my-tomcat    \
             -v /home/vagrant/mywebapp/data:/data \ 
             -v /home/vagrant/mywebapp/logs:/logs \
             -v /home/vagrant/mywebapp/contexts:/contexts \
             tenforce/docker-tomcat7-java8
```

with custom configurations & exposing the logs on a known location
```
sudo docker run  -p 8080:8080 --name my-tomcat    \
             -v /home/vagrant/mywebapp/data:/data \ 
             -v /home/vagrant/mywebapp/logs:/logs \
             -v /home/vagrant/mywebapp/contexts:/contexts \
             -v /home/vagrant/mywebapp/config:/config \
             tenforce/docker-tomcat7-java8
```

For debugging purposes can the webapps directory also be mounted.


## Usage recommendations
As indicated in the sections above, one can use the docker directly to run a Tomcat service.
However in that case the docker packaging specific for your webapp is not realized: i.e. your webapp is then not delivered as a deployable service on e.g. DockerHub.

Is the service it the intend then the following instructions are best followed.
a) first test the deployment locally using tomcat-docker.
b) turn this in a Docker service as follows: 



## adapting versions
A tomcat setup is defined by the versions of 2 base components: tomcat and java.
This docker setup is based on the java image. Adpating to a new java image is as simple as adapting the base java image from which this tomcat is build.

As a side effect of such change: it might be that the tomcat version is not available per default in the linux distributions on which the java image is build.
Investigate if there is a backport for the tomcat version available and redirect then repository content to it.

Adpating the tomcat version is very similar as to the java version.

