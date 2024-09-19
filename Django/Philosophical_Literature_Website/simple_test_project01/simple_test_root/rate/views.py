from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.core.mail import send_mail, get_connection
from .rate import RateForm
from django.shortcuts import redirect


def rate_view(request):
    submitted = False
    if request.method == 'POST':
        form = RateForm(request.POST)
        if form.is_valid():
            cd = form.cleaned_data
            con = get_connection('django.core.mail.backends.console.EmailBackend')

            send_mail(
                subject=f"Rating by {cd['your_name']}",
                message=f"Book: {cd['book']}\nRating: {cd['rate']}\nThoughts: {cd['thoughts']}",
                from_email=cd['email'],
                recipient_list=['humayun.awan2@mail.dcu.ie'],
                connection=con
            )
            return redirect('success')
    else:
        form = RateForm()
        if 'submitted' in request.GET:
            submitted = True

    context = {
        'form': form,
        'submitted': submitted
    }
    return render(request, 'rate/rating.html', context)

def success(request):
    return render(request, "rate/success.html")