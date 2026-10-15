--4.1
SELECT customers.full_name, movies.title, showtimes.show_date, showtimes.start_time, bookings.seats_booked, bookings.status from customers INNER JOIN bookings ON customers.customer_id = bookings.customer_id INNER JOIN showtimes ON bookings.showtime_id = showtimes.showtime_id INNER JOIN movies ON showtimes.movie_id = movies.movie_id ORDER BY bookings.booked_at;

--4.2
SELECT customers.full_name FROM customers INNER JOIN bookings ON customers.customer_id = bookings.customer_id WHERE bookings.booking_id IS NULL;

--4.3
SELECT showtimes.showtime_id, movies.title , bookings.show_date FROM showtimes LEFT JOIN bookings ON showtimes.showtime_id = bookings.showtime_id LEFT JOIN movies ON showtimes.movie_id = movies.movie_id GROUP BY showtimes.showtime_id, movies.title HAVING count(bookings.booking_id) = 0;

--4.4
SELECT 
    CASE 
        WHEN customers.email IS NOT NULL AND promo_signups.email IS NULL THEN 'customer only'
        WHEN customers.email IS NULL AND promo_signups.email IS NOT NULL THEN 'promo only'
        WHEN customers.email IS NOT NULL AND promo_signups.email IS NOT NULL THEN 'both'
        ELSE 'Unknown'
    END AS segment,
    COUNT(*) AS total_count
FROM customers 
FULL OUTER JOIN promo_signups ON customers.email = promo_signups.email
GROUP BY 
    CASE 
        WHEN customers.email IS NOT NULL AND promo_signups.email IS NULL THEN 'customer only'
        WHEN customers.email IS NULL AND promo_signups.email IS NOT NULL THEN 'promo only'
        WHEN customers.email IS NOT NULL AND promo_signups.email IS NOT NULL THEN 'both'
        ELSE 'Unknown'
    END;
