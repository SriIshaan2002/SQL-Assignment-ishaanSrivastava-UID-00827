--1.1
   CREATE TABLE movies (
    movie_id          SERIAL PRIMARY KEY,
    title             TEXT NOT NULL,          -- TODO: a movie must always have a title
    genre             TEXT,          -- e.g. 'Drama', 'Thriller', 'Family'
    rating            TEXT,          -- 'G' | 'PG' | 'PG-13' | 'R'   (leave unchecked for now — Task 7)
    duration_minutes  INT,           -- TODO: when present, must be greater than 0
    release_year      INT            -- optional (Frank's ledger doesn't have it)
    );

--1.2
    CREATE TABLE screens (
     screen_id          SERIAL PRIMARY KEY,
     screen_name        TEXT NOT NULL UNIQUE, 
     capacity           INT CHECK (capacity > 0)
    );


--1.3
    CREATE TABLE showtimes (
     showtime_id        SERIAL PRIMARY KEY,
     movie_id           INT NOT NULL REFERENCES movies(movie_id),
     screen_id          INT NOT NULL REFERENCES screens(screen_id),
     start_time         DATE NOT NULL, 
     end_time           DATE NOT NULL,
     ticket_price       NUMERIC(6,2) NOT NULL
     );

--1.4
    CREATE TABLE bookings (
     booking_id         SERIAL PRIMARY KEY,
     showtime_id        INT NOT NULL REFERENCES showtimes(showtime_id),
     customer_id        INT NOT NULL REFERENCES customers(customer_id),
     seats_booked       INT NOT NULL,
     booked_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
     status             TEXT CHECK (status IN ('confirmed', 'cancelled')) NOT NULL DEFAULT 'confirmed'
     );
