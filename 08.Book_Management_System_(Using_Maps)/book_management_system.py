books = {}


def insert(book_id, book_name):

    global books
    books[book_id] = book_name
    print("Book Added !")


def display():
    global books
    # print each data item.
    print("_________________________________________\n")
    print("{:<10} {:<10}".format("Book ID", "| Book Name"))
    for key, value in books.items():
        print("{:<10} {:<10}".format(key, "| "+value))


def search(book_id):
    global books
    if book_id in books:

        return True
    else:

        return False


def delete(book_id):
    global books
    if book_id in books:
        get_book(book_id)
        del books[book_id]
        return True
    else:
        return False


def get_book(book_id):
    print("_________________________________________\n")
    print("{:<10} {:<10}".format("Book ID", "| Book Name"))
    print("{:<10} {:<10}".format(book_id, "| "+books[book_id]))


def quit():
    exit()

# Main Function for Menu-Driven


def main():
    print("_________________________________________\n")
    print("1. Add Book")
    print("2. Display Books")
    print("3. Search Books")
    print("4. Delete Book")
    print("5. Quit")

    choice = int(input("Please enter you choice : "))
    print("_________________________________________")

    # based on the users choice the relevant method is called
    if choice == 1:
        print("\nAdd a book\n")
        book_id = int(input("Enter Book ID: "))
        if search(book_id):
            print("Do you want to update book ?")
            print("Y. Yes")
            print("N. No")
            update_choice = input()
            if(update_choice in ['N', 'n', 'no', 'No']):
                return

        book_name = input(f"Enter Book Name for Id {book_id}: ")
        insert(book_id, book_name)

    elif choice == 2:
        print("\nDisplay Books\n")
        display()

    elif choice == 3:
        print("\nSearch a book\n")
        book_id = int(input("Enter Book ID: "))
        if search(book_id):
            print("Book Found !")
            get_book(book_id)
        else:
            print("Book not found !")

    elif choice == 4:
        print("\nDelete a book\n")
        book_id = int(input("Enter Book ID: "))
        if delete(book_id):
            print("Book Deleted !")
        else:
            print("Book not found !")

    elif choice == 5:
        print("Are you sure want to exit ?")
        print("Y. Yes")
        print("N. No")
        update_choice = (input())
        if(update_choice in ['N', 'n', 'no', 'No']):
            return
        else:
            print("Visit Again !")
            quit()

    else:
        print("Please enter a valid Input.")


if __name__ == "__main__":
    print("----------------------" +
          "Welcome to Books Management_System" +
          "----------------------")
while True:
    main()
