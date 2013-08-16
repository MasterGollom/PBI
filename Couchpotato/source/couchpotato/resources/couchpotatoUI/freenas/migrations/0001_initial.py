# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Couchpotato'
        db.create_table('freenas_couchpotato', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('enable', self.gf('django.db.models.fields.BooleanField')(default=False)),
        ))
        db.send_create_signal('freenas', ['Couchpotato'])


    def backwards(self, orm):
        # Deleting model 'Couchpotato'
        db.delete_table('freenas_couchpotato')


    models = {
        'freenas.couchpotato': {
            'Meta': {'object_name': 'Couchpotato'},
            'enable': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'})
        }
    }

    complete_apps = ['freenas']
