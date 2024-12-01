SELECT DISTINCT s.first_name, s.surname
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
WHERE b.cust_name = 'Tanya Singh';

SELECT rm.room_date
FROM restRoom_management rm
JOIN restStaff s ON rm.headwaiter = s.staff_no
WHERE rm.room_name = 'Green' 
  AND s.first_name = 'Charles'
  AND rm.room_date BETWEEN 160201 AND 160229;

SELECT s.first_name, s.surname
FROM restStaff s
WHERE s.headwaiter = (
    SELECT headwaiter
    FROM restStaff
    WHERE first_name = 'Zoe' AND surname = 'Ball'
);

SELECT b.cust_name, b.bill_total, s.first_name, s.surname
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
ORDER BY b.bill_total DESC;

SELECT DISTINCT s.first_name, s.surname
FROM restBill b1
JOIN restBill b2 ON b1.table_no = b2.table_no
JOIN restStaff s ON b1.waiter_no = s.staff_no
WHERE b2.bill_no IN (00014, 00017);

SELECT DISTINCT s.first_name, s.surname
FROM restRoom_management rm
JOIN restRest_table rt ON rm.room_name = rt.room_name
JOIN restBill b ON b.table_no = rt.table_no
JOIN restStaff s ON b.waiter_no = s.staff_no OR s.staff_no = rm.headwaiter
WHERE rm.room_name = 'Blue' AND rm.room_date = 160312;
