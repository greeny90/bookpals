//import the sqlite3 module
const sqlite3 = require("sqlite3"); 

//import object function from sqlite library
const { open } = require("sqlite");

sqlite3.verbose();

//function to open the database with a promise
async function connect() {
  return open({
    filename: "./db/bookpals.db",
    driver: sqlite3.Database
  });
}

async function getBooks() {
  const db = await connect();

  return await db.all("SELECT book_title, author_first_name, author_last_name, isbn, due_date FROM Book INNER JOIN BookAuthor ON BookAuthor.author_id = Book.book_author_id INNER JOIN BooksBorrowedByUser ON BooksBorrowedByUser.borrowed_book_ISBN = Book.isbn");
}

//function to create a new book
async function createBook(newBook) {
  const db = await connect();

  const stmt = await db.prepare("INSERT INTO Book(isbn, book_title, year_of_publication) VALUES (:isbn, :book_title, :year_of_publication)");

  stmt.bind({
    ":isbn": newBook.isbn,
    ":book_title": newBook.book_title,
    ":year_of_publication": newBook.year_of_publication,
  });

  return await stmt.run();
}

async function deleteBook(bookToDelete) {
  const db = await connect();

  const stmt = await db.prepare(`DELETE FROM
    Book
    WHERE isbn = :isbnToDelete
  `);

  stmt.bind({
    ":isbnToDelete": bookToDelete.isbn,
  });

  return await stmt.run();
}

/* async function getUsers() {
  const db = await connect();

  return await db.get("SELECT user_name, region_name FROM User INNER JOIN GeographicRegion ON GeographicRegion.region_id = User.geographic_region_id");
} */


module.exports.getBooks = getBooks;
module.exports.createBook = createBook;
module.exports.deleteBook = deleteBook;
//module.exports.getUsers = getUsers;



