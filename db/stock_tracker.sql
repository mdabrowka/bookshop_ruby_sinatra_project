DROP TABLE books;
DROP TABLE genres;
DROP TABLE authors;


CREATE TABLE authors (
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE genres (
  id SERIAL8 PRIMARY KEY,
  type VARCHAR(255)
);

CREATE TABLE books (
   id SERIAL8 PRIMARY KEY,
   title VARCHAR(255),
   author_id INT4 REFERENCES authors(id),
   quantity INT4,
   genre_id INT4 REFERENCES genres(id),
   source_language VARCHAR(255),
   buy_price INT4,
   sell_price INT4,
   image VARCHAR(255)
  );
