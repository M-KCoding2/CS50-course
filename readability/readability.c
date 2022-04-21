#include <cs50.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <math.h>

int count_letters(string text);
int count_words(string text);
int count_sentences(string text);
int main(void)
{
    string text = get_string("Text: "); //gets text from user
    int letters = count_letters(text);
    int words = count_words(text);
    int sentences = count_sentences(text);
    float L = (letters / (float)words) * 100; // the average number of letters per 100 words.
    float S = (sentences / (float)words) * 100; // the average number of sentences per 100 words
    int index = round(0.0588 * L - 0.296 * S - 15.8); //Calculates readability index
    if (index <= 1)
    {
        printf("Before Grade 1\n");
    }
    else if (index >= 16)
    {
        printf("Grade 16+\n");
    }
    else
    {
        printf("Grade %i\n", index);
    }
}

int count_letters(string text) //counts how many letters
{
    int wordlength = strlen(text);
    int l = 0;
    for (int I = 0; I < wordlength; I++)
    {
        if (isupper(text[I]) || islower(text[I]))
        {
            l = l + 1;
        }
    }
    return l;
}

int count_words(string text) //counts how many words by counting how mant=y spaces there are
{
    int wordlength = strlen(text);
    int w = 1;
    for (int i = 0; i < wordlength; i++)
    {
        if (isspace(text[i]))
        {
            w = w + 1;
        }
    }
    return w;
}

int count_sentences(string text) //counts the amount of sentences by counting !,.,?
{
    int wordlength = strlen(text);
    int s = 0;
    for (int i = 0; i < wordlength; i++)
    {
        if (text[i] == '!' || text[i] == '.' || text[i] == '?')
        {
            s = s + 1;
        }
    }
    return s;
}