# Generated by Django 4.1.9 on 2023-08-18 12:07

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("pdf_generator", "0001_initial"),
    ]

    operations = [
        migrations.AddField(
            model_name="report",
            name="temporary",
            field=models.BooleanField(default=False),
        ),
    ]