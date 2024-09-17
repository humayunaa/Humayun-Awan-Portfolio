from django import forms

class UserForm(forms.Form):
    name = forms.CharField(label='Name', max_length=100)
    age = forms.IntegerField(label='Age', min_value=1)
    weight = forms.FloatField(label='Weight (kg)', min_value=1)
    height = forms.IntegerField(label='Height (cm)', min_value=1)
    occupation = forms.CharField(label='Occupation', max_length=100)
    hours_available_per_week = forms.IntegerField(label='Hours Available per Week', min_value=1)
    GOAL_CHOICES = [
        ('weight_gain', 'Weight Gain'),
        ('weight_loss', 'Weight Loss'),
        ('weight_maintain', 'Weight Maintain'),
    ]
    goal = forms.ChoiceField(label='Goal', choices=GOAL_CHOICES)

class ContactForm(forms.Form):
    email = forms.CharField(label='Email', max_length=100, required=False)
    phone_number = forms.IntegerField(label='Phone Number', min_value=1, required=False)
    query = forms.CharField(label='Query', widget=forms.Textarea(attrs={'rows': 5, 'cols': 40}), required=False)