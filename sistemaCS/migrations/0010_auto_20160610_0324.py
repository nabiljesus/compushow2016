# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('sistemaCS', '0009_nominacionadopt'),
    ]

    operations = [
        migrations.CreateModel(
            name='VotoAdopt',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('namenom', models.CharField(max_length=200)),
                ('idcat', models.ForeignKey(to='sistemaCS.Categoria')),
                ('uid', models.ForeignKey(to='sistemaCS.Usuario')),
            ],
        ),
        migrations.AlterUniqueTogether(
            name='votoadopt',
            unique_together=set([('idcat', 'uid')]),
        ),
    ]
