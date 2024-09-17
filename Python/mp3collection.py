class MP3Track():

   def __init__(self, title, duration, artists):
      self.title = title
      self.duration = duration
      self.artists = artists

   def __str__(self):
      return "Title: {}\nBy: {}\nDuration: {}".format(self.title, ", ".join(self.artists), self.duration)

class MP3Collection():

   def __init__(self):
      self.d = {}

   def add(self, other):
      self.d[other.title] = other

   def remove(self, title):
      if title in self.d:
         del self.d[title]

   def lookup(self, title):
      if title in self.d:
         return self.d[title]
      else:
         return None

   def __add__(self, other):
        c = MP3Collection()
        for mp3 in self.d.values():
            c.add(MP3Track(mp3.title, mp3.duration, mp3.artists[:]))
        for mp3 in other.d.values():
            c.add(MP3Track(mp3.title, mp3.duration, mp3.artists[:]))
        return c