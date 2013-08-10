# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Sabnzbd'
        db.create_table('freenas_sabnzbd', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('enable', self.gf('django.db.models.fields.BooleanField')(default=False)),
        ))
        db.send_create_signal('freenas', ['Sabnzbd'])


    def backwards(self, orm):
        # Deleting model 'Sabnzbd'
        db.delete_table('freenas_sabnzbd')


    models = {
        'freenas.sabnzbd': {
            'Meta': {'object_name': 'Sabnzbd'},
            'enable': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'})
        }
    }

    complete_apps = ['freenas']
