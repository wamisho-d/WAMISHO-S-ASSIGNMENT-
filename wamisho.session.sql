# Database Connection
import mysql.connector
from mysql.connector import Error
def create_connection():
    try:
        connection = mysql.connector.connect(
            host='localhost',
            database='library_management',
            user='root', # your MySQL username
            password='password' # your MySQL password
        )
        if connection.is_connected():
            print("connected to MySQL database")
            return connection
    except Error as e:
        print(f"Error: {e}")
        return None

def close_connection(connection):
    if connection.is_connected():
        connection.close()
        print("MySQL connection is closed")



# Class Definition and Database Integration
from aifc import Error
import db
class Book:

    def __init__(self, id, title, author_id, genre_id, isbn, publicaction_date, availiablity=True):
       self.id = id 
       self.title = title
       self.author_id = author_id
       self.genre_id = genre_id
       self.isbn = isbn
       self.publication_date = publicaction_date
       self.avialbility = availiablity

@staticmethod
def add_book(book):
   connection = db.create_connection()
   cursor = connection.cursor()
   try:
        cursor.execute("INSERT INTO books (title, author_id, genre_id, isbn, publication_date, availibilty) VALUES (%,%,%,%,%,%)",(book.title, book.author_id, book.publication_date, book.availiblity))
        connection.commit()
        print("Book added sucessfully")
   except Error as e:
        print(f"Error: {e}")
   finally:
        db.close_connection(connection)

@staticmethod
def dispaly_books():
    connection = db.create.connection()
    cursor = connection.cursor()
    try:
        cursor.excute("SELECT * FROM books")
        books = cursor.fetchall()
        for book in books:
            print(book)
    except Error as e:
        print((f"Error: {e}"))
    finally:
        db.close_connection(connection)

class User:
    def __init__(self, id, name, library_id):
        self.id = id
        self.name = name
        self.library_id = library_id
@staticmethod
def add_user(user):
    connection = db.creater_connection()
    cursor = connection.cursor()
    try:
        cursor.excute("INSERT INTO users (name, library_id) VALUES (%s, %s)", (user.name, user.library_id))
        connection.commit()
        print("User added sucessfully")
    except Error as e:
        print(f"Error: {e}")
    finally:
        db.close_connection(connection)

@staticmethod
def display_users():
    connection = db.create_connection()
    cursor = connection.cursor()
    try:
        cursor.execute("SELECT * FROM user")
        users = cursor.fetchall()
        for user in users:
            print(user)
    except Error as e:
        print(f"Error: {e}")
    finally:
        db.close_connection(connection)


# Command-Line Interface
from library import Book, User
def main_menu():
    while True:
        print("""
        Welcome to the Library Managment System with Database Integration!
        ****
        Main Menu:
        1. Book Operations
        2. User Operations
        3. Author Operations
        4. Genre Operations
        5. Quit
        """)
        choice = input ("Select an option: ")
        if choice == '1':
           book_operations()
        elif choice == '2':
           user_operations()
        elif choice == '5':
            break
        else:
            print("Invalid option, please try again.")
def book_operations():
    while True:
        print("""
        Book Operations:
        1. Add a new book
        2. Borrow a book
        3. Return a book
        4. Search for a book
        5. Dispaly all book
        6. Back to main menu
        """)
        choice = input("Select an option:")
        if choice == '1':
            title = input("Enter book title:")
            author_id = int(input("Enter author ID: "))
            genre_id = int(input("Enter genre ID:"))
            isbn = input("Enter ISBN:") 
            publication_date = input("Enter publication_date(YYYY-MM-DD):")
            book = Book(None, title, author_id, genre_id, isbn, publication_date)
            Book.add_book(book)
        elif choice == '2':
            Book.Borrow_books
        elif choice == '4':
            Book.genre_books
        elif choice == '5':
            Book.display_books()
        elif choice == '6':
            break
        else:
            print("Invalid option, please try agian.")

def user_operations():
    while True:
        print("""
        User Operations:
        1. Add a new user
        2. View user details
        3. Dispaly all users
        4. Back to main menu
        """)
        choice = input("Select an option:")
        if choice == '1':
           name = input("Enter user name:")
           library_id = input("Enter library ID:")
           user = user(None, name, library_id)
           User.add_user(user)
        elif choice == '2':
           user.user_details()
        elif choice == '3':
           user.display_users()
        elif choice == '4':
           break 
        else:
            print("Invalid option, please try again.")

if __name__ == "__main__":
    main_menu



        


