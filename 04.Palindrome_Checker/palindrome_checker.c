// C program to check if a string is palindrome or not

#include <stdio.h>
#include <string.h>
#include <stdbool.h>

// A function to check if a string str is palindrome
bool isPalindrome(char str[])
{

    int len = strlen(str);

    // Iterate over the range [0, N/2]
    for (int i = 0; i < len / 2; i++)
    {

        // If str[i] is not equal to the str[N-i-1]
        if (str[i] != str[len - i - 1])
        {
            return false;
        }
    }
    return true;
}

// Driver program to test above function
int main()
{
    char str[20];
    printf("Enter the String : ");
    scanf("%s", str);

    if (isPalindrome(str))
    {
        printf("%s is a palindrome\n", str);
    }
    else
    {
        printf("%s is not a palindrome\n", str);
    }

    return 0;
}