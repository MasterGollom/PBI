#!/bin/sh

#Download Cheetah

wget https://pypi.python.org/packages/source/C/Cheetah/Cheetah-2.4.4.tar.gz#md5=853917116e731afbc8c8a43c37e6ddba --no-check-certificate
tar xvfz Cheetah-2.4.4.tar.gz
rm -r Cheetah-2.4.4.tar.gz
cd Cheetah-2.4.4

#Create tempfile and replace setup.py

tmpfile=$(mktemp /tmp/.XXXXXX)
echo "#!/usr/pbi/sabnzbdplus-amd64/bin/python" > ${tmpfile}
grep -v '#!/usr/bin/env python' setup.py >> ${tmpfile}
mv ${tmpfile} setup.py

#Install Cheetah
/usr/pbi/sabnzbdplus-$(uname -m)/bin/python setup.py install

#Business as usual

sabnzbd_pbi_path=/usr/pbi/sabnzbdplus-$(uname -m)

cp ${sabnzbd_pbi_path}/etc/rc.d/sabnzbd /usr/local/etc/rc.d/sabnzbd

mkdir -p ${sabnzbd_pbi_path}/etc/sabnzbd/home

pw user add _sabnzbd -d ${sabnzbd_pbi_path}/etc/sabnzbd/home

chown -R _sabnzbd:_sabnzbd ${sabnzbd_pbi_path}/etc/sabnzbd
chmod 755 ${sabnzbd_pbi_path}/etc/sabnzbd/home

${sabnzbd_pbi_path}/bin/python ${sabnzbd_pbi_path}/sabnzbdUI/manage.py syncdb --migrate --noinput

#Copy sabnzbd.ini from pbi root directory to sabnzbd directory
mv ${sabnzbd_pbi_path}/sabnzbd.ini ${sabnzbd_pbi_path}/sabnzbd/sabnzbd.ini

#Get IP and replace the host of the sabnzbd.ini
myipaddr=$(ifconfig  | grep -E 'inet.[0-9]' | grep -v '127.0.0.1' | awk '{ print $2}')
sed -ie 's/host = localhost/host = '${myipaddr}'/' ${sabnzbd_pbi_path}/sabnzbd/sabnzbd.ini
