#!/bin/sh

sickbeard_pbi_path=/usr/pbi/sickbeard-$(uname -m)

#Install Cheetah
cd ${sickbeard_pbi_path}/Cheetah
${sickbeard_pbi_path}/bin/python setup.py install

#Business as usual
cp ${sickbeard_pbi_path}/etc/rc.d/sickbeard /usr/local/etc/rc.d/sickbeard

mkdir -p ${sickbeard_pbi_path}/data

pw user add _sickbeard -d ${sickbeard_pbi_path}/data

chown -R _sickbeard:_sickbeard ${sickbeard_pbi_path}/data
chmod 755 ${sickbeard_pbi_path}/data

${sickbeard_pbi_path}/bin/python ${sickbeard_pbi_path}/sickbeardUI/manage.py syncdb --migrate --noinput


