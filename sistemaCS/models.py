# -*- coding: utf-8 -*-
from django.db import models
import datetime

from django.utils import timezone
# Create your models here.
### Para iamgenes
class Document(models.Model):
    docfile = models.FileField(upload_to='documents/%Y/%m/%d')

from django import forms

class DocumentForm(forms.Form):
    docfile = forms.FileField(
        label='Select a file',
        help_text='max. 42 megabytes'
    )
###
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
    name=models.CharField(max_length=200)
    password=models.CharField(max_length=200)
    def __str__(self):              # __unicode__ on Python 2
        return self.uid

class Nominacion(models.Model):
    class Meta:
        unique_together = (('idcat', 'unom','uid'),)
    idcat=models.ForeignKey(Categoria, on_delete=models.CASCADE)
    unom=models.ForeignKey(Usuario, on_delete=models.CASCADE, related_name="nominado")
    uid=models.ForeignKey(Usuario, on_delete=models.CASCADE, related_name="nominante")
    desc=models.CharField(max_length=200)
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


CATDATA = {
  "1" : {"catName": "adoptado", "catID": "1", "catDesc": "No es computista, pero vive en la sala, seguro se sabe el pensum y tiene hasta la clave del internet del LDC." },
  "2" : {"catName": "bully", "catID": "2", "catDesc": "Cuando de hacer bully se trata no perdona ni a los amigos." },
  "3" : {"catName": "butt", "catID": "3", "catDesc": "Con ese bootie fácil, fácil, puede ser Kardashian." },
  "4" : {"catName": "cartoon", "catID": "4", "catDesc": "El amigo que tiene un doble en alguna comiquita." },
  "5" : {"catName": "chancero", "catID": "5", "catDesc": "Manda a decir que si eres niña y lo nominas que agregues tu numero por si acaso." },
  "6" : {"catName": "comadre", "catID": "6", "catDesc": "Es literalmente la amiga de todos y todas." },
  "7" : {"catName": "compadre", "catID": "7", "catDesc": "Es literalmente el amigo de todos y todas." },
  "8" : {"catName": "cono", "catID": "8", "catDesc": "Ese que en una entrega, proyecto, o en la vida, no hace pero ni el intento." },
  "9" : {"catName": "cuaima", "catID": "9", "catDesc": "\"Tenemos 3 dias sin pelear, le reclamare eso que hizo hace 2años... \"" },
 "10" : {"catName": "cuchi", "catID": "10", "catDesc": "Solo le basta con poner ojitos de chachorro para triunfar en la vida." },
 "11" : {"catName": "falso", "catID": "11", "catDesc": "Made in China." },
 "12" : {"catName": "fitness", "catID": "12", "catDesc": "Keep calm and haz ejercicios, es su lema de vida." },
 "13" : {"catName": "gordito", "catID": "13", "catDesc": " Seguro lo has oido diciendo: \"Dame otra dona u otro brownie, porfa.\"" },
 "14" : {"catName": "lolas", "catID": "14", "catDesc": "Ni 38D-escripciones son suficientes." },
 "15" : {"catName": "love", "catID": "15", "catDesc": "Admitelo, hasta tú quieres ir una boda de ellos." },
 "16" : {"catName": "mami", "catID": "16", "catDesc": "Si eres mujer seguro has dicho 'hoy se ve como gorda." },
 "17" : {"catName": "master", "catID": "17", "catDesc": "Nomina a ese profe que sabes que se lo merece." },
 "18" : {"catName": "papi", "catID": "18", "catDesc": "El cuerpo, la cara, la actitud, en fin, el papi de la carrera." },
 "19" : {"catName": "pro", "catID": "19", "catDesc": "Todos conocemos a un computista que siempre revienta las materias o sus entregas valen oro, nomina al tuyo. " },
 "20" : {"catName": "productista", "catID": "20", "catDesc": "Tu sabes como son los productistas, bueno nosotros tenemos uno identico. #dinero #viajes #rumbas #carros #software #Sistemas" },
 "21" : {"catName": "team", "catID": "21", "catDesc": "La mejor agrupacion o equipo que tiene la carrera." },
 "22" : {"catName": "tukky", "catID": "22", "catDesc": "Identifica al unico Yonaikerson jose que no te va a robar⁠⁠⁠⁠." }
}


