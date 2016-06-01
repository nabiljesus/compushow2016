# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('sistemaCS', '0005_auto_20160601_1316'),
    ]

    operations = [
        migrations.AddField(
            model_name='usuario',
            name='name',
            field=models.CharField(max_length=200, default=''),
            preserve_default=False,
        ),
    ]
