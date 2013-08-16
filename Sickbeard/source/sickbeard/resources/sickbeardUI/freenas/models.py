from django.db import models


class Sickbeard(models.Model):
    """
    Django model describing every tunable setting for sickbeard
    """

    enable = models.BooleanField(default=False)
