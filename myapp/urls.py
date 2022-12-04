from django.urls import path 
from myapp import views

urlpatterns = [
    path('', views.mysite, name='mysite'), 
]