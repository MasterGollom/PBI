# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Sickbeard'
        db.create_table('freenas_sickbeard', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('enable', self.gf('django.db.models.fields.BooleanField')(default=False)),
        ))
        db.send_create_signal('freenas', ['Sickbeard'])


    def backwards(self, orm):
        # Deleting model 'Sickbeard'
        db.delete_table('freenas_sickbeard')


    models = {
        'freenas.sickbeard': {
            'Meta': {'object_name': 'Sickbeard'},
            'enable': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'})
        }
    }

    complete_apps = ['freenas']
