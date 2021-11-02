//import the sqlite3 module
const sqlite3 = require("sqlite3"); 

//import object function from sqlite library
const { open } = require("sqlite");

async function getBooks() {
  const db = await open({
    filename: "./db/bookpals.db",
    driver: sqlite3.Database,
  });

  return await db.all("SELECT book_title, author_first_name, author_last_name FROM Book INNER JOIN BookAuthor ON BookAuthor.author_id = Book.book_author_id LIMIT 20");
}


module.exports.getBooks = getBooks;
