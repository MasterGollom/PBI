from django.conf.urls.defaults import patterns, include, url

urlpatterns = patterns('',
     url(r'^plugins/sabnzbdplus/(?P<plugin_id>\d+)/', include('sabnzbdUI.freenas.urls')),
)
