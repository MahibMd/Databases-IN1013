CREATE VIEW samsBills AS
SELECT waiters.first_name, waiters.surname, bills.bill_date, bills.cust_name, bills.bill_total
FROM bills
JOIN waiters ON bills.waiter_id = waiters.waiter_id
WHERE waiters.first_name = 'Sam' AND waiters.surname = 'Pitt';

SELECT first_name, surname, bill_date, cust_name, bill_total
FROM samsBills
WHERE bill_total > 400;

CREATE VIEW roomTotals AS
SELECT rooms.room_name, SUM(bills.bill_total) AS total_sum
FROM bills
JOIN rooms ON bills.room_id = rooms.room_id
GROUP BY rooms.room_name;

CREATE VIEW teamTotals AS
SELECT CONCAT(waiters.first_name, ' ', waiters.surname) AS headwaiter_name, SUM(bills.bill_total) AS total_sum
FROM bills
JOIN waiters ON bills.waiter_id = waiters.waiter_id
GROUP BY headwaiter_name;
