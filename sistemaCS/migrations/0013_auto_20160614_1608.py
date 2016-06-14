# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('sistemaCS', '0012_imgadopt'),
    ]

    operations = [
        migrations.AlterField(
            model_name='imgnominacion',
            name='idnom',
            field=models.ForeignKey(to='sistemaCS.NominacionAdopt'),
        ),
    ]
