# TODO
from cs50 import get_int
x = False
n = 0
while n < 1 or n > 8:
    n = get_int("Height:")
I = -1
S = n - 1
sen = ""
for i in range(n):
    while S > i:
        sen = sen + " "
        S = S - 1
    S = n - 1
    while I < i :
        sen = sen + "#"
        I = I + 1
    print(sen)
    I = -1
    sen = ""