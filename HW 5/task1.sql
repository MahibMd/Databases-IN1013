SELECT bill_date, bill_total
FROM restBill
WHERE cust_name = "Bob Crow";

SELECT DISTINCT cust_name
FROM restBill
WHERE cust_name LIKE "%Smith"
ORDER BY cust_name DESC;
    
SELECT DISTINCT cust_name
FROM restBill 
WHERE cust_name LIKE "% C%";
    
SELECT first_name, surname
FROM restStaff
WHERE staff_no IN (005,006,010);

SELECT *
FROM restBill
WHERE bill_date LIKE "1602__";
    
SELECT bill_date
FROM restBill
WHERE bill_total > 0 AND bill_date LIKE "15____";
