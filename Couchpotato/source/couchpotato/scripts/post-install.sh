#!/bin/sh

#Business as usual

couchpotato_pbi_path=/usr/pbi/couchpotato-$(uname -m)

cp ${couchpotato_pbi_path}/etc/rc.d/couchpotato /usr/local/etc/rc.d/couchpotato

mkdir -p ${couchpotato_pbi_path}/data

pw user add media -d ${couchpotato_pbi_path}/data

chown -R media:media ${couchpotato_pbi_path}/data
chmod 755 ${couchpotato_pbi_path}/data

${couchpotato_pbi_path}/bin/python ${couchpotato_pbi_path}/couchpotatoUI/manage.py syncdb --migrate --noinput
