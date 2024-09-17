from django.shortcuts import render, redirect
from .contact import ContactForm

from django.http import HttpResponseRedirect
from django.core.mail import send_mail, get_connection

from django.urls import reverse_lazy
from django.views.generic import CreateView, DetailView, UpdateView, DeleteView, ListView
from .models import Author, Book

#def index(request):
#    return HttpResponse("Simple Test Site")

from django.views.generic import TemplateView

class IndexView(TemplateView):
    template_name = 'pages/page.html'
    
def index(request):
     return render(request, 'pages/home.html')

# Author Views
class AuthorCreate(CreateView):
    model = Author
    fields = ['author_name', 'author_summary']
    template_name = 'pages/author_create_form.html'
    success_url = reverse_lazy('author_list')

class AuthorDetail(DetailView):
    model = Author
    template_name = 'pages/author_detail_form.html'

class AuthorUpdate(UpdateView):
    model = Author
    fields = ['author_name', 'author_summary']
    template_name = 'pages/author_update_form.html'
    success_url = reverse_lazy('author_list')

class AuthorDelete(DeleteView):
    model = Author
    template_name = 'pages/author_delete_form.html'
    success_url = reverse_lazy('author_list')

# Book Views
class BookCreate(CreateView):
    model = Book
    fields = ['book_title', 'author', 'book_summary']
    template_name = 'pages/book_create_form.html'
    success_url = reverse_lazy('book_list')

class BookDetail(DetailView):
    model = Book
    template_name = 'pages/book_detail_form.html'

class BookUpdate(UpdateView):
    model = Book
    fields = ['book_title', 'author', 'book_summary']
    template_name = 'pages/book_update_form.html'
    success_url = reverse_lazy('book_list')

class BookDelete(DeleteView):
    model = Book
    template_name = 'pages/book_delete_form.html'
    success_url = reverse_lazy('book_list')

class AuthorList(ListView):
    model = Author
    template_name = 'pages/author_list.html'

class BookList(ListView):
    model = Book
    template_name = 'pages/book_list.html'

def contact(request):
    submitted = False
    if request.method == 'POST':
        form = ContactForm(request.POST)
        if form.is_valid():
            cd = form.cleaned_data
            con = get_connection('django.core.mail.backends.console.EmailBackend')
            send_mail(
                cd['subject'],
                cd['message'],
                cd.get('email', 'noreply@example.com'),  # Set a default from-email if none provided
                ['student@example.com'],  # The recipient email should be updated
                connection=con
            )
            return HttpResponseRedirect('/contact?submitted=True')
    else:
        form = ContactForm()
        if 'submitted' in request.GET:
            submitted = True

    context = {
        'form': form,
        'submitted': submitted
    }
    return render(request, 'pages/contact.html', context)
