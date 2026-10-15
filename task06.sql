--6.1
SELECT show_date, start_time, showtimes.ticket_price FROM showtimes WHERE showtimes.ticket_price > (SELECT AVG(ticket_price) FROM showtimes);

--6.2
SELECT customers.full_name FROM customers WHERE customers.customer_id IN (SELECT DISTINCT bookings.customer_id FROM bookings INNER JOIN customers ON customers.customer_id = bookings.customer_id INNER JOIN showtimes ON bookings.showtime_id = showtimes.showtime_id INNER JOIN movies ON showtimes.movie_id = movies.movie_id WHERE movies.genre = 'Thriller' );

--6.3
WITH thriller_watchers AS (SELECT DISTINCT bookings.customer_id FROM bookings INNER JOIN customers ON customers.customer_id = bookings.customer_id INNER JOIN showtimes ON bookings.showtime_id = showtimes.showtime_id INNER JOIN movies ON showtimes.movie_id = movies.movie_id WHERE movies.genre = 'Thriller' )
SELECT full_name
FROM customers
WHERE customer_id NOT IN (SELECT customer_id FROM thriller_watchers);

--6.4
WITH movie_revenue AS (SELECT movies.title, SUM(bookings.seats_booked*showtimes.ticket_price) AS total_revenue FROM movies LEFT JOIN showtimes ON movies.movie_id = showtimes.movie_id LEFT JOIN bookings ON showtimes.showtime_id = bookings.showtime_id GROUP BY movies.title)
,stats AS (SELECT AVG(total_revenue) AS avg_revenue FROM movie_revenue)
SELECT movie_revenue.title FROM movie_revenue WHERE total_revenue > (SELECT avg_revenue FROM stats);