BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Book" (
	"isbn"	TEXT NOT NULL,
	"book_title"	TEXT NOT NULL,
	"year_of_publication"	NUMERIC,
	"average_book_rating"	INTEGER,
	"book_author_id"	TEXT,
	"book_genre_id"	TEXT,
	"book_user_id"	TEXT,
	"borrower_book_id"	TEXT,
	"owned_book_id"	TEXT,
	PRIMARY KEY("isbn"),
	FOREIGN KEY("book_user_id") REFERENCES "User"("user_id"),
	FOREIGN KEY("book_genre_id") REFERENCES "BookGenre"("genre_id"),
	FOREIGN KEY("book_author_id") REFERENCES "BookAuthor"("author_id")
);
CREATE TABLE IF NOT EXISTS "BookAuthor" (
	"author_id"	TEXT NOT NULL,
	"author_first_name"	TEXT NOT NULL,
	"author_last_name"	TEXT NOT NULL,
	"author_book_ISBN"	TEXT,
	PRIMARY KEY("author_id")
);
CREATE TABLE IF NOT EXISTS "BookGenre" (
	"genre_id"	TEXT NOT NULL,
	"genre_type"	TEXT NOT NULL,
	"genre_book_ISBN"	TEXT,
	PRIMARY KEY("genre_id")
);
CREATE TABLE IF NOT EXISTS "GeographicRegion" (
	"region_id"	TEXT NOT NULL,
	"region_name"	TEXT NOT NULL,
	"region_pickup_location"	TEXT,
	"owned_book_id"	TEXT,
	"borrowed_book_id"	TEXT,
	"regional_user_id"	TEXT,
	PRIMARY KEY("region_id"),
	FOREIGN KEY("borrowed_book_id") REFERENCES "BooksBorrowedByUser"("book_borrowed_id"),
	FOREIGN KEY("owned_book_id") REFERENCES "BooksOwnedByUser"("book_owned_id"),
	FOREIGN KEY("regional_user_id") REFERENCES "User"("user_id")
);
CREATE TABLE IF NOT EXISTS "User" (
	"user_id"	TEXT NOT NULL,
	"user_name"	TEXT NOT NULL,
	"email"	TEXT NOT NULL,
	"phone_number"	TEXT NOT NULL,
	"city"	TEXT NOT NULL,
	"state"	TEXT NOT NULL,
	"geographic_region_id"	TEXT,
	"is_book_owner"	INTEGER,
	"is_book_borrower"	NUMERIC,
	"user_book_ISBN"	TEXT,
	"book_owned_id"	TEXT,
	PRIMARY KEY("user_id"),
	FOREIGN KEY("geographic_region_id") REFERENCES "GeographicRegion"("region_id")
);
CREATE TABLE IF NOT EXISTS "BooksBorrowedByUser" (
	"book_borrowed_id"	TEXT NOT NULL,
	"borrower_user_id"	TEXT,
	"borrowed_book_ISBN"	TEXT,
	"borrower_book_rating"	INTEGER,
	"date_borrowed"	NUMERIC,
	"borrower_region_id"	TEXT,
	"due_date"	NUMERIC,
	PRIMARY KEY("book_borrowed_id"),
	FOREIGN KEY("borrower_region_id") REFERENCES "GeographicRegion"("region_id"),
	FOREIGN KEY("borrowed_book_ISBN") REFERENCES "Book"("isbn"),
	FOREIGN KEY("borrower_user_id") REFERENCES "User"("user_id")
);
CREATE TABLE IF NOT EXISTS "BooksOwnedByUser" (
	"book_owned_id"	TEXT NOT NULL,
	"owner_user_id"	TEXT,
	"book_owned_ISBN"	TEXT,
	"owned_book_rating"	INTEGER,
	"date_added_by_user"	NUMERIC,
	"owner_region_id"	TEXT,
	PRIMARY KEY("book_owned_id"),
	FOREIGN KEY("book_owned_ISBN") REFERENCES "Book"("isbn"),
	FOREIGN KEY("owner_user_id") REFERENCES "User"("user_id"),
	FOREIGN KEY("owner_region_id") REFERENCES "GeographicRegion"("region_id")
);
INSERT INTO "Book" VALUES ('527-4-77823-801-8','1984',1948,4.9,'1','1','17',NULL,NULL);
INSERT INTO "Book" VALUES ('828-7-48852-675-0','Animal Farm',1945,4.8,'2','1','1',NULL,NULL);
INSERT INTO "Book" VALUES ('910-2-79324-486-1','Pride and Prejudice',1813,4.9,'3','2','8',NULL,NULL);
INSERT INTO "Book" VALUES ('174-8-34991-811-9','Wuthering Heights',1847,4.7,'4','2','12',NULL,NULL);
INSERT INTO "Book" VALUES ('899-4-72673-848-3','Treasure Island',1882,3.8,'5','2','7',NULL,NULL);
INSERT INTO "Book" VALUES ('031-7-62206-454-8','Cracking the Coding Interview',2015,4.3,'6','3','1',NULL,NULL);
INSERT INTO "Book" VALUES ('146-4-80843-118-8','Algorithms',2016,4.2,'7','10','10',NULL,NULL);
INSERT INTO "Book" VALUES ('552-6-65528-853-0','SQLite',2017,3.7,'8','3','19',NULL,NULL);
INSERT INTO "Book" VALUES ('537-1-76647-388-2','Computer Networks',2020,3.5,'9','10','18',NULL,NULL);
INSERT INTO "Book" VALUES ('195-6-18284-606-5','Mediteranean Cookbook',2021,2.8,'10','4','11',NULL,NULL);
INSERT INTO "Book" VALUES ('362-5-32343-262-3','Born a Crime',2020,3.6,'11','8','16',NULL,NULL);
INSERT INTO "Book" VALUES ('221-2-52415-878-3','Atomic Habits',2018,5.9,'12','5','13',NULL,NULL);
INSERT INTO "Book" VALUES ('318-7-17283-076-1','Cant Hurt Me',2018,2.7,'13','5','14',NULL,NULL);
INSERT INTO "Book" VALUES ('784-5-05719-864-0','Silicon Valley',2005,3.6,'14','7','4',NULL,NULL);
INSERT INTO "Book" VALUES ('803-9-35348-617-2','Ace you Data Interview',2014,4.9,'15','5','5',NULL,NULL);
INSERT INTO "Book" VALUES ('853-3-87424-416-2','Healthy Breakfast',1992,1.5,'16','9','6',NULL,NULL);
INSERT INTO "Book" VALUES ('741-5-71439-586-1','Draw Your World',1972,3.7,'17','6','3',NULL,NULL);
INSERT INTO "Book" VALUES ('561-1-97451-675-7','Origami',1973,2.3,'18','6','20',NULL,NULL);
INSERT INTO "Book" VALUES ('718-8-27728-925-1','Great Gatsby',1925,3.2,'19','2','2',NULL,NULL);
INSERT INTO "Book" VALUES ('347-6-92916-038-4','Taste: my Life through food',2021,4.5,'20','8','15',NULL,NULL);
INSERT INTO "BookAuthor" VALUES ('1','George','Orwell','527-4-77823-801-8');
INSERT INTO "BookAuthor" VALUES ('2','George','Orwell','828-7-48852-675-0');
INSERT INTO "BookAuthor" VALUES ('3','Jane','Austen','910-2-79324-486-1');
INSERT INTO "BookAuthor" VALUES ('4','Emily','Bronte','174-8-34991-811-9');
INSERT INTO "BookAuthor" VALUES ('5','Robert Louise','Stevenson','899-4-72673-848-3');
INSERT INTO "BookAuthor" VALUES ('6','Adam','Mark','031-7-62206-454-8');
INSERT INTO "BookAuthor" VALUES ('7','Daniel','Bernard','146-4-80843-118-8');
INSERT INTO "BookAuthor" VALUES ('8','Moana','Ann','552-6-65528-853-0');
INSERT INTO "BookAuthor" VALUES ('9','Ryder','Rhoda','537-1-76647-388-2');
INSERT INTO "BookAuthor" VALUES ('10','Scarlet','Kareem','195-6-18284-606-5');
INSERT INTO "BookAuthor" VALUES ('11','Rebecca','Sara','362-5-32343-262-3');
INSERT INTO "BookAuthor" VALUES ('12','April','Rhiannon','221-2-52415-878-3');
INSERT INTO "BookAuthor" VALUES ('13','Uta','Ignacia','318-7-17283-076-1');
INSERT INTO "BookAuthor" VALUES ('14','Ramona','Leroy','784-5-05719-864-0');
INSERT INTO "BookAuthor" VALUES ('15','Luke','Barclay','803-9-35348-617-2');
INSERT INTO "BookAuthor" VALUES ('16','Hasad','Cleo','853-3-87424-416-2');
INSERT INTO "BookAuthor" VALUES ('17','Rajah','Curran','741-5-71439-586-1');
INSERT INTO "BookAuthor" VALUES ('18','Janna','Craig','561-1-97451-675-7');
INSERT INTO "BookAuthor" VALUES ('19','Cailin','Guinevere','718-8-27728-925-1');
INSERT INTO "BookAuthor" VALUES ('20','Marvin','Kiayada','347-6-92916-038-4');
INSERT INTO "BookGenre" VALUES ('1','Dystopia','');
INSERT INTO "BookGenre" VALUES ('2','Classic Literature',NULL);
INSERT INTO "BookGenre" VALUES ('3','Programming',NULL);
INSERT INTO "BookGenre" VALUES ('4','Cuisine',NULL);
INSERT INTO "BookGenre" VALUES ('5','Self-Help',NULL);
INSERT INTO "BookGenre" VALUES ('6','Art',NULL);
INSERT INTO "BookGenre" VALUES ('7','History',NULL);
INSERT INTO "BookGenre" VALUES ('8','Biography',NULL);
INSERT INTO "BookGenre" VALUES ('9','Reference',NULL);
INSERT INTO "BookGenre" VALUES ('10','Computer',NULL);
INSERT INTO "GeographicRegion" VALUES ('1','San Jose','40 Coleman Lane','1','20','13');
INSERT INTO "GeographicRegion" VALUES ('2','San Francisco','1645 Monica Circle','10','19','15');
INSERT INTO "GeographicRegion" VALUES ('3','San Leandro','28 Morningstar Way','11','18','19');
INSERT INTO "GeographicRegion" VALUES ('4','Gilroy','62979 Everett Crossing','12','16','17');
INSERT INTO "GeographicRegion" VALUES ('5','San Mateo','826 Shoshone Trail','13','17','11');
INSERT INTO "GeographicRegion" VALUES ('6','Sunnyvale','28 Kennedy Street','14','15','11');
INSERT INTO "GeographicRegion" VALUES ('7','Palo Alto','97166 Independence Plaza','15','14','4');
INSERT INTO "GeographicRegion" VALUES ('8','Menlo Park','27139 Fulton Road','16','13','1');
INSERT INTO "GeographicRegion" VALUES ('9','Richmond','58 Sugar Avenue','17','12','10');
INSERT INTO "GeographicRegion" VALUES ('10','Concord','74709 Sloan Street','18','11','12');
INSERT INTO "GeographicRegion" VALUES ('11','Walnut Creek','9 Oakridge Park','19','10','12');
INSERT INTO "GeographicRegion" VALUES ('12','Sacramento','7 Haas Trail','2','9','2');
INSERT INTO "GeographicRegion" VALUES ('13','Pleasanton','483 Delaware Crossing','20','8','4');
INSERT INTO "GeographicRegion" VALUES ('14','San Rafael','82 Superior Pass','3','7','6');
INSERT INTO "GeographicRegion" VALUES ('15','Milpitas','4105 Talisman Alley','4','6','7');
INSERT INTO "GeographicRegion" VALUES ('16','Oakland','8 Forest Dale Junction','5','1','7');
INSERT INTO "GeographicRegion" VALUES ('17','San Ramon','6 Scoville Parkway','6','2','8');
INSERT INTO "GeographicRegion" VALUES ('18','Freemont','442 Burrows Street','7','3','1');
INSERT INTO "GeographicRegion" VALUES ('19','Hayword','619 Morningstar Hill','8','4','1');
INSERT INTO "GeographicRegion" VALUES ('20','Livermore','888 Susan Road','9','5','2');
INSERT INTO "User" VALUES ('1','Clarence Largan','clargan0@scientificamerican.com','865-750-3298','Nouaseur','CA','1',1,2,NULL,NULL);
INSERT INTO "User" VALUES ('19','Tobe Macieiczyk','tmacieiczyk0@tripadvisor.com','813-496-3280','Nantou','CA','10',1,2,NULL,NULL);
INSERT INTO "User" VALUES ('2','Deny Postles','dpostles1@google.it','932-142-8976','East End','CA','11',1,2,NULL,NULL);
INSERT INTO "User" VALUES ('3','Veradis Keene','vkeene2@1und1.de','985-756-9448','Maae','CA','12',1,2,NULL,NULL);
INSERT INTO "User" VALUES ('4','Ursuline McGeachy','umcgeachy3@sciencedirect.com','615-628-6156','Giemdiem','CA','14',1,2,NULL,NULL);
INSERT INTO "User" VALUES ('5','Warren Keveren','wkeveren4@seattletimes.com','220-532-9045','Azara','CA','7',1,2,NULL,NULL);
INSERT INTO "User" VALUES ('6','Wainwright Vossing','wvossing5@ucoz.com','265-407-0832','Ximapo','CA','17',1,2,NULL,NULL);
INSERT INTO "User" VALUES ('7','Daveen Hapke','dhapke6@pcworld.com','788-328-2365','Pobé','CA','15',1,2,NULL,NULL);
INSERT INTO "User" VALUES ('8','Una Sumpter','usumpter7@newyorker.com','606-194-4557','Mancogeh','CA','13',1,2,NULL,NULL);
INSERT INTO "User" VALUES ('9','Nicki Vaneev','nvaneev8@wikimedia.org','585-688-4233','Rochester','CA','19',1,2,NULL,NULL);
INSERT INTO "User" VALUES ('10','Roberta Towhey','rtowhey9@hatena.ne.jp','585-354-9385','Hangzhou','CA','8',2,1,NULL,NULL);
INSERT INTO "User" VALUES ('11','Valencia Jentle','vjentlea@dot.gov','712-741-0717','Erhe','CA','19',2,1,NULL,NULL);
INSERT INTO "User" VALUES ('12','Derry Geerits','dgeeritsb@umich.edu','658-617-8188','Nam Som','CA','17',2,1,NULL,NULL);
INSERT INTO "User" VALUES ('13','Wyatan Blurton','wblurtonc@instagram.com','836-870-5399','Kitakami','CA','18',2,1,NULL,NULL);
INSERT INTO "User" VALUES ('14','Katrine Schultes','kschultesd@latimes.com','855-728-5892','Pilníkov','CA','2',2,1,NULL,NULL);
INSERT INTO "User" VALUES ('15','Nicolis Snow','nsnowe@twitter.com','436-341-5755','Byala','CA','18',2,1,NULL,NULL);
INSERT INTO "User" VALUES ('16','Lyman Dober','ldoberf@theatlantic.com','663-869-4339','Embi','CA','6',2,1,NULL,NULL);
INSERT INTO "User" VALUES ('17','Rosmunda Stanaway','rstanawayg@npr.org','825-126-4053','Gonghe','CA','18',2,1,NULL,NULL);
INSERT INTO "User" VALUES ('18','Pasquale Herries','pherriesh@salon.com','961-769-3406','Mabilog','CA','1',2,1,NULL,NULL);
INSERT INTO "User" VALUES ('20','Ezmeralda Job','ejobj@mlb.com','508-376-5364','Angan','CA','6',2,1,NULL,NULL);
INSERT INTO "BooksBorrowedByUser" VALUES ('17','12','174-8-34991-811-9',4.4,'2021-02-10',NULL,1986);
INSERT INTO "BooksBorrowedByUser" VALUES ('18','13','031-7-62206-454-8',4.5,'2021-05-22',NULL,1986);
INSERT INTO "BooksBorrowedByUser" VALUES ('19','15','195-6-18284-606-5',4.8,'2021-02-10',NULL,1990);
INSERT INTO "BooksBorrowedByUser" VALUES ('20','19','146-4-80843-118-8',4.6,'2021-02-10',NULL,1993);
INSERT INTO "BooksBorrowedByUser" VALUES ('1','1','221-2-52415-878-3',3.8,'2021-05-22',NULL,1990);
INSERT INTO "BooksBorrowedByUser" VALUES ('2','11','318-7-17283-076-1',4.8,1993,NULL,1990);
INSERT INTO "BooksBorrowedByUser" VALUES ('3','16','347-6-92916-038-4',4.3,1986,NULL,1983);
INSERT INTO "BooksBorrowedByUser" VALUES ('4','14','362-5-32343-262-3',3,2003,NULL,2001);
INSERT INTO "BooksBorrowedByUser" VALUES ('5','16','527-4-77823-801-8',3.9,1990,NULL,1987);
INSERT INTO "BooksBorrowedByUser" VALUES ('6','18','537-1-76647-388-2',2,1992,NULL,1986);
INSERT INTO "BooksBorrowedByUser" VALUES ('7','2','552-6-65528-853-0',3.8,1986,NULL,1982);
INSERT INTO "BooksBorrowedByUser" VALUES ('8','3','561-1-97451-675-7',2.9,1986,NULL,1982);
INSERT INTO "BooksBorrowedByUser" VALUES ('9','4','718-8-27728-925-1',2,1986,NULL,1982);
INSERT INTO "BooksBorrowedByUser" VALUES ('10','5','741-5-71439-586-1',3.1,1986,NULL,1982);
INSERT INTO "BooksBorrowedByUser" VALUES ('11','6','784-5-05719-864-0',4,1986,NULL,1982);
INSERT INTO "BooksBorrowedByUser" VALUES ('12','7','803-9-35348-617-2',1,1986,NULL,1982);
INSERT INTO "BooksBorrowedByUser" VALUES ('13','8','828-7-48852-675-0',3.9,1986,NULL,1982);
INSERT INTO "BooksBorrowedByUser" VALUES ('14','19','853-3-87424-416-2',2.7,1986,NULL,1982);
INSERT INTO "BooksBorrowedByUser" VALUES ('15','9','899-4-72673-848-3',3.6,1986,NULL,1982);
INSERT INTO "BooksBorrowedByUser" VALUES ('16','20','910-2-79324-486-1',4.8,1986,NULL,1982);
INSERT INTO "BooksOwnedByUser" VALUES ('1','1','031-7-62206-454-8',1.7,'2021-01-25','1');
INSERT INTO "BooksOwnedByUser" VALUES ('2','2','146-4-80843-118-8',1.9,'2021-08-06','2');
INSERT INTO "BooksOwnedByUser" VALUES ('3','3','174-8-34991-811-9',2.2,'2021-08-02','3');
INSERT INTO "BooksOwnedByUser" VALUES ('4','4','195-6-18284-606-5',2.4,'2021-03-24','4');
INSERT INTO "BooksOwnedByUser" VALUES ('5','5','221-2-52415-878-3',1.7,'2020-11-04','5');
INSERT INTO "BooksOwnedByUser" VALUES ('6','6','318-7-17283-076-1',3.6,'2020-11-11','6');
INSERT INTO "BooksOwnedByUser" VALUES ('7','7','347-6-92916-038-4',1,'2020-12-11','6');
INSERT INTO "BooksOwnedByUser" VALUES ('8','8','362-5-32343-262-3',4.8,'2020-12-04','7');
INSERT INTO "BooksOwnedByUser" VALUES ('9','9','527-4-77823-801-8',1.1,'2020-12-29','7');
INSERT INTO "BooksOwnedByUser" VALUES ('10','10','537-1-76647-388-2',2,'2020-11-15','7');
INSERT INTO "BooksOwnedByUser" VALUES ('11','11','552-6-65528-853-0',1.5,'2021-06-27','8');
INSERT INTO "BooksOwnedByUser" VALUES ('12','12','561-1-97451-675-7',1.3,'2021-02-27','9');
INSERT INTO "BooksOwnedByUser" VALUES ('13','13','718-8-27728-925-1',1.3,'2021-04-23','10');
INSERT INTO "BooksOwnedByUser" VALUES ('14','14','741-5-71439-586-1',5,'2021-08-23','14');
INSERT INTO "BooksOwnedByUser" VALUES ('15','15','784-5-05719-864-0',1.8,'2021-01-27','13');
INSERT INTO "BooksOwnedByUser" VALUES ('16','16','803-9-35348-617-2',2,'2020-12-29','11');
INSERT INTO "BooksOwnedByUser" VALUES ('17','17','828-7-48852-675-0',2.2,'2020-12-12','15');
INSERT INTO "BooksOwnedByUser" VALUES ('18','18','853-3-87424-416-2',4.3,'2021-05-23','20');
INSERT INTO "BooksOwnedByUser" VALUES ('19','19','899-4-72673-848-3',4.5,'2021-08-02','19');
INSERT INTO "BooksOwnedByUser" VALUES ('20','19','910-2-79324-486-1',2.6,'2020-12-25','19');
COMMIT;

/*
Queries
*/

SELECT book_title, date_borrowed,due_date
FROM Book,BooksBorrowedByUser
GROUP BY due_date;


SELECT
book_title,
author_first_name,
author_last_name
FROM
Book
INNER JOIN BookAuthor
ON BookAuthor.author_id = Book.book_author_id;


SELECT user_name, CASE
WHEN User.is_book_borrower=1 THEN 'User borrows books'
WHEN User.is_book_borrower=2 THEN 'User does not borrow books'
ELSE 'User is not sure about borrowing books'
END
AS is_book_borrower
FROM User;


SELECT BookGenre.genre_type AS Genre, COUNT (Book.book_genre_id) AS Total
FROM BookGenre
INNER JOIN Book ON BookGenre.genre_id=Book.book_genre_id
WHERE BookGenre.genre_id IS NOT NULL
GROUP BY BookGenre.genre_id
ORDER BY 1 ASC;


SELECT COUNT(*)
FROM (
SELECT isbn
FROM Book
INNER JOIN BookGenre ON Book.book_genre_id=BookGenre.genre_id
WHERE BookGenre.genre_type LIKE '%Computer%' OR '%Programming%');
