from django.conf.urls.defaults import patterns, include, url

urlpatterns = patterns('',
     url(r'^plugins/Sickbeard/(?P<plugin_id>\d+)/', include('sickbeardUI.freenas.urls')),
)
