SELECT SUM(bill_total) AS "Income"
FROM restBill;
    
SELECT SUM(bill_total) AS "Feb Income"
FROM restBill
WHERE bill_date LIKE "1602__";
    
SELECT AVG(bill_total)
FROM restBill
WHERE table_no = "002";
    
SELECT 
	MIN(no_of_seats) AS Min,
	MAX(no_of_seats) AS Max,
	AVG(no_of_seats) AS Avg
FROM restRest_table
WHERE room_name = 'Blue';
    
SELECT COUNT(DISTINCT table_no)
FROM restBill
WHERE waiter_no IN (002,004);
