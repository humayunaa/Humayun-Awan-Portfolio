from django.db import models

class Rate(models.Model):
    
    def __str__(self):
        return self.title