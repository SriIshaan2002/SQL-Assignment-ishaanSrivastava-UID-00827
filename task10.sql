--10.1
BEGIN;
INSERT INTO bookings (customer_id, showtime_id, seats_booked)
SELECT customer_id, 13, 2
FROM customers
WHERE full_name = 'Elena Petrova';
UPDATE customers
SET loyalty_points = COALESCE(loyalty_points, 0) + 10
WHERE full_name = 'Elena Petrova';
COMMIT;

--10.2
BEGIN;
DELETE FROM bookings;
SELECT COUNT(*) AS total_bookings_during_transaction FROM bookings;
ROLLBACK;

--10.3
BEGIN;
INSERT INTO bookings (customer_id, showtime_id, seats_booked)
SELECT customer_id, 13, 2
FROM customers
WHERE full_name = 'Elena Petrova';
SAVEPOINT after_booking_insert;
UPDATE bookings
SET status = 'oops'
WHERE showtime_id = 13 
  AND customer_id = (SELECT customer_id FROM customers WHERE full_name = 'Elena Petrova');
ROLLBACK TO SAVEPOINT after_booking_insert;
COMMIT;
SELECT b.booking_id, c.full_name, b.showtime_id, b.seats_booked
FROM bookings b
INNER JOIN customers c ON b.customer_id = c.customer_id
WHERE c.full_name = 'Elena Petrova' AND b.showtime_id = 13;
