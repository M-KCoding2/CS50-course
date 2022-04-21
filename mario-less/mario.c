#include <stdio.h>
#include <cs50.h>
int main(void)
{
    int n = 0;
    while (n < 1 || n > 8) // Repeatedly asks user the height until a value between 1 and 8 inclusive is given
    {
        n = get_int("Height: ");
    }
    int I = -1;
    int S = n - 1;
    for (int i = 0; i < n; i++) // iterates until i exceeds n which is equal to the height
    {
        while (S > i) // prints spaces so that on iteration i, it prints out i-1 amount of spaces--
        {
            // --so that the triangle will be right aligned
            printf(" ");
            S = S - 1;
        }
        S = n - 1;
        while (I < i)  //prints blocks i number of times then after it is a newline--
        {
            // --prints out next level of blocks until it reaches the value of height
            printf("#");
            I = I + 1;
        }
        printf("\n"); //makes new line for the next blocks
        I = -1;
    }
}
