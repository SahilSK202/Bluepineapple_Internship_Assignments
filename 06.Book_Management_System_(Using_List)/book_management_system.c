

// C program to implement book management system using linked list.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

struct book
{
    int book_id;
    char book_name[50];
    struct book *p_next;
};

struct book *head = NULL; // point to head book
struct book *prev = NULL; // point to prev book to set address
struct book *newbook;
int search(int);

void createSLL()
{

    int ch1 = 0, item_id;
    char item_name[50];
    do
    {

        printf("\nEnter Book ID :");
        fflush(stdin);
        scanf("%d", &item_id);
        if (head != NULL && search(item_id))
        {
            continue;
        }
        printf("\nEnter Book Name for Book ID %d : ", item_id);
        fflush(stdin);
        scanf("%s", item_name);

        newbook = (struct book *)malloc(sizeof(struct book));
        newbook->book_id = item_id;
        strcpy(newbook->book_name, item_name);
        // newbook->book_name = item_name;
        newbook->p_next = NULL;
        // assigned next pointer to null of the each book inserted
        if (head == NULL)
        {
            head = prev = newbook;
            // for first book , head and prev will point to first book
        }
        else
        {
            prev->p_next = newbook; // for next books
            prev = newbook;
        }
        printf("\nBook added !");
        printf("\n\n***********************************\nEnter 1 to add more books.\nEnter 2 for Main Menu. \n : ");
        scanf("%d", &ch1);
    } while (ch1 == 1);
}

void insert_beg(int item_id, char item_name[50])
{
    if (head == NULL)
    {
        printf("\nCreate Books list first !");
        return;
    }
    newbook = (struct book *)malloc(sizeof(struct book));
    newbook->book_id = item_id;
    strcpy(newbook->book_name, item_name);
    newbook->p_next = head;
    head = newbook;
}

void insert_end(int item_id, char item_name[50])
{
    if (head == NULL)
    {
        printf("\nCreate list first !");
        return;
    }
    struct book *temp;
    newbook = (struct book *)malloc(sizeof(struct book));
    newbook->book_id = item_id;
    strcpy(newbook->book_name, item_name);
    newbook->p_next = NULL;

    // traverse to end

    temp = head;
    while (temp->p_next != NULL)
    {
        temp = temp->p_next;
    }
    temp->p_next = newbook;
}

void insert_pos(int pos, int item_id, char item_name[50])
{
    if (head == NULL)
    {
        printf("\nCreate list first !");
        return;
    }
    struct book *temp;
    int count2 = 1;
    newbook = (struct book *)malloc(sizeof(struct book));
    newbook->book_id = item_id;
    strcpy(newbook->book_name, item_name);

    temp = head;
    if (pos == 1)
    {
        insert_beg(item_id, item_name);
    }
    else // traverse to pos-1
    {
        while (count2 < pos - 1)
        {
            temp = temp->p_next;
            count2++;
        }
        if (temp->p_next == NULL)
        {
            insert_end(item_id, item_name);
        }
        else
        {
            newbook->p_next = temp->p_next;
            temp->p_next = newbook;
        }
    }
}

void delete_beg()
{

    if (head == NULL)
    {
        printf("\nList is Empty.");
        return;
    }
    if (head->p_next == NULL)
    {
        printf("\nDeleted book is %d : %s", head->book_id, head->book_name);
        head = NULL;
        return;
    }
    printf("\nDeleted book is %d : %s", head->book_id, head->book_name);
    struct book *temp;
    temp = head->p_next;
    free(head);
    head = temp;
}

void delete_end()
{

    if (head == NULL)
    {
        printf("\nList is Empty.");
        return;
    }
    if (head->p_next == NULL)
    {
        printf("\nDeleted book is %d : %s", head->book_id, head->book_name);
        head = NULL;
        return;
    }
    struct book *temp1, *temp2;

    // traverse to top

    temp1 = head;         // starts from head (to access second last elt)
    temp2 = head->p_next; // starts from head + 1

    while (temp2->p_next != NULL)
    {
        temp1 = temp1->p_next; // reaches to last - 1
        temp2 = temp2->p_next; // reaches to last
    }
    printf("\nDeleted book is %d : %s", temp2->book_id, temp2->book_name);
    free(temp2);
    temp1->p_next = NULL;
}

void delete_pos(int pos)
{
    if (head == NULL)
    {
        printf("\nList is Empty.");
        return;
    }
    if (head->p_next == NULL)
    {
        printf("\nDeleted book is %d : %s", head->book_id, head->book_name);
        head = NULL;
        return;
    }

    if (pos == 1)
    {
        delete_beg();
    }
    else
    {
        struct book *temp1, *temp2;
        int count1 = 1;
        // traverse to pos

        temp1 = head;         // starts from head (to access second last elt)
        temp2 = head->p_next; // starts from head + 1

        while (count1 < pos - 1)
        {
            temp1 = temp1->p_next; // reaches to pos - 1
            temp2 = temp2->p_next; // reaches to pos
            count1++;
        }

        temp1->p_next = temp2->p_next;
        printf("\nDeleted book is %d : %s", temp2->book_id, temp2->book_name);
        free(temp2);
    }
}

void delete (int item_id)
{
    int pos;
    if (head == NULL)
    {
        printf("\nBooks List is Empty.");
        return;
    }
    pos = search(item_id);
    if (!pos)
    {
        printf("Book Not Found !");
    }
    else
    {
        delete_pos(pos);
    }
}

int sizeLL()
{
    int size = 0;
    if (head != NULL)
    {
        struct book *temp;
        for (temp = head; temp != NULL; temp = temp->p_next)
        {
            size++;
        }
    }
    printf("\n\nSize is %d\n", size);
    return size;
}

int search(int item_id)
{
    bool found = false;
    int counter = 1;
    if (head == NULL)
    {
        printf("\nBooks List is Empty.");
        return found;
    }

    struct book *ptr;

    for (ptr = head; ptr != NULL; ptr = ptr->p_next)
    {
        if (ptr->book_id == item_id)
        {
            printf("Book Found in List! \n");
            printf("Book Id\tBook Name\n");
            printf("%d\t%s\n", ptr->book_id, ptr->book_name);
            return counter;
        }
        ++counter;
    }
    return 0;
}

void display()
{
    if (head == NULL)
    {
        printf("\nBooks List is Empty.");
        return;
    }

    struct book *ptr;
    printf("\nDisplaying Books List...\n");
    printf("______________________________________\n");
    printf("Book Id\t | Book Name\n");
    printf("______________________________________\n");
    for (ptr = head; ptr != NULL; ptr = ptr->p_next)
    {
        printf("%d\t | %s\n", ptr->book_id, ptr->book_name);
    }
}

int main()
{
    int ch;
    int item_id;
    char item_name[50];
    while (ch != 9)
    {
        printf("\n\n***** Main Menu *****");
        printf("______________________________________");
        printf("\n\n1.Create\n2.Insert\n3.Delete\n4.Search\n8.Display\n9.Exit");
        printf("\n\nEnter your choice :");
        scanf("%d", &ch);
        printf("______________________________________\n");
        switch (ch)
        {
        case 1:
        {

            createSLL();
            break;
        }
        case 2:
        {
            int ch1 = 0;
            while (ch1 != 4)
            {
                printf("\n\n***** Insert Menu *****");
                printf("______________________________________");
                printf("\n\n1.Insert at beginning\n2.Insert at end\n3.Insert at particular position\n4.Main Menu");
                printf("\n\nEnter your choice : ");
                scanf("%d", &ch1);
                printf("______________________________________\n");
                switch (ch1)
                {
                case 1:
                {

                    printf("\nEnter Book ID to insert at beginning : ");
                    fflush(stdin);
                    scanf("%d", &item_id);
                    if (search(item_id))
                    {
                        ch1 = 2;
                        break;
                    }
                    printf("\nEnter Book Name for Book ID %d : ", item_id);
                    fflush(stdin);
                    scanf("%s", item_name);

                    insert_beg(item_id, item_name);

                    break;
                }
                case 2:
                {

                    printf("\nEnter Book ID to insert at end : ");
                    fflush(stdin);
                    scanf("%d", &item_id);
                    if (search(item_id))
                    {
                        ch1 = 2;
                        break;
                    }
                    printf("\nEnter Book Name for Book ID %d : ", item_id);
                    fflush(stdin);
                    scanf("%s", item_name);

                    insert_end(item_id, item_name);

                    break;
                }
                case 3:
                {
                    int pos, size;
                    size = sizeLL();
                    do
                    {
                        printf("\nEnter position to insert a book : ");
                        scanf("%d", &pos);

                        if (pos > size + 1 || pos < 1) // can be inserted at end so size+1
                        {
                            printf("\nInvalid position to insert\n");
                        }
                    } while (pos > size + 1 || pos < 1);

                    printf("\nEnter Book ID to insert at position %d : ", pos);
                    fflush(stdin);
                    scanf("%d", &item_id);
                    if (search(item_id))
                    {
                        ch1 = 2;
                        break;
                    }
                    printf("\nEnter Book Name for Book ID %d : ", item_id);
                    fflush(stdin);
                    scanf("%s", item_name);

                    insert_pos(pos, item_id, item_name);

                    break;
                }
                case 4:
                {
                    break;
                }
                default:
                {
                    printf("\nWrong Choice!!");
                }
                }
            }
        }
        break;
        case 3:
        {
            int ch1 = 0;
            while (ch1 != 5)
            {
                printf("\n\n***** Delete Menu *****");
                printf("______________________________________");
                printf("\n\n1.Delete from beginning\n2.Delete from end\n3.Delete from particular position\n4.Delete by ID\n5.Main Menu");
                printf("\n\nEnter your choice : ");
                scanf("%d", &ch1);
                printf("______________________________________\n");
                switch (ch1)
                {
                case 1:
                {

                    delete_beg();

                    break;
                }
                case 2:
                {

                    delete_end();

                    break;
                }
                case 3:
                {
                    int pos, size;
                    size = sizeLL();
                    do
                    {
                        printf("\nEnter position to delete a book : ");
                        scanf("%d", &pos);

                        if (pos > size || pos < 1)
                        {
                            printf("\nInvalid position to delete");
                        }
                    } while (pos > size || pos < 1);

                    delete_pos(pos);

                    break;
                }
                case 4:
                {
                    printf("\nEnter ID of the book to delete: ");
                    scanf("%d", &item_id);
                    delete (item_id);
                }
                case 5:
                {
                    break;
                }
                default:
                {
                    printf("\nWrong Choice!!");
                }
                }
            }
        }
        break;
        case 4:
        {
            int id;

            printf("\nEnter ID of the book to search: ");
            scanf("%d", &id);

            if (!search(id))
            {
                printf("Book Not Found !");
            }

            break;
        }
        case 8:
            display();
            break;
        case 9:
            exit(0);

        default:
            printf("\nWrong Choice!!");
        }
    }

    return 0;
}