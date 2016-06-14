# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('sistemaCS', '0011_auto_20160610_0421'),
    ]

    operations = [
        migrations.CreateModel(
            name='ImgAdopt',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('img', models.CharField(max_length=200)),
                ('idcat', models.ForeignKey(to='sistemaCS.Categoria')),
                ('idnom', models.ForeignKey(to='sistemaCS.NominacionAdopt')),
            ],
        ),
    ]
