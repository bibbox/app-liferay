#!/bin/bash
echo "Starting Liferay Application Container!"

. defaultvar.sh

file="/opt/liferay/setup.done"

#Config
if [[ ! -f "$file" ]]; then
    
cat << EOF > $file
Liferay 0.0.1 installed
EOF

sed -i "s/EMAIL_ADDRESS/${EMAIL_ADDRESS}/g" /opt/liferay/portal-setup-wizard.properties
sed -i "s/EMAIL_ADMIN_NAME/${EMAIL_ADMIN_NAME}/g" /opt/liferay/portal-setup-wizard.properties
sed -i "s/COMPANY_NAME/${COMPANY_NAME}/g" /opt/liferay/portal-setup-wizard.properties
sed -i "s/DATABASE_HOST/${DATABASE_HOST}/g" /opt/liferay/portal-setup-wizard.properties
sed -i "s/DATABASE_PORT/${DATABASE_PORT}/g" /opt/liferay/portal-setup-wizard.properties
sed -i "s/POSTGRES_DB/${POSTGRES_DB}/g" /opt/liferay/portal-setup-wizard.properties
sed -i "s/POSTGRES_USER/${POSTGRES_USER}/g" /opt/liferay/portal-setup-wizard.properties
sed -i "s/POSTGRES_PASSWORD/${POSTGRES_PASSWORD}/g" /opt/liferay/portal-setup-wizard.properties

chown -R liferay:liferay /opt/liferay

fi

#Startu Up
service liferay start
tail -f /opt/liferay/tomcat-7.0.42/logs/catalina.out