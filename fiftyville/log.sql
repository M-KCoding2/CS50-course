-- Keep a log of any SQL queries you execute as you solve the mystery.
SELECT * FROM crime_scene_reports WHERE street = 'Humphrey Street' AND month = 7 AND day = 28;
SELECT * FROM interviews WHERE year = 2021 AND month = 7 AND day = 28;
-- Accomplice had german accent, now get security footage from bakery and look at ATM transactions also accomplice flight: check Paris , Germany, Bohemia
SELECT * FROM bakery_security_logs WHERE month = 7 AND day = 28 AND hour = 10;

-- License_plate
SELECT phone_number FROM people WHERE license_plate = 'R3G7486' OR license_plate = '13FNH73' OR license_plate = '5P2BI95' OR license_plate = '94KL13X' OR license_plate = '6P58WS2' OR license_plate = '4328GD8' OR license_plate = 'G412CB7' OR license_plate = 'L93JTIZ' OR license_plate = '322W7JE' OR license_plate = '0NTHK55' OR license_plate = '1106N58';

--+--------+---------+----------------+-----------------+---------------+
--|   id   |  name   |  phone_number  | passport_number | license_plate |
--+--------+---------+----------------+-----------------+---------------+
--| 221103 | Vanessa | (725) 555-4692 | 2963008352      | 5P2BI95       |
--| 243696 | Barry   | (301) 555-4174 | 7526138472      | 6P58WS2       |
--| 325548 | Brandon | (771) 555-6667 | 7874488539      | R3G7486       |
--| 396669 | Iman    | (829) 555-5269 | 7049073643      | L93JTIZ       |
--| 398010 | Sofia   | (130) 555-0289 | 1695452385      | G412CB7       |
--| 449774 | Taylor  | (286) 555-6063 | 1988161715      | 1106N58       |
--| 467400 | Luca    | (389) 555-5198 | 8496433585      | 4328GD8       |
--| 514354 | Diana   | (770) 555-1861 | 3592750733      | 322W7JE       |
--| 560886 | Kelsey  | (499) 555-9472 | 8294398571      | 0NTHK55       |
--| 686048 | Bruce   | (367) 555-5533 | 5773159633      | 94KL13X       |
--| 745650 | Sophia  | (027) 555-1068 | 3642612721      | 13FNH73       |
--+--------+---------+----------------+-----------------+---------------+

-- ATM transactions
SELECT * FROM atm_transactions WHERE month = 7 AND day = 28 AND year = 2021 AND atm_location = 'Leggett Street';
--+-----+----------------+------+-------+-----+----------------+------------------+--------+
--| id  | account_number | year | month | day |  atm_location  | transaction_type | amount |
--+-----+----------------+------+-------+-----+----------------+------------------+--------+
--| 246 | 28500762       | 2021 | 7     | 28  | Leggett Street | withdraw         | 48     |
--| 264 | 28296815       | 2021 | 7     | 28  | Leggett Street | withdraw         | 20     |
--| 266 | 76054385       | 2021 | 7     | 28  | Leggett Street | withdraw         | 60     |
--| 267 | 49610011       | 2021 | 7     | 28  | Leggett Street | withdraw         | 50     |
--| 269 | 16153065       | 2021 | 7     | 28  | Leggett Street | withdraw         | 80     |
--| 275 | 86363979       | 2021 | 7     | 28  | Leggett Street | deposit          | 10     |
--| 288 | 25506511       | 2021 | 7     | 28  | Leggett Street | withdraw         | 20     |
--| 313 | 81061156       | 2021 | 7     | 28  | Leggett Street | withdraw         | 30     |
--| 336 | 26013199       | 2021 | 7     | 28  | Leggett Street | withdraw         | 35     |
--+-----+----------------+------+-------+-----+----------------+------------------+--------+

--bank accounts
SELECT name, atm_transactions.account_number FROM bank_accounts,people,atm_transactions WHERE bank_accounts.person_id = people.id AND atm_transactions.account_number = bank_accounts.account_number AND month = 7 AND day = 28 AND year = 2021 AND atm_location = 'Leggett Street' AND transaction_type = 'withdraw';
--+---------+----------------+
--|  name   | account_number |
--+---------+----------------+
--| Bruce   | 49610011       |
--| Diana   | 26013199       |
--| Brooke  | 16153065       |--not common
--| Kenny   | 28296815       |--not common
--| Iman    | 25506511       |
--| Luca    | 28500762       |
--| Taylor  | 76054385       |
--| Benista | 81061156       |--not common
--+---------+----------------+

--theif suspects : Bruce, Diana, Iman, Luca, Taylor
SELECT * FROM people WHERE name = 'Bruce' OR name = 'Diana' OR name = 'Iman' OR name = 'Luca' OR name = 'Taylor';

--+--------+--------+----------------+-----------------+---------------+
--|   id   |  name  |  phone_number  | passport_number | license_plate |
--+--------+--------+----------------+-----------------+---------------+
--| 396669 | Iman   | (829) 555-5269 | 7049073643      | L93JTIZ       |
--| 449774 | Taylor | (286) 555-6063 | 1988161715      | 1106N58       |
--| 467400 | Luca   | (389) 555-5198 | 8496433585      | 4328GD8       |
--| 514354 | Diana  | (770) 555-1861 | 3592750733      | 322W7JE       |
--| 686048 | Bruce  | (367) 555-5533 | 5773159633      | 94KL13X       |
--+--------+--------+----------------+-----------------+---------------+

--PHONE NUMBERS
SELECT name, receiver FROM phone_calls,people WHERE month = 7 AND day = 28 AND year = 2021 AND people.phone_number = phone_calls.caller AND people.name = 'Bruce' OR people.name = 'Diana' OR people.name = 'Iman' OR people.name = 'Luca' OR people.name = 'Taylor';

SELECT caller FROM phone_calls WHERE year = 2021 AND month = 7 AND day = 28 AND caller = '(829) 555-5269' OR caller = '(286) 555-6063' OR caller = '(389) 555-5198' OR caller = '(770) 555-1861' OR caller = '(367) 555-5533';
SELECT count(caller) FROM phone_calls WHERE year = 2021 AND month = 7 AND day = 28 AND caller = '(829) 555-5269' ; -- 0
SELECT count(caller) FROM phone_calls WHERE year = 2021 AND month = 7 AND day = 28 AND caller = '(286) 555-6063' ; -- 2
SELECT count(caller) FROM phone_calls WHERE year = 2021 AND month = 7 AND day = 28 AND caller = '(389) 555-5198' ; -- 0
SELECT count(caller) FROM phone_calls WHERE year = 2021 AND month = 7 AND day = 28 AND caller = '(770) 555-1861' ; -- 1
SELECT count(caller) FROM phone_calls WHERE year = 2021 AND month = 7 AND day = 28 AND caller = '(367) 555-5533' ; -- 4
--+--------+--------+----------------+-----------------+---------------+
--|   id   |  name  |  phone_number  | passport_number | license_plate |
--+--------+--------+----------------+-----------------+---------------+
--| 396669 | Iman   | (829) 555-5269 | 7049073643      | L93JTIZ       |--no longer suspect
--| 449774 | Taylor | (286) 555-6063 | 1988161715      | 1106N58       |
--| 467400 | Luca   | (389) 555-5198 | 8496433585      | 4328GD8       |--no longer suspect
--| 514354 | Diana  | (770) 555-1861 | 3592750733      | 322W7JE       |
--| 686048 | Bruce  | (367) 555-5533 | 5773159633      | 94KL13X       |
--+--------+--------+----------------+-----------------+---------------+

-- Remaining suspects: Taylor, Diana, Bruce

--Flights: earliest flight on the 29th
SELECT * FROM flights WHERE year = 2021 AND month = 7 AND day =  29;
--+----+-------------------+------------------------+------+-------+-----+------+--------+
--| id | origin_airport_id | destination_airport_id | year | month | day | hour | minute |
--+----+-------------------+------------------------+------+-------+-----+------+--------+
--| 18 | 8                 | 6                      | 2021 | 7     | 29  | 16   | 0      |
--| 23 | 8                 | 11                     | 2021 | 7     | 29  | 12   | 15     |
--| 36 | 8                 | 4                      | 2021 | 7     | 29  | 8    | 20     |<-- THIS IS THE FLIGHT TAKEN
--| 43 | 8                 | 1                      | 2021 | 7     | 29  | 9    | 30     |
--| 53 | 8                 | 9                      | 2021 | 7     | 29  | 15   | 20     |
--+----+-------------------+------------------------+------+-------+-----+------+--------+
--airports
SELECT * FROM airports WHERE id = 4;
--+----+--------------+-------------------+---------------+
--| id | abbreviation |     full_name     |     city      |
--+----+--------------+-------------------+---------------+
--| 4  | LGA          | LaGuardia Airport | New York City |
--+----+--------------+-------------------+---------------+
--city = New York City
-- passengers
SELECT * FROM passengers WHERE flight_id = 36; --Only common passport_number is Bruce's
-- Theif = Bruce
-- Bruce INFO:
--+--------+--------+----------------+-----------------+---------------+
--|   id   |  name  |  phone_number  | passport_number | license_plate |
--+--------+--------+----------------+-----------------+---------------+
--| 686048 | Bruce  | (367) 555-5533 | 5773159633      | 94KL13X       |
--+--------+--------+----------------+-----------------+---------------+

--+---------+----------------+
--|  name   | account_number |
--+---------+----------------+
--| Bruce   | 49610011       |
--+---------+----------------+
SELECT * FROM phone_calls WHERE year = 2021 AND month = 7 AND day =  28 AND caller = '(367) 555-5533';
--+-----+----------------+----------------+------+-------+-----+----------+
--| id  |     caller     |    receiver    | year | month | day | duration |
--+-----+----------------+----------------+------+-------+-----+----------+
--| 233 | (367) 555-5533 | (375) 555-8161 | 2021 | 7     | 28  | 45       |-- less than 60
--| 236 | (367) 555-5533 | (344) 555-9601 | 2021 | 7     | 28  | 120      |
--| 245 | (367) 555-5533 | (022) 555-4052 | 2021 | 7     | 28  | 241      |
--| 285 | (367) 555-5533 | (704) 555-5790 | 2021 | 7     | 28  | 75       |
--+-----+----------------+----------------+------+-------+-----+----------+
SELECT * FROM people WHERE phone_number = '(375) 555-8161';
--+--------+-------+----------------+-----------------+---------------+
--|   id   | name  |  phone_number  | passport_number | license_plate |
--+--------+-------+----------------+-----------------+---------------+
--| 864400 | Robin | (375) 555-8161 |                 | 4V16VO0       | -- Robin is the accomplice
--+--------+-------+----------------+-----------------+---------------+
--Accomplice = Robin
