# TODO
from cs50 import get_string
text = get_string("Text: ")

letters = 0
for i in range(len(text)):
    if text[i].isalpha():
        letters = letters + 1

words = 1
for i in range(len(text)):
    if text[i].isspace():
        words = words + 1

sentences = 0
for i in range(len(text)):
    if text[i] == '!' or text[i] == '.' or text[i] == '?':
        sentences = sentences + 1

L = (letters / words) * 100  # the average number of letters per 100 words.
S = (sentences / words) * 100  # the average number of sentences per 100 words

index = round(0.0588 * L - 0.296 * S - 15.8)

if index <= 1:
    print("Before Grade 1")
elif index >= 16:
    print("Grade 16+")
else:
    print("Grade "+str(index))