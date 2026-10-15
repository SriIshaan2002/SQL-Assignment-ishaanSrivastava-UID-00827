--3.1
SELECT title, rating, duration_minutes FROM movies WHERE rating = 'R';

--3.2
SELECT title, duration_minutes FROM movies WHERE duration_minutes <100;

--3.3
SELECT show_date, start_time, ticket_price FROM showtimes ORDER BY ticket_price DESC LIMIT 5;

--3.4
SELECT full_name, loyalty_points FROM customers WHERE loyalty_points > 50 AND joined_on > '2025-12-31';

--3.5
SELECT * FROM movies WHERE title ILIKE '%the%';

--3.6
SELECT booking_id, customer_id, seats_booked FROM bookings WHERE status = 'cancelled';