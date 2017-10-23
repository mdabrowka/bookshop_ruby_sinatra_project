DROP TABLE books;
DROP TABLE authors;


CREATE TABLE authors (
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE books (
   id SERIAL8 PRIMARY KEY,
   title VARCHAR(255),
   author_id INT4 REFERENCES authors(id),
   quantity INT4,
   genre VARCHAR(255),
   source_language VARCHAR(255),
   buy_price INT4,
   sell_price INT4
  );

-- INSERT INTO authors (id, first_name, last_name) VALUES (1, 'Clarice', 'Lispector');
-- INSERT INTO books (id, title, author_id, genre, source_language, buy_price, sell_price)
-- VALUES (1, 'Hour of a Star', 1, 'novel', 'Portuguese', 7, 14);
