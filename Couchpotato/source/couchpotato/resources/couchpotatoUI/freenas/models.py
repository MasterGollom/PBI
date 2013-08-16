from django.db import models


class Couchpotato(models.Model):
    """
    Django model describing every tunable setting for couchpotato
    """

    enable = models.BooleanField(default=False)
