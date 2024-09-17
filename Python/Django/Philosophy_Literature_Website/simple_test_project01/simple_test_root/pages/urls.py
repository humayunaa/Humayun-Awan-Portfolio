# simple_test_root/pages/urls.py
from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('contact/', views.contact, name='contact'),
    path('authors/', views.AuthorList.as_view(), name='author_list'),
    path('author/add/', views.AuthorCreate.as_view(), name='author_create'),
    path('author/<int:pk>/', views.AuthorDetail.as_view(), name='author_detail'),
    path('author/update/<int:pk>/', views.AuthorUpdate.as_view(), name='author_update'),
    path('author/delete/<int:pk>/', views.AuthorDelete.as_view(), name='author_delete'),
    path('books/', views.BookList.as_view(), name='book_list'),
    path('book/add/', views.BookCreate.as_view(), name='book_create'),
    path('book/<int:pk>/', views.BookDetail.as_view(), name='book_detail'),
    path('book/update/<int:pk>/', views.BookUpdate.as_view(), name='book_update'),
    path('book/delete/<int:pk>/', views.BookDelete.as_view(), name='book_delete'),
]
