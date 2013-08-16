import os
import platform
import pwd

from django.utils.translation import ugettext_lazy as _

from dojango import forms
from couchpotatoUI.freenas import models, utils


class CouchpotatoForm(forms.ModelForm):

    class Meta:
        model = models.Couchpotato

        exclude = (
            'enable',
            )

    def __init__(self, *args, **kwargs):
        self.jail_path = kwargs.pop('jail_path')
        super(CouchpotatoForm, self).__init__(*args, **kwargs)

    def save(self, *args, **kwargs):
        obj = super(CouchpotatoForm, self).save(*args, **kwargs)

        rcconf = os.path.join(utils.couchpotato_etc_path, "rc.conf")
        with open(rcconf, "w") as f:
            if obj.enable:
                f.write('couchpotato_enable="YES"\n')

        os.system(os.path.join(utils.couchpotato_pbi_path, "tweak-rcconf"))
