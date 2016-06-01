# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('sistemaCS', '0002_categoria'),
    ]

    operations = [
        migrations.CreateModel(
            name='ImgNominacion',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('img', models.CharField(max_length=200)),
                ('idcat', models.ForeignKey(to='sistemaCS.Categoria')),
            ],
        ),
        migrations.CreateModel(
            name='Nominacion',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('idcat', models.ForeignKey(to='sistemaCS.Categoria')),
            ],
        ),
        migrations.CreateModel(
            name='Usuario',
            fields=[
                ('uid', models.CharField(max_length=200, serialize=False, primary_key=True)),
                ('password', models.CharField(max_length=200)),
                ('carnet', models.CharField(max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='Voto',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('idcat', models.ForeignKey(to='sistemaCS.Categoria')),
                ('idnom', models.ForeignKey(to='sistemaCS.Nominacion')),
                ('uid', models.ForeignKey(to='sistemaCS.Usuario')),
            ],
        ),
        migrations.AddField(
            model_name='nominacion',
            name='uid',
            field=models.ForeignKey(related_name='nominante', to='sistemaCS.Usuario'),
        ),
        migrations.AddField(
            model_name='nominacion',
            name='unom',
            field=models.ForeignKey(related_name='nominado', to='sistemaCS.Usuario'),
        ),
        migrations.AddField(
            model_name='imgnominacion',
            name='idnom',
            field=models.ForeignKey(to='sistemaCS.Nominacion'),
        ),
        migrations.AlterUniqueTogether(
            name='voto',
            unique_together=set([('idcat', 'uid')]),
        ),
        migrations.AlterUniqueTogether(
            name='nominacion',
            unique_together=set([('idcat', 'unom', 'uid')]),
        ),
    ]
