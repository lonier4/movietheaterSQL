CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	ticket_id INTEGER NOT NULL
	concession_item VARCHAR(100)
);

ALTER TABLE customer
DROP COLUMN ticket_id;

ALTER TABLE customer
DROP COLUMN concession_item;

ALTER TABLE customer
ADD COLUMN email VARCHAR(100);

ALTER TABLE customer
ADD COLUMN status VARCHAR(50);

SELECT *
FROM customer;

INSERT INTO customer(
	first_name,
	last_name,
	email,
	status
)
VALUES (
	'Michael',
	'Bluth',
	'michaelbluth@gmail.com',
	'Gold'
);

INSERT INTO customer(
	first_name,
	last_name,
	email,
	status
)
VALUES (
	'George Michael',
	'Bluth',
	'bananastand@gmail.com',
	'Elite'
);

INSERT INTO customer(
	first_name,
	last_name,
	email,
	status
)
VALUES (
	'Buster',
	'Bluth',
	'lovemother@aol.com',
	'Premium'
);

INSERT INTO customer(
	first_name,
	last_name,
	email,
	status
)
VALUES (
	'Lucille',
	'Bluth',
	'lindsaysucks@gmail.com',
	'Platinum'
),
(
	'Maeby',
	'Funke',
	'scamordie@hotmail.com',
	'Gold'
);

CREATE TABLE ticket(
	ticket_id SERIAL PRIMARY KEY,
	movie_name VARCHAR(200),
	date DATE DEFAULT CURRENT_DATE,
	movie_id INTEGER NOT NULL,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(movie_id) REFERENCES movie(movie_id),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

INSERT INTO ticket(
	movie_name,
	movie_id,
	customer_id
)
VALUES (
	'Space Jam',
	3,
	5
);

INSERT INTO ticket(
	movie_name,
	movie_id,
	customer_id
)
VALUES (
	'Jungle Cruise',
	2,
	1
),
(
	'The Green Knight',
	4,
	2
);

SELECT *
FROM ticket;

CREATE TABLE movie(
	movie_id SERIAL PRIMARY KEY,
	movie_name VARCHAR(200),
	movie_category VARCHAR(200)
);

ALTER TABLE movie
ADD COLUMN duration INTEGER;

INSERT INTO movie(
	movie_name,
	movie_category,
	duration
)
VALUES (
	'Candyman',
	'horror',
	120
),
(
	'Jungle Cruise',
	'adventure',
	90
),
(
	'Space Jam',
	'comedy',
	80
),
(
	'The Green Knight',
	'fantasy',
	145
),
(
	'Cinderella',
	'musical',
	110
),
(
	'Cry Macho',
	'western',
	97
);

SELECT *
FROM movie;

ALTER TABLE movie
ADD COLUMN starring VARCHAR(100);

UPDATE movie
SET starring = 'Yahya Abdul-Mateen II'
WHERE movie_id = 1;

UPDATE movie
SET starring = 'Dwayne Johnson'
WHERE movie_id = 2;

UPDATE movie
SET starring = 'Lebron James'
WHERE movie_id = 3;

UPDATE movie
SET starring = 'Dev Patel'
WHERE movie_id = 4;

UPDATE movie
SET starring = 'Camila Cabello'
WHERE movie_id = 5;

UPDATE movie
SET starring = 'Clint Eastwood'
WHERE movie_id = 6;


CREATE TABLE concession(
	item_id SERIAL PRIMARY KEY,
	item_name VARCHAR(200),
	item_category VARCHAR(200),
	price NUMERIC(5, 2),
	customer_id INTEGER,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

DROP TABLE concession;

SELECT * 
FROM concession;

INSERT INTO concession(
	item_name,
	item_category,
	price,
	customer_id
)
VALUES (
	'soda',
	'beverages',
	50.25,
	1
),
(
	'popcorn',
	'snacks',
	38.25,
	2
),
(
	'nachos',
	'snacks',
	65.25,
	3
),
(
	'Franzia',
	'alcohol',
	71.25,
	4
),
(
	'filet mignon',
	'food',
	350.25,
	4
),
(
	'Skittles',
	'candy',
	25.25,
	5
);