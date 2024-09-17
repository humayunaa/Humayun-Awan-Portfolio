# /pages/urls.py
from django.urls import path
from . import views

urlpatterns = [
    path("weight_loss_light/", views.weight_loss_light, name="weight_loss_light"),
    path("weight_loss_heavy/", views.weight_loss_heavy, name="weight_loss_heavy"),
    path("weight_maintain_light/", views.weight_maintain_light, name="weight_maintain_light"),
    path("weight_maintain_heavy/", views.weight_maintain_heavy, name="weight_maintain_heavy"),
    path("weight_gain_light/", views.weight_gain_light, name="weight_gain_light"),
    path("weight_gain_heavy/", views.weight_gain_heavy, name="weight_gain_heavy"),
    path('user_input/', views.get_user_input, name='user_input'),
    path('contact/', views.contact, name='contact'),
    path("<str:num1>/<str:num2>/<str:num3>", views.magic_page, name="magic_page"),
    path('', views.index, name='index'),
]