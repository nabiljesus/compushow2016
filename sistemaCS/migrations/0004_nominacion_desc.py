# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('sistemaCS', '0003_auto_20160601_0649'),
    ]

    operations = [
        migrations.AddField(
            model_name='nominacion',
            name='desc',
            field=models.CharField(default='', max_length=200),
            preserve_default=False,
        ),
    ]
