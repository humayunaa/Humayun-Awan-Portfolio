# Data Information
I will source my film reviews from a movie review website/app called Letterboxd.\
Letterboxd users rate films on a scale of 1-5 stars. In 0.5 increments\
(0.5*, 1*, 1.5*, 2*, 2.5*, 3*, 3.5*, 4*, 4.5*, 5*)\
I will include some of my own reviews along with some reviews made by other people
- Test set 1 = Easy and should cause no problems. Predict Correctly.
- Test set 2 = Should try to "break" our model. Predict Incorrectly.
- Each test set (6 reviews = 3 positive & 3 negative)


## Easy Test Sets: Why I picked these film reviews
**Positive reviews**\
For my three positive film reviews which should have no problem predicting as positive, i chose reviews for the film "Dune: Part Two".\
Dune: Part Two averages a 4.4 star rating, with the majortity of people rating it a 5* film\
This showed me that I should easily be able to find positive reviews for the film, due to it being so highly rated

**Negative Reviews**\
For my three negative film reviews which should have no problem predicting as negative, I chose reviews for the film "Megalopolis"\
Megalopolis averages a 2.4 star rating, with the majority of people rating it a 2* film\
This showed me that I should easily be able to find negative reviews for the film, due to it being so poorly rated

### Positive Dune Reviews:
1) Looks like a positive review from reading. Contains positive wor "Incredible" and somewhat positive word "correct". Does not seem to contain any negative words. Should predict as positive.
2) A positive review. Contains positive word: "Truly". Has a negative word used positively: "don't". However i feel that "truly" will overpower "don't" in predcitions.
3) Clearly a positive review. Line saying: "This is my favourite movie". Positive word "favourite" and somewhat positive word "paradise". Does not seem to contain any negative words. Should predict as positive.

### Negative Megalopolis Reviews
1) Negative review. Contains positive and negative elements but I feel the negative definitely outweighs the positve, or is stronger. Negative words: "doesn't", "avoid", "issues", "difficult". Positive words: "glad", "brilliant", "nice".
2) Clearly negative. Contains highly negative word: "worst", with the review simply being: "Worst movie i have ever seen". Should have no problem predicting negatively
3) Clearly negative. Contains only negative words: "nonsensical", "absurd", "unpleasant", "annoying". Should again have no issue predicting negatively


## Hard Test Sets: Why I picked these film reviews
**Positive**\
For my three positive reviews which should predict incorrectly, I chose the film "Layer Cake"\
Layer Cake averages a 3.5 star rating, with the majority of people rating it between 2.5-3.5 stars i.e. averagely\
This means that I should hopefuly be able to find some positive reviews which contain negative elements in order to confuse my model and predict negatively, as this film is not as highly rated as Dune: Part Two

**Negative**\
For my three negative reviews which should predict incorrectly, I chose the film "Jack and Jill"\
Jack and Jill averages a 1.4 star rating, with the majority of people rating it a 0.5 star film\
As this is a comedy movie I hope to find witty, or confusing reviews of the film which while negative should confuse my model and predict positive.

### Positive Layer Cake reviews
1) Positive review which contains negative and positive words. Positive: "decent", Negative: "confused". Confused appears before engaged and might have a greater weight, leading the model to predict this as a negative review.
2) This review is praising the film, saying it looks more expensive than it is, meaning it exceeds expectations. The review does not contain any true positive or negative words. However I believe the word "budget" may be used negatively in the context of film reviews, leading to a negative prediction. More often than not I would say that when people mention budget in a film review they are using it to say how the film looks bad on such a high budget etc.
3) Contains positive and negative words, however I feel the negative word may outweigh the positve. Negative word: "ugly", Positive word: "cool".

### Negative Jack and Jill reviews
1) Contains no real positive or negative words, while it clearly represents a negative review. The word "Hollywood" may represent a positive word as in reviews users may typically use Hollywood to highlight a films professional quality
2) Contains positive and negative words. However the positive words feels as though it outweighs the negative word. Positive word: "enjoyed", Negative word: "none"
3) Negative review which features positive words: "thank", "lucky". Does not contain any clear negative words while being a negative review. The term "unconscious" means this is a bad review, but I don't believe it will have a great weight even if its said to be a negative word.