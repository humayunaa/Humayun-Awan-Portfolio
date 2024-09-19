from django import forms
from pages.models import Book

class RateForm(forms.Form):
    your_name = forms.CharField(max_length=100, label='Your name')
    email = forms.EmailField()

    # Dynamically fetching book titles from the Book model
    book = forms.ModelChoiceField(queryset=Book.objects.all(), label="Book", empty_label=None,
                                  to_field_name="book_title")

    rate = forms.FloatField(min_value=1, max_value=10, label="Rating 1-10")
    thoughts = forms.CharField(widget=forms.Textarea)
