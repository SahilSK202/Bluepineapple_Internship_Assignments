/*Program to find possible solutions for a crossword puzzle*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <assert.h>

#define FILENAME "small_dictionary.txt" // name of the txt file containing dictionary words
#define MAXWORDLENGTH 50                // max length of word
#define MAXDICTSIZE 600                 // no of words

char dictionary[MAXDICTSIZE][MAXWORDLENGTH];
int dictionary_size = 0;
int words_found = 0;

typedef struct Tree
{
    char word[50];
    struct Tree *left, *right;
} tree;

// function to load words from txt file to array
void load_dictionary()
{

    FILE *fptr = NULL;
    int i = 0;
    fptr = fopen(FILENAME, "r");
    while (fgets(dictionary[i], MAXWORDLENGTH, fptr))
    {
        dictionary[i][strlen(dictionary[i]) - 1] = '\0';
        i++;
    }
    dictionary_size = i;
    fclose(fptr);
}

// function to insert nodes into Tree
tree *insert(tree *root, char *question)
{
    if (root == NULL)
    {
        root = (tree *)malloc(sizeof(tree));
        strcpy(root->word, question);
        root->left = NULL;
        root->right = NULL;
    }
    else
    {
        int cmp = strcmp(root->word, question);

        if (cmp != 0)
        {
            if (cmp > 0)
                root->left = insert(root->left, question);
            else
                root->right = insert(root->right, question);
        }
        else
            printf("Word present already!\n");
    }
    return root;
}

// function to find the root of the tree with 1st char as required
tree *find_root(tree *root, char *question)
{
    if (root)
    {
        int cmp = (root->word[0] - tolower(question[0]));
        if (cmp == 0)
            return root;
        else if (cmp > 0)
            return find_root(root->left, question);
        else
            return find_root(root->right, question);
    }
}

// function to compare of words of tree with desired word
void compare_words(char *treeWord, char *question)
{
    int i = 0;
    while (treeWord[i] != '\0')
    {
        if (question[i] == '?' || treeWord[i] == tolower(question[i]))
        {
            i++;
            continue;
        }
        else
            break;
    }
    if (i == strlen(question))
    {
        printf("%d.%s\n", (words_found++) + 1, treeWord);
    }
}

// function to find matching words to the problem
void find_words(tree *root, char *question)
{
    if (root)
    {
        find_words(root->left, question);
        if (strlen(root->word) == strlen(question))
            (compare_words(root->word, question));

        find_words(root->right, question);
    }
}

//  Driver Code
int main()
{
    int i = 0;
    char question[50];
    tree *root = NULL, *temp = (tree *)malloc(sizeof(tree));

    printf("Loading dictionary...");
    load_dictionary();

    for (i = 0; i < dictionary_size; i++)
        root = insert(root, dictionary[i]);

    while (1)
    {
        printf("\ne.g. If you want to search 4 letter word starting with s then input : s??? \nEnter word to search :  ");
        fflush(stdin);
        scanf("%s", question);

        if (strcmp(question, "q") == 0)
        {
            break;
        }
        words_found = 0;
        temp = (question[0] != '?') ? find_root(root, question) : root;
        find_words(temp, question);
        if (words_found == 0)
            printf("Word not found!");
        printf("\n\nEnter q to quit.");
    }
    return 0;
}