# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('sistemaCS', '0010_auto_20160610_0324'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='voto',
            name='idnom',
        ),
        migrations.AddField(
            model_name='voto',
            name='unom',
            field=models.ForeignKey(related_name='votado', default='', to='sistemaCS.Usuario'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='voto',
            name='uid',
            field=models.ForeignKey(related_name='votante', to='sistemaCS.Usuario'),
        ),
    ]
