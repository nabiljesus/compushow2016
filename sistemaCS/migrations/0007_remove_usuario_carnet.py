# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('sistemaCS', '0006_usuario_name'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='usuario',
            name='carnet',
        ),
    ]
