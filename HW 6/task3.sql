-- 1
SELECT DISTINCT S.first_name, S.surname
FROM restBill B
JOIN restStaff S ON B.waiter_no = S.staff_no
WHERE B.cust_name = 'Tanya Singh';
-- 2
SELECT room_date
FROM restRoom_management RM
JOIN restStaff S ON RM.headwaiter = S.staff_no
WHERE S.first_name = 'Charles' AND RM.room_name = 'Green' AND room_date BETWEEN 160201 AND 160229;
-- 3
SELECT DISTINCT S.first_name, S.surname
FROM restStaff S
WHERE S.headwaiter = (SELECT headwaiter FROM restStaff WHERE first_name = 'Zoe' AND surname = 'Ball');
-- 4
SELECT B.cust_name, B.bill_total, CONCAT(S.first_name, ' ', S.surname) AS waiter_name
FROM restBill B
JOIN restStaff S ON B.waiter_no = S.staff_no
ORDER BY B.bill_total DESC;
-- 5
SELECT DISTINCT S.first_name, S.surname
FROM restStaff S
WHERE S.staff_no IN (
    SELECT DISTINCT waiter_no
    FROM restBill
    WHERE bill_no IN (00014, 00017)
);
-- 6
SELECT DISTINCT S.first_name, S.surname
FROM restStaff S
WHERE S.staff_no IN (
    SELECT waiter_no
    FROM restBill B
    JOIN restRest_table RT ON B.table_no = RT.table_no
    WHERE RT.room_name = 'Blue' AND B.bill_date = 160312
)
OR S.staff_no = (
    SELECT headwaiter
    FROM restRoom_management
    WHERE room_name = 'Blue' AND room_date = 160312
);
