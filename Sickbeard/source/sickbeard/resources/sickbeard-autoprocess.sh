#!/bin/sh
sickbeard_dir=/usr/pbi/sickbeard-$(uname -m)

##grab sickbeard properties##
username=`grep web_username $sickbeard_dir/data/config.ini | awk '{ print $3}'`
base="${username%\"}"
base="${username#\"}"
password=`grep web_password $sickbeard_dir/data/config.ini | awk '{ print $3}'`
base="${password%\"}"
base="${password#\"}"
port=`grep web_port $sickbeard_dir/data/config.ini | tr -dc '[0-9]'`
base=`grep -m 1 web_root $sickbeard_dir/data/config.ini | awk '{ print $3}'`
base="${base%\"}"
base="${base#\"}"
ssl=`grep enable_https $sickbeard_dir/data/config.ini | tr -dc '[0-9]'`
#############################

echo '[SickBeard]' > $sickbeard_dir/SickBeard/autoProcessTV/autoProcessTV.cfg
echo 'host=127.0.0.1' >> $sickbeard_dir/SickBeard/autoProcessTV/autoProcessTV.cfg
echo 'port='$port >> $sickbeard_dir/SickBeard/autoProcessTV/autoProcessTV.cfg
echo 'username='$username >> $sickbeard_dir/SickBeard/autoProcessTV/autoProcessTV.cfg
echo 'password='$password >> $sickbeard_dir/SickBeard/autoProcessTV/autoProcessTV.cfg
echo 'webroot='$base >> $sickbeard_dir/SickBeard/autoProcessTV/autoProcessTV.cfg
echo 'ssl='$ssl >> $sickbeard_dir/SickBeard/autoProcessTV/autoProcessTV.cfg
