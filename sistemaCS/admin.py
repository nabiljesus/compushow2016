from django.contrib import admin
from sistemaCS.models import *

# Register your models here.
class ChoiceInline(admin.StackedInline):
    model = Choice
    extra = 3


class QuestionAdmin(admin.ModelAdmin):
    fieldsets = [
        (None,               {'fields': ['question_text']}),
        ('Date information', {'fields': ['pub_date'], 'classes': ['collapse']}),
    ]
    inlines = [ChoiceInline]

admin.site.register(Question, QuestionAdmin)
admin.site.register(Choice)
admin.site.register(Categoria)
admin.site.register(Usuario)
admin.site.register(Nominacion)
admin.site.register(ImgNominacion)
admin.site.register(ImgAdopt)
admin.site.register(Voto)
admin.site.register(VotoAdopt)
admin.site.register(NominacionAdopt)