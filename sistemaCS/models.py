from django.db import models
import datetime

from django.utils import timezone
# Create your models here.

#From Tutorial
class Question(models.Model):
    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField('date published')

    def __str__(self):              # __unicode__ on Python 2
        return self.question_text

    def was_published_recently(self):
        return self.pub_date >= timezone.now() - datetime.timedelta(days=1)

class Choice(models.Model):
    question = models.ForeignKey(Question)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)
    
    def __str__(self):              # __unicode__ on Python 2
        return self.choice_text

class Categoria(models.Model):
    nombre=models.CharField(max_length=200)
    def __str__(self):              # __unicode__ on Python 2
        return self.nombre

class Usuario(models.Model):
    uid=models.CharField(max_length=200,primary_key=True)
    password=models.CharField(max_length=200)
    carnet=models.CharField(max_length=200)
    def __str__(self):              # __unicode__ on Python 2
        return self.uid

class Nominacion(models.Model):
    class Meta:
        unique_together = (('idcat', 'unom','uid'),)
    idcat=models.ForeignKey(Categoria, on_delete=models.CASCADE)
    unom=models.ForeignKey(Usuario, on_delete=models.CASCADE, related_name="nominado")
    uid=models.ForeignKey(Usuario, on_delete=models.CASCADE, related_name="nominante")
    def __str__(self):              # __unicode__ on Python 2
        return repr(self.uid)+"=>"+repr(self.unom)+"( "+repr(self.idcat)+" )"

class ImgNominacion(models.Model):
    idcat=models.ForeignKey(Categoria, on_delete=models.CASCADE)
    idnom=models.ForeignKey(Nominacion, on_delete=models.CASCADE)
    img=models.CharField(max_length=200)
    def __str__(self):              # __unicode__ on Python 2
        return repr(self.img)

class Voto(models.Model):
    class Meta:
        unique_together = (('idcat', 'uid'),)
    idcat=models.ForeignKey(Categoria, on_delete=models.CASCADE)
    idnom=models.ForeignKey(Nominacion, on_delete=models.CASCADE)
    uid=models.ForeignKey(Usuario, on_delete=models.CASCADE)
    def __str__(self):              # __unicode__ on Python 2
        return repr(self.uid)+"=>"+repr(self.idnom)+"( "+repr(self.idcat)+" )"