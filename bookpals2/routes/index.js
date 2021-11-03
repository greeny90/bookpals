let express = require("express");
let router = express.Router();


const myDB = require("../db/MySQLiteDB.js");

/* GET home page. */
router.get("/", async function(req, res) {
  const books = await myDB.getBooks();
  console.log("got books", books);
  // render the index template with the books attribute
  res.render("index", { books: books });
});

/* router.get("/", async function(req, res) {
  const users = await myDB.getUsers();
  console.log("got users", users);
  // render the index template with the users attribute
  res.render("index", { users: users });
}); */


/* POST create book. */
router.post("/books/create", async function (req, res) {
  console.log("Got post create/books");

  const book = req.body;

  console.log("got create book", book);

  await myDB.createBook(book);

  console.log("Book created");

  res.redirect("/");
});

/* POST delete book. */
router.post("/books/delete", async function (req, res) {
  console.log("Got post delete/books");

  const book = req.body;

  console.log("got book to delete", book);

  await myDB.deleteBook(book);

  console.log("Book deleted");

  res.redirect("/");
});


module.exports = router;
