--8.1
--1NF
SELECT * FROM legacy_bookings WHERE seats LIKE '%,%';
--2NF
SELECT customer_name, COUNT(DISTINCT customer_email) AS email_count FROM legacy_bookings GROUP BY customer_name ;
--3NF

--8.2
SELECT DISTINCT customer_email FROM legacy_bookings WHERE customer_email NOT IN (SELECT customer_email FROM customers);

--8.3
INSERT INTO customers (customer_name, customer_email) SELECT DISTINCT customer_name, customer_email FROM legacy_bookings WHERE customer_email NOT IN (SELECT customer_email FROM customers);

--8.4
INSERT INTO movies (title, genre) SELECT DISTINCT movie_title, movie_genre FROM legacy_bookings WHERE movie_title NOT IN (SELECT title FROM movies);

--8.5
SELECT DISTINCT unnest(string_to_array(seats, ',')) AS individual_seat FROM legacy_bookings;


