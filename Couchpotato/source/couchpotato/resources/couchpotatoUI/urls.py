from django.conf.urls.defaults import patterns, include, url

urlpatterns = patterns('',
     url(r'^plugins/Couchpotato/(?P<plugin_id>\d+)/', include('couchpotatoUI.freenas.urls')),
)
