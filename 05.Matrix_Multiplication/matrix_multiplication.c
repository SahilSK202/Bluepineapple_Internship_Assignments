#include <stdio.h>

// A function to check if a string str is palindrome
void printMatrix(int m, int q, int mul[10][10])
{

    int c, d;
    for (c = 0; c < m; c++)
    {
        for (d = 0; d < q; d++)
            printf("%d \t", mul[c][d]);
        printf(" \n");
    }
}

int main(void)
{
    int c, d, p, q, m, n, k, tot = 0;
    int fst[10][10], sec[10][10], mul[10][10];

    printf("Please enter the number of rows for first matrix : ");
    scanf("%d", &m);

    printf("Please enter the number of columns for first matrix : ");
    scanf("%d", &n);

    printf("Please enter the number of rows for second matrix : ");
    scanf(" %d", &p);

    printf("Please enter the number of columns for second matrix : ");
    scanf(" %d", &q);

    if (n != p)
    {
        printf("Your given matrices cannot be multiplied with each other. \n ");
        return 0;
    }

    printf("Enter first matrix elements ( %d X %d = %d ): \n", m, n, m * n);
    for (c = 0; c < m; c++)
        for (d = 0; d < n; d++)
        {
            printf("Enter the element at mat1[%d][%d] : ", c, d);
            scanf("%d", &fst[c][d]);
        }
    printMatrix(m, n, fst);
    printf("Enter your elements for second matrix ( %d X %d = %d ): \n", p, q, p * q);

    for (c = 0; c < p; c++)
        for (d = 0; d < q; d++)
        {

            printf("Enter the element at mat2[%d][%d] : ", c, d);
            scanf("%d", &sec[c][d]);
        }
    printMatrix(p, q, sec);
    for (c = 0; c < m; c++)
    {
        for (d = 0; d < q; d++)
        {
            for (k = 0; k < p; k++)
            {
                tot = tot + fst[c][k] * sec[k][d];
            }
            mul[c][d] = tot;
            tot = 0;
        }
    }

    printf("The result of matrix multiplication or product of the matrices is: \n ");
    printMatrix(m, q, mul);

    return 0;
}
