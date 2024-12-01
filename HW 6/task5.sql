SELECT s.first_name, s.surname, b.bill_date, COUNT(b.bill_no) AS num_bills
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.first_name, s.surname, b.bill_date
HAVING COUNT(b.bill_no) >= 2;

SELECT rt.room_name, COUNT(rt.table_no) AS num_large_tables
FROM restRest_table rt
WHERE rt.no_of_seats > 6
GROUP BY rt.room_name;

SELECT rm.room_name, SUM(b.bill_total) AS total_bills
FROM restBill b
JOIN restRest_table rt ON b.table_no = rt.table_no
JOIN restRoom_management rm ON rt.room_name = rm.room_name AND b.bill_date = rm.room_date
GROUP BY rm.room_name;

SELECT h.first_name, h.surname, SUM(b.bill_total) AS total_bill_amount
FROM restBill b
JOIN restStaff w ON b.waiter_no = w.staff_no
JOIN restStaff h ON w.headwaiter = h.staff_no
GROUP BY h.first_name, h.surname
ORDER BY total_bill_amount DESC;

SELECT b.cust_name, AVG(b.bill_total) AS avg_spent
FROM restBill b
GROUP BY b.cust_name
HAVING AVG(b.bill_total) > 400;

SELECT s.first_name, s.surname, b.bill_date, COUNT(b.bill_no) AS num_bills
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.first_name, s.surname, b.bill_date
HAVING COUNT(b.bill_no) >= 3;
