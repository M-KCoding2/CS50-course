# TODO
from cs50 import get_float

coins = 0
c = -1
while c < 0:  # Asks how mcuh change owed then into cents
    c = get_float("Change owed: ")
c = c * 100

while c >= 25:  # Calculate the number of quarters to give the customer
    c = c - 25
    coins = coins + 1

while c >= 10:  # Calculate the number of dimes to give the customer
    c = c - 10
    coins = coins + 1

while c >= 5:  # Calculate the number of nickels to give the customer
    c = c - 5
    coins = coins + 1

coins = coins + c  # sum coins
print(str(int(coins)))  # prints total number of coins needed
