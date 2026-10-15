--2.1
INSERT INTO movies (title, genre, rating, duration_minutes, release_year)
VALUES ('The Marlowe Reel ', 'Documentary', 'PG', 88, 2026);

--2.2
INSERT INTO customers (full_name, email, phone, loyalty_points, joined_on) VALUES
('Ishaan Srivastava',    'ishaan.srivastava@gmail.com',    '555-0101', 120, '2025-11-02');

--2.3
INSERT INTO showtimes (movie_id, screen_id, show_date, ticket_price, start_time)
VALUES (11, 1, '2026-10-20', 8.00, '18:30:00');

--2.4
UPDATE movies SET title = 'The Comet Kids' WHERE title = 'The Comet Kidz';

--2.5
UPDATE showtimes SET ticket_price = ticket_price + 2.00 WHERE show_date = '2026-8-14' AND start_time > '18:00:00';

--2.6
UPDATE customers SET loyalty_points = loyalty_points + 25 WHERE email = 'elena.petrova@example.com';

--2.7
DELETE FROM showtimes WHERE showtime_id = (
    SELECT s.showtime_id FROM showtimes s
    JOIN movies m ON s.movie_id = m.movie_id
    WHERE m.title = 'Hollow Peak'
    ORDER BY s.showtime_id DESC
    LIMIT 1
);

