##Task 3
##3.1
        title        | rating | duration_minutes 
---------------------+--------+------------------
 Midnight at Marlowe | R      |              108
 Static              | R      |              101
 Hollow Peak         | R      |               97
(3 rows)
##3.2
       title       | duration_minutes 
-------------------+------------------
 Hollow Peak       |               97
 Robo-Rascals 2    |               89
 The Marlowe Reel  |               88
 The Comet Kids    |               95
(4 rows)

##3.3
 show_date  | start_time | ticket_price 
------------+------------+--------------
 2026-08-14 | 20:30:00   |        16.00
 2026-08-11 | 20:00:00   |        13.00
 2026-08-13 | 19:00:00   |        12.50
 2026-08-10 | 19:00:00   |        12.50
 2026-08-15 | 20:00:00   |        12.00
(5 rows)
##3.4
   full_name   | loyalty_points 
---------------+----------------
 Farhan Ali    |             60
 Grace Kim     |             95
 Kira Sato     |            150
 Elena Petrova |            225
(4 rows)
##3.5
 movie_id |       title        |    genre    | rating | duration_minutes | release_year 
----------+--------------------+-------------+--------+------------------+--------------
        1 | The Last Ledger    | Drama       | PG-13  |              124 |         2024
        9 | The Sunday Painter | Drama       | PG     |              105 |         2026
       11 | The Marlowe Reel   | Documentary | PG     |               88 |         2026
        5 | The Comet Kids     | Family      | G      |               95 |         2024
(4 rows)
##3.6
 booking_id | customer_id | seats_booked 
------------+-------------+--------------
          8 |           7 |            2
         19 |          10 |            2
(2 rows)
##Task5
##5.1
        title        | total_revenue 
---------------------+---------------
 The Marlowe Reel    |              
 The Last Ledger     |        162.50
 Quantum Alley       |        155.00
 Robo-Rascals 2      |        114.00
 Midnight at Marlowe |        103.00
 Hollow Peak         |         90.00
 The Comet Kids      |         85.50
 Static              |         79.50
 The Sunday Painter  |         31.50
 Garden of Glass     |         21.00
 Paper Moon Rising   |          9.50
(11 rows)
##5.2
    genre    | total_seats_booked 
-------------+--------------------
 Documentary |                   
 Family      |                 21
 Drama       |                 17
 Thriller    |                 16
 Sci-Fi      |                 11
 Horror      |                  9
 Romance     |                  2
(7 rows)
##5.3
 screen_name | average_ticket_price 
-------------+----------------------
 The Loft    |  10.8000000000000000
 The Grand   |  11.3125000000000000
 The Vault   |  10.5000000000000000
(3 rows)
##5.4
  genre   
----------
 Thriller
 Family
 Drama
 Sci-Fi
(4 rows)
##5.5
 showtime_id |        title        | screen_name | capacity | total_seats_booked | occupancy_rate 
-------------+---------------------+-------------+----------+--------------------+----------------
          14 | Garden of Glass     | The Vault   |       40 |                    |               
          19 | The Marlowe Reel    | The Grand   |      120 |                    |               
           9 | Hollow Peak         | The Vault   |       40 |                  5 |             12
           2 | Midnight at Marlowe | The Vault   |       40 |                  5 |             12
          17 | Hollow Peak         | The Vault   |       40 |                  4 |             10
          12 | Robo-Rascals 2      | The Grand   |      120 |                 12 |             10
          15 | Static              | The Loft    |       60 |                  5 |              8
          13 | Midnight at Marlowe | The Loft    |       60 |                  4 |              6
           1 | The Last Ledger     | The Grand   |      120 |                  7 |              5
           4 | Quantum Alley       | The Grand   |      120 |                  7 |              5
           7 | Static              | The Vault   |       40 |                  2 |              5
           3 | The Comet Kids      | The Grand   |      120 |                  7 |              5
           8 | The Last Ledger     | The Grand   |      120 |                  6 |              5
          10 | The Sunday Painter  | The Loft    |       60 |                  3 |              5
          11 | Quantum Alley       | The Grand   |      120 |                  4 |              3
           5 | Garden of Glass     | The Loft    |       60 |                  2 |              3
           6 | Paper Moon Rising   | The Loft    |       60 |                  1 |              1
          16 | The Comet Kids      | The Grand   |      120 |                  2 |              1
(18 rows)
##Task7
##7.6
ERROR:  new row for relation "bookings" violates check constraint "seats_booked_positive"
DETAIL:  Failing row contains (34, 1, 1, 13, 2026-10-15 22:11:48.236902, confirmed, null).


ERROR:  new row for relation "bookings" violates check constraint "bookings_status_check"
DETAIL:  Failing row contains (35, 2, 2, 5, 2026-10-15 22:12:38.677611, pending, null).


ERROR:  new row for relation "showtimes" violates check constraint "ticket_price_positive"
DETAIL:  Failing row contains (20, 1, 1, 2023-01-01, -5.00, 10:00:00).


ERROR:  duplicate key value violates unique constraint "unique_showtime"
DETAIL:  Key (screen_id, show_date, start_time)=(1, 2023-01-01, 10:00:00) already exists.

##Task8
##8.2
 customer_email 
----------------
(0 rows)
##8.3
 individual_seat 
-----------------
 F5
 D1
 F3
 C3
 F4
 A2
 C2
 E2
 B5
 F1
 A3
 F6
 A1
 B4
 E1
 F2
(16 rows)
##Task10
##10.1
BEGIN
INSERT 0 1
UPDATE 1
COMMIT
##10.2
BEGIN
DELETE 33
 total_bookings_during_transaction 
-----------------------------------
                                 0
(1 row)

ROLLBACK
##10.3
BEGIN
INSERT 0 1
SAVEPOINT
ERROR:  new row for relation "bookings" violates check constraint "bookings_status_check"
DETAIL:  Failing row contains (36, 13, 5, 2, 2026-10-15 22:26:28.143713, oops, null).
ROLLBACK
COMMIT
 booking_id |   full_name   | showtime_id | seats_booked 
------------+---------------+-------------+--------------
         36 | Elena Petrova |          13 |            2
         37 | Elena Petrova |          13 |            2
(2 rows)
##10.4
Atomicity:booking transaction either completed all steps successfully or rolled back, if any step failed in the process.
Consistency: Task 7 constraints ensured that the database remained valid, such as preventing invalid ticket prices, duplicate bookings, or bookings for nonexistent shows.
Isolation:when more than one process trying to perform something on same roe, isolation would prevent concurrent transactions from booking the same seat.
Durability: After COMMIT, the confirmed booking remains permanently saved in the database, even if the system crashes.