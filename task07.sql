--7.1
ALTER TABLE bookings ADD CONSTRAINT seats_booked_positive CHECK (seats_booked > 0 AND seats_booked <=10);

--7.2
ALTER TABLE bookings ADD CONSTRAINT status_check CHECK (status IN ('confirmed', 'cancelled'));

--7.3
ALTER TABLE showtimes ADD CONSTRAINT ticket_price_positive CHECK (ticket_price > 0);

--7.4
ALTER TABLE showtimes ADD CONSTRAINT unique_showtime UNIQUE (screen_id, show_date, start_time);

--7.5
ALTER TABLE movies ADD CONSTRAINT movies_rating_is CHECK (rating IN ('G', 'PG', 'PG-13', 'R') OR rating IS NULL);

--7.6
INSERT INTO bookings (showtime_id, customer_id, seats_booked, status) VALUES (1, 1, 13, 'confirmed');

INSERT INTO bookings (showtime_id, customer_id, seats_booked, status) VALUES (2, 2, 5, 'pending');

INSERT INTO showtimes (movie_id, screen_id, show_date, start_time, ticket_price) VALUES (1, 1, '2023-01-01', '2023-01-01 10:00:00', -5.00);

INSERT INTO showtimes (movie_id, screen_id, show_date, start_time, ticket_price) VALUES (1, 1, '2023-01-01', '2023-01-01 10:00:00', 5.00),
(1, 1, '2023-01-01', '2023-01-01 10:00:00', 7.00);

INSERT INTO movies (title, genre, rating, duration_minutes, release_year) VALUES ('Movie A', 'Action', 'PG-15', 120, 2023);