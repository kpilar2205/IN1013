-- 1
SELECT S.first_name, S.surname, B.bill_date, COUNT(*) AS bill_count
FROM restBill B
JOIN restStaff S ON B.waiter_no = S.staff_no
GROUP BY B.waiter_no, B.bill_date
HAVING COUNT(*) >= 2;
-- 2
SELECT RT.room_name, COUNT(*) AS large_table_count
FROM restRest_table RT
WHERE RT.no_of_seats > 6
GROUP BY RT.room_name;
-- 3
SELECT RT.room_name, SUM(B.bill_total) AS total_bill_amount
FROM restBill B
JOIN restRest_table RT ON B.table_no = RT.table_no
GROUP BY RT.room_name;
-- 4
SELECT H.first_name, H.surname, SUM(B.bill_total) AS total_bill_amount
FROM restBill B
JOIN restStaff W ON B.waiter_no = W.staff_no
JOIN restStaff H ON W.headwaiter = H.staff_no
GROUP BY H.staff_no
ORDER BY total_bill_amount DESC;
-- 5
SELECT B.cust_name, AVG(B.bill_total) AS avg_spent
FROM restBill B
GROUP BY B.cust_name
HAVING AVG(B.bill_total) > 400;
-- 6
SELECT S.first_name, S.surname, B.bill_date, COUNT(*) AS bill_count
FROM restBill B
JOIN restStaff S ON B.waiter_no = S.staff_no
GROUP BY B.waiter_no, B.bill_date
HAVING COUNT(*) >= 3;
