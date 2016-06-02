from django.conf.urls import patterns, url

from sistemaCS import views

urlpatterns = patterns('',
    url(r'^$', views.index, name='index'),
    url(r'logout', views.logout_view, name='logout'),
    url(r'login_view', views.login_view, name='login'),
    url(r'nominate_view', views.nominate_view, name='nominate_view'),
    url(r'myCategory', views.myCategory, name='category'),
    url(r'myCarousel', views.myCarousel, name='carousel'),
    # ex: /polls/5/
    url(r'^(?P<question_id>\d+)/$', views.detail, name='detail'),
    # ex: /polls/5/results/
    url(r'^(?P<question_id>\d+)/results/$', views.results, name='results'),
    # ex: /polls/5/vote/
    url(r'^(?P<question_id>\d+)/vote/$', views.vote, name='vote'),
    url(r'^get_users/', views.get_users, name='get_users'),
)