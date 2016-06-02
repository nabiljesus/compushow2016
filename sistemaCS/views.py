from django.shortcuts import get_object_or_404,render

# Create your views here.
from django.http import HttpResponse
from sistemaCS.models import Question
from django.contrib import auth
from django.http import HttpResponseRedirect, HttpResponse
from models import *
from django.contrib.auth.models import User
from django.views.decorators.csrf import ensure_csrf_cookie
'''def index(request):
    latest_question_list = Question.objects.order_by('-pub_date')[:5]
    output = ', '.join([p.question_text for p in latest_question_list])
    return HttpResponse(output)
'''

'''def index(request):
    latest_question_list = Question.objects.order_by('-pub_date')[:5]
    template = loader.get_template('sistemaCS/index.html')
    context = RequestContext(request, {
        'latest_question_list': latest_question_list,
    })
    return HttpResponse(template.render(context))'''

def index(request):
    context = {}
    return render(request, 'sistemaCS/index.html', context)

def detail(request, question_id):
    return HttpResponse("You're looking at question %s." % question_id)

def results(request, question_id):
    response = "You're looking at the results of question %s."
    return HttpResponse(response % question_id)

def vote(request, question_id):
    return HttpResponse("You're voting on question %s." % question_id)

def detail(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    return render(request, 'sistemaCS/detail.html', {'question': question})


def logout_view(request):
  auth.logout(request)
  # Redirect to a success page.
  return HttpResponseRedirect('/sistemaCS')


def login_view(request):
  context={}
  if request.user.is_authenticated():
    return render(request, 'sistemaCS/index.html', context)

  print(request.POST)
  username = request.POST.get('username', '')
  password = request.POST.get('password', '')
  itPassed = False  
  context  = {'wrongData' : False}

  if check_ldap(username,password,True):
    itPassed = True
  else:
    itPassed = check_ldap(username,password,False)
  if not itPassed:
    context['wrongData'] = True
    return render(request, 'sistemaCS/index.html', context)
  else:
    context['wrongData'] = False

  myUser = Usuario.objects.filter(uid=username).first()
  print(myUser.name)
  print(type(myUser))
  user = auth.authenticate(username=username, password='')

  if user is not None and user.is_active:
      # Correct password, and the user is marked "active"
      auth.login(request, user)
      # Redirect to a success page.
  else:
      print(myUser)
      user = User.objects.create_user(username=username, password='')
      user.save()
      auth.authenticate(username=username, password=password)

      # Show an error page
  request.session['name']=myUser.name
  return render(request, 'sistemaCS/index.html', context)


def check_ldap(username,password,isLDC):
    import ldap
     
    if isLDC:
        print("Ldap LDC")
        ldap_server="ldap.ldc.usb.ve"
        # the following is the user_dn format provided by the ldap server
        user_dn = "uid="+username+",ou=People,dc=ldc,dc=usb,dc=ve"
        # adjust this to your base dn for searching
        base_dn = "dc=ldc,dc=usb,dc=ve"
    else:
        print("Ldap USB")
        ldap_server="ldap.usb.ve"
        # the following is the user_dn format provided by the ldap server
        user_dn = "uid="+username+",ou=People,dc=usb,dc=ve"
        # adjust this to your base dn for searching
        base_dn = "dc=usb,dc=ve"
    connect = ldap.open(ldap_server)
    search_filter = "uid="+username
    try:
        print(ldap_server)
        print(user_dn)
        print(base_dn)
        #if authentication successful, get the full user data
        connect.bind_s(user_dn,password)
        result = connect.search_s(base_dn,ldap.SCOPE_SUBTREE,search_filter)
        # return all user data results
        connect.unbind_s()
        print('eisito')
        return True
    except ldap.LDAPError:
        connect.unbind_s()
        print('fallo')
        return False

@ensure_csrf_cookie
def myCategory(request):
    print('AAAAAAAAAAAAAAAA')
    print(request.POST)
    context = {'pageid': str(request.POST.get('id'))}
    print(context)
    return render(request, 'sistemaCS/myCategory.html', context)