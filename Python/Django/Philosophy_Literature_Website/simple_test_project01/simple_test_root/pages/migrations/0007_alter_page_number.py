# Generated by Django 3.2.12 on 2024-04-18 21:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pages', '0006_auto_20240407_0004'),
    ]

    operations = [
        migrations.AlterField(
            model_name='page',
            name='number',
            field=models.IntegerField(default=8, verbose_name='Magic Number'),
        ),
    ]
