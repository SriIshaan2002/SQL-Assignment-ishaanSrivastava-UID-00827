--9.1
SELECT movies.title, RANK() OVER(ORDER BY SUM(bookings.seats_booked)) AS rank FROM movies LEFT JOIN showtimes ON movies.movie_id = showtimes.movie_id LEFT JOIN bookings ON showtimes.showtime_id = bookings.showtime_id GROUP BY movies.title ORDER BY rank;

--9.2
SELECT 
    movies.genre,
    RANK() OVER(
        PARTITION BY movies.genre 
        ORDER BY SUM(bookings.seats_booked) DESC
    ) AS rank_within_genre
FROM movies 
LEFT JOIN showtimes ON movies.movie_id = showtimes.movie_id 
LEFT JOIN bookings ON showtimes.showtime_id = bookings.showtime_id 
GROUP BY movies.genre, movies.movie_title -- Group by both to see individual movie records
ORDER BY movies.genre, rank_within_genre;

--9.3
SELECT 
    showtimes.show_date, 
    SUM(bookings.seats_booked * showtimes.ticket_price) AS daily_revenue,
    
    SUM(SUM(bookings.seats_booked * showtimes.ticket_price)) OVER (
        ORDER BY showtimes.show_date
    ) AS cumulative_revenue
FROM showtimes 
LEFT JOIN bookings ON showtimes.showtime_id = bookings.showtime_id 
GROUP BY showtimes.show_date 
ORDER BY showtimes.show_date;

--9.4
SELECT 
    show_date,
    ticket_price AS price,
    AVG(ticket_price) OVER (
        PARTITION BY movie_id
    ) AS avg_price_for_movie,
    ticket_price - AVG(ticket_price) OVER (
        PARTITION BY movie_id
    ) AS difference_from_average
FROM showtimes;
