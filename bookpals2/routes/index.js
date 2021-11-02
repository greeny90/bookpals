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

module.exports = router;
