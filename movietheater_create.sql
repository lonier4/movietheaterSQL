CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	ticket_id INTEGER NOT NULL
	concession_item VARCHAR(100)
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

CREATE TABLE concession(
	item_id SERIAL PRIMARY KEY,
	item_name VARCHAR(200),
	item_category VARCHAR(200),
	price NUMERIC(5, 2),
	customer_id INTEGER,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE movie(
	movie_id SERIAL PRIMARY KEY,
	movie_name VARCHAR(200),
	movie_category VARCHAR(200)
);