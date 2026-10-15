--11.1
CREATE ROLE box_office_intern WITH LOGIN;
GRANT SELECT ON movies TO box_office_intern;
GRANT SELECT ON screens TO box_office_intern;
GRANT SELECT ON showtimes TO box_office_intern;
REVOKE SELECT ON showtimes FROM box_office_intern;

--11.2
SELECT b.booking_id,b.customer_id,b.showtime_id,b.seats,b.status,c.customer_name,st.show_date,st.start_time,m.movie_title
FROM bookings AS b
INNER JOIN customers AS c ON b.customer_id = c.customer_id
INNER JOIN showtimes AS st ON b.showtime_id = st.showtime_id
INNER JOIN movies AS m ON st.movie_id = m.movie_id
WHERE b.status = 'confirmed';

--11.3
EXPLAIN SELECT * FROM bookings WHERE showtime_id = 1;
CREATE INDEX idx_bookings_showtime_id ON bookings (showtime_id);
EXPLAIN SELECT * FROM bookings WHERE showtime_id = 1;