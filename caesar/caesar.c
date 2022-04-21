#include <stdio.h>
#include <cs50.h>
#include <ctype.h>
#include <string.h>
#include <stdlib.h>
char rotate(char c, int n);
int main(int argc, string argv[])
{
    if (argc != 2) //Makes sure there are only 2 arguments
    {
        printf("Usage: ./caesar key\n");
        return 1;
    }
    string x = argv[1];
    for (int i = 0; i < strlen(x); i++) //loops through key to make sure it is only digits
    {
        if (!isdigit(x[i]))
        {
            printf("Usage: ./caesar key\n");
            return 1;
        }
    }

    int key = atoi(argv[1]); //turns key into an integer
    string plaintx = get_string("plaintext: ");

    printf("ciphertext: ");
    for (int i = 0; i < strlen(plaintx); i++) //Loops through and calls function to change plain to cipher
    {
        char cv = rotate(plaintx[i], key);
        printf("%c", cv);
    }
    printf("\n");
}
char rotate(char c, int n) //Changes the letter to cipher version
{
    if (isalpha(c))
    {
        if (isupper(c))
        {
            char ascii = 'A'; //plaintext is converted to ciphertext
            char ct = (c - ascii + n) % 26 + ascii;
            return ct;
        }
        else if (islower(c))
        {
            char ascii = 'a';
            char ct = (c - ascii + n) % 26 + ascii;
            return ct;
        }
    }
    return c;
}