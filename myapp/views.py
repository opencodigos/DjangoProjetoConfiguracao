from django.shortcuts import render

# Create your views here.
def mysite(request):
    return render(request, 'index.html')