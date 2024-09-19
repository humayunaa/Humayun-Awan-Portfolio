from django.db import models

class Author(models.Model):
    author_name = models.CharField(max_length=200)
    author_summary = models.TextField()
    pic = models.ImageField(default = 'the_thinker.png', blank = True)

    def __str__(self):
        return self.author_name

class Book(models.Model):
    author = models.ForeignKey(Author, on_delete=models.CASCADE)
    book_title = models.CharField(max_length=200)
    book_summary = models.TextField()

    def __str__(self):
        return self.book_title
