from django.shortcuts import get_object_or_404,render,render_to_response

# Create your views here.
from django.http import HttpResponse
from sistemaCS.models import Question
from django.template import RequestContext
from django.contrib import auth
from django.http import HttpResponseRedirect, HttpResponse
from models import *
from django.contrib.auth.models import User
from django.views.decorators.csrf import ensure_csrf_cookie


from operator import itemgetter
import ldap
import random
import json
import unicodedata

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
    if not request.session.get('hasVoted'):
      request.session['hasVoted']=0
    else:
      request.session['hasVoted']=request.session['hasVoted']-1
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
  request.session['category']='0'
  request.session['fromNominate']=False
  context={}
  if request.user.is_authenticated():
    return render(request, 'sistemaCS/index.html', context)


  print(request.POST)
  username = request.POST.get('username', '')
  password = request.POST.get('password', '')
  itPassed = False  
  context  = {'wrongData' : False}

  context['noComputista']=False
  myUser = Usuario.objects.filter(uid=username)
  if not myUser:
    context['noComputista']=True
    return render(request, 'sistemaCS/index.html', context)

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
  request.session['uid']=myUser.uid
  return render(request, 'sistemaCS/index.html', context)


def check_ldap(username,password,isLDC):
     
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
    print('=====CATEGORY========')
    print(request.POST)
    catId= str(int(str(request.POST.get('id')))-1)
    context = CATDATA[catId]
    context['pageid'] = catId
    request.session['category']=catId
    if str(request.POST.get('addVote'))=='true':
      addNom(request.POST.get('nuid'),request.session['uid'],catId)

    if 'uid' not in request.session:
      print('yup, fucked up.')
      return HttpResponseRedirect('/logout')
    else:
      print('not fucked')
      print(request.session['uid'])
      mListaNom=get_nom_list(int(catId),request.session['uid'])
      ListaNom = sorted(mListaNom, key=itemgetter('nName')) 
      context['listaNom'] = ListaNom
      if request.session.get('hasVoted'):
        if request.session['hasVoted'] > 0:
          context['hasVoted'] = True
        request.session['hasVoted'] = 0
      else:
        context['hasVoted'] = False
      context['nomsCount']  = str(len(ListaNom))
      context['isSingular']  = 1==len(ListaNom)
      print(context)
      return render(request, 'sistemaCS/myCategory.html', context)

def addNom(nuid,uid,catId,mdesc=""):
  print('Addingo voto ------')
  print(nuid)
  print(uid)
  print(catId)
  Ccat=Categoria.objects.filter(id=catId).first()
  Uunom=Usuario.objects.filter(uid=nuid).first()
  Uuid=Usuario.objects.filter(uid=uid).first()
  mdesc=unicodedata.normalize('NFD', mdesc).encode('ascii', 'ignore')
  noms=Nominacion(idcat=Ccat, unom=Uunom, uid=Uuid, desc=mdesc)
  noms.save()
  print('SE SUPONE....')

def get_nom_list(idCat,uid):
  oListaNom = Nominacion.objects.filter(idcat=idCat)
  ListaNom = {}
  for myNomi in oListaNom:
    elNomi = myNomi.unom.name
    if not elNomi in ListaNom.keys():
      dNomi = {}
      dNomi['nId'] = [str(myNomi.id)]
      dNomi['nName'] = (str(elNomi))
      dNomi['nUid'] = repr(str(myNomi.unom))
      dNomi['nRName'] = repr(str(elNomi))
      dNomi['nDesc'] = [str(myNomi.desc)]
      dNomi['nHas'] = myNomi.uid.uid == uid
      oListaNom = Nominacion.objects.filter(idcat=idCat)
      ListaNom[elNomi]=dNomi
    else:
      ListaNom[elNomi]['nId'] += [str(myNomi.id)]
      ListaNom[elNomi]['nDesc'] += [str(myNomi.desc)]
      ListaNom[elNomi]['nHas'] = ListaNom[elNomi]['nHas'] or (myNomi.uid.uid == uid)


  myList = []
  for key in ListaNom.keys():
    tempDic = ListaNom[key]
    aux=filter(lambda w: w!="", tempDic['nDesc'])
    if aux:
      tempDic['nDesc']=random.choice(aux)
    else:
      tempDic['nDesc']=""
    tempDic['nImaList']=[]
    for cId in tempDic['nId']:
      omisImagenes=ImgNominacion.objects.filter(idnom=cId)
      for img in omisImagenes:
        aux="catImgs/"+myNomi.idcat.nombre+"/"+str(img.img)
        tempDic['nImaList']+=[str(aux)]
    tempDic['nId']=tempDic['nId'][0]
    if tempDic['nImaList']:
      tempDic['nFront']=random.choice(tempDic['nImaList'])
    else:
      tempDic['nImaList']=['img/noimg.png']
      tempDic['nFront']='img/none.gif'
    if tempDic['nHas']:
      tempDic['nHas']='true'
    else:
      tempDic['nHas']='false'
    myList+=[tempDic]
  return myList

def hasVoted(myuid,myunom,midCat):
  oListaNom = Nominacion.objects.filter(idcat=midCat).filter(unom=myunom).filter(uid=myuid)
  hasVoted = False
  if oListaNom.first():  #Si no es vacia
    hasVoted = True
  return hasVoted

@ensure_csrf_cookie
def myCarousel(request):
    print('=====CAROUSEL========')
    print(request.POST)
    carId= str(request.POST.get('carId'))
    context = {'carId' : carId,
               'carNName' : str(request.POST.get('carNName')),
               'imgList'  : request.POST.getlist('imgList[]'),
               'Voted' : str(request.POST.get('Voted'))=='true',
               'pId'   : str(int(request.POST.get('pId'))+1),
               'nuid'   : str(request.POST.get('nuid'))}
    print(context)
    return render(request, 'sistemaCS/myCarousel.html', context)


def get_users(request):
    print('did it work?')
    q = request.GET.get('term', '')
    q=q.split()
    users = Usuario.objects.filter(name__icontains = q[0] )
    for sq in q[1:]:
      users = users.filter(name__icontains = sq )
    results = []
    for user in users:
        user_json = {}
        user_json['id'] = user.uid
        user_json['label'] = user.name
        user_json['value'] = user.uid
        results.append(user_json)
    data = json.dumps(results)
    print(data)

    mimetype = 'application/json'
    return HttpResponse(data, mimetype)

def nominate_view(request):
    print('=========NOMINATE==========')
    mycat=request.session['category']
    try:
      addNom(request.POST.get('username'),request.session['uid'],mycat,request.POST.get('desc'))
    except:
      request.session['hasVoted']=2
    mycat=str(int(mycat)+1)
    request.session['category']=mycat
    print(request.POST)
    print(request.GET)
    context = {}
    return HttpResponseRedirect('/sistemaCS/#t'+mycat)

#######Para imagenes
def list(request):
    # Handle file upload
    if request.method == 'POST':
        form = DocumentForm(request.POST, request.FILES)
        if form.is_valid():
            newdoc = Document(docfile = request.FILES['docfile'])
            newdoc.save()

            # Redirect to the document list after POST
            return HttpResponseRedirect(reverse('sistemaCS.views.list'))
    else:
        form = DocumentForm() # A empty, unbound form

    # Load documents for the list page
    documents = Document.objects.all()

    # Render list page with the documents and the form
    return render_to_response(
        'sistemaCS/list.html',
        {'documents': documents, 'form': form},
        context_instance=RequestContext(request)
    )