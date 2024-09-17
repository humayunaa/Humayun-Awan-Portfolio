from django.shortcuts import render
#from django.http import HttpResponse
from .models import Page
from .forms import UserForm
from .forms import ContactForm
from django.shortcuts import redirect
import random

def index(request):
    pg = Page.objects.get(permalink='/')
    context = {
	'title': pg.title,
	'content': pg.bodytext
    }
    return render(request, 'base.html', context)
    
    #pg = Page.objects.get(permalink='/')
    #return HttpResponse(pg.bodytext)
    # Create your views here.

def weight_loss_light(request):
    pg = Page.objects.get(permalink='/weight_loss_light')
    context = {
	'title': pg.title,
	'content': pg.bodytext
    }
    return render(request, 'base.html', context)

def weight_loss_heavy(request):
    pg = Page.objects.get(permalink='/weight_loss_heavy')
    context = {
	'title': pg.title,
	'content': pg.bodytext
    }
    return render(request, 'base.html', context)

def weight_maintain_light(request):
    pg = Page.objects.get(permalink='/weight_maintain_light')
    context = {
	'title': pg.title,
	'content': pg.bodytext
    }
    return render(request, 'base.html', context)

def weight_maintain_heavy(request):
    pg = Page.objects.get(permalink='/weight_maintain_heavy')
    context = {
	'title': pg.title,
	'content': pg.bodytext
    }
    return render(request, 'base.html', context)

def weight_gain_light(request):
    pg = Page.objects.get(permalink='/weight_gain_light')
    context = {
	'title': pg.title,
	'content': pg.bodytext
    }
    return render(request, 'base.html', context)

def weight_gain_heavy(request):
    pg = Page.objects.get(permalink='/weight_gain_heavy')
    context = {
	'title': pg.title,
	'content': pg.bodytext,
    }
    return render(request, 'base.html', context)

def get_user_input(request):
    if request.method == 'POST':
        form = UserForm(request.POST)
        if form.is_valid():
            hours_available_per_week = form.cleaned_data['hours_available_per_week']
            goal = form.cleaned_data['goal']
            
            # Determine the suffix for the URL based on hours available per week
            intensity_suffix = 'light' if hours_available_per_week < 6 else 'heavy'

            # Adjust the goal formatting based on the updated value
            # This converts the goal to match the updated URL naming convention
            # "Weight Maintain" is now "weight_maintain"
            formatted_goal = goal.lower().replace(' ', '_')

            # Construct the URL name to match the updated naming convention
            url_name = f'{formatted_goal}_{intensity_suffix}'

            # Redirect to the dynamically constructed URL
            return redirect(url_name)
    else:
        form = UserForm()

    return render(request, 'user_input_form.html', {'form': form})

def contact(request):
    if request.method == 'POST':
        form = ContactForm(request.POST)
    else:
        form = ContactForm(request.POST)
    return render(request, 'contact.html', {'form': form})

def magic_page(request, num1, num2, num3):
    if num1.isnumeric() and num2.isnumeric() and num3.isnumeric():
        num = int(num1) + int(num2) + int(num3)
        result = f"Wow You gave 3 numbers. Do {num} pushups!"
        html = "magic_page_all_nums.html"
    elif num1.isnumeric() == False and num2.isnumeric() == False and num3.isnumeric() == False:
        squats = random.randint(1, 100)
        result = f"Wow you gave 3 strings. Do {squats} squats!"
        html = "magic_page_all_strings.html"
    else:
        pullups = random.randint(1, 20)
        result = f"Wow you gave a mixture of strings and integers. As punishment do {pullups} pullups!"
        html = "magic_page_mix.html"
    context = {
        "result" : result
    }
    return render(request, html, context)