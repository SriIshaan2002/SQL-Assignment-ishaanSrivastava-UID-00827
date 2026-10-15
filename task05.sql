--5.1
  SELECT movies.title, SUM(bookings.seats_booked*showtimes.ticket_price) AS total_revenue FROM movies LEFT JOIN showtimes ON movies.movie_id = showtimes.movie_id LEFT JOIN bookings ON showtimes.showtime_id = bookings.showtime_id GROUP BY movies.title ORDER BY total_revenue DESC;

--5.2
  SELECT movies.genre, SUM(bookings.seats_booked) AS total_seats_booked FROM movies LEFT JOIN showtimes ON movies.movie_id = showtimes.movie_id LEFT JOIN bookings ON showtimes.showtime_id = bookings.showtime_id GROUP BY movies.genre ORDER BY total_seats_booked DESC;

--5.3
  SELECT screens.screen_name, AVG(showtimes.ticket_price) AS average_ticket_price FROM screens LEFT JOIN showtimes ON screens.screen_id = showtimes.screen_id GROUP BY screens.screen_name;

--5.4
  SELECT movies.genre FROM movies LEFT JOIN showtimes ON movies.movie_id = showtimes.movie_id LEFT JOIN bookings ON showtimes.showtime_id = bookings.showtime_id GROUP BY movies.genre HAVING SUM(bookings.seats_booked) > 10;

--5.5
  SELECT showtimes.showtime_id, movies.title, screens.screen_name, screens.capacity, SUM(bookings.seats_booked) AS total_seats_booked, (SUM(bookings.seats_booked)*100)/screens.capacity AS occupancy_rate FROM showtimes LEFT JOIN movies ON showtimes.movie_id = movies.movie_id LEFT JOIN screens ON showtimes.screen_id = screens.screen_id LEFT JOIN bookings ON showtimes.showtime_id = bookings.showtime_id GROUP BY showtimes.showtime_id, movies.title, screens.screen_name, screens.capacity ORDER BY occupancy_rate DESC;