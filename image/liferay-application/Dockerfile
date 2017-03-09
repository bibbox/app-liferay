# Liferay 6.2 GA6 application container
# 
# VERSION 0.0.1 
# 
# 0.0.1 : initial creation of image with Liferay and Data from RD-Connect

FROM debian:jessie 

MAINTAINER Robert Reihs <robert.reihs@gmail.com>

RUN apt-get update \
    && apt-get -y install wget unzip \
    && echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections \
    && echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list \
    && echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 \
    && apt-get update \
    && apt-get -y install oracle-java7-installer \
    && apt-get -y install oracle-java7-set-default
    
WORKDIR /opt
    
RUN wget -O liferay-portal-tomcat-6.2-ce-ga2.zip  http://downloads.sourceforge.net/project/lportal/Liferay%20Portal/6.2.1%20GA2/liferay-portal-tomcat-6.2-ce-ga2-20140319114139101.zip \
    && unzip liferay-portal-tomcat-6.2-ce-ga2.zip \
    && rm liferay-portal-tomcat-6.2-ce-ga2.zip \
    && mv liferay-portal-6.2-ce-ga2 liferay \
    && useradd -r liferay
    
ADD configs/functions /etc/init.d/functions
RUN chmod +x /etc/init.d/functions
ADD configs/liferay /etc/init.d/liferay
RUN chmod +x /etc/init.d/liferay

ADD configs/portal-ext.properties /opt/liferay/portal-ext.properties
ADD configs/portal-setup-wizard.properties /opt/liferay/portal-setup-wizard.properties
RUN chown -R liferay:liferay /opt/liferay

ADD scripts /opt/scripts
WORKDIR /opt/scripts
RUN chmod a+x *.sh

ENTRYPOINT ["/opt/scripts/entrypoint.sh"]