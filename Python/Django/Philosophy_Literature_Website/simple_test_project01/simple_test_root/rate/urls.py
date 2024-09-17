from django.urls import path
from . import views

urlpatterns = [
    path('', views.rate_view, name='rate'),
    path('success/', views.success, name="success")
]