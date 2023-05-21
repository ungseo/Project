from django.db import models
from django.contrib.auth.models import AbstractUser

class User(AbstractUser):
    image = models.ImageField(upload_to='profile_images', null=True, blank=True)


# class Userinfo(models.Model):
#     username = models.CharField(max_length=100)
#     profile_img = models.TextField()
