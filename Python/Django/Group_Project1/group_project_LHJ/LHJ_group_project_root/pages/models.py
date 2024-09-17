from django.db import models

# Create your models here.
class Page(models.Model):
    title = models.CharField(max_length=60)
    permalink = models.CharField(max_length=50, unique=True)
    bodytext = models.TextField('Page Content', blank=True)

    def __str__(self):
        return self.title