-- Question 1
CREATE OR REPLACE VIEW samsBills AS
SELECT 
    restStaff.first_name, 
    restStaff.surname, 
    restBill.bill_date, 
    restBill.cust_name, 
    restBill.bill_total
FROM restBill
JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
WHERE restStaff.first_name = 'Sam' AND restStaff.surname = 'Pitt';

-- Question 2
SELECT * 
FROM samsBills 
WHERE bill_total > 400;

-- Question 3
CREATE OR REPLACE VIEW roomTotals AS
SELECT 
    restRest_table.room_name, 
    SUM(restBill.bill_total) AS total_sum
FROM restBill
JOIN restRest_table ON restBill.table_no = restRest_table.table_no
GROUP BY restRest_table.room_name;

-- Question 4
CREATE OR REPLACE VIEW teamTotals AS
SELECT 
    CONCAT(h.first_name, ' ', h.surname) AS headwaiter_name, 
    SUM(b.bill_total) AS total_sum
FROM restBill b
JOIN restStaff w ON b.waiter_no = w.staff_no
JOIN restStaff h ON w.headwaiter = h.staff_no
GROUP BY h.first_name, h.surname;