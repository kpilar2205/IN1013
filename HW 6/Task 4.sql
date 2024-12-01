-- 1
SELECT DISTINCT B.cust_name
FROM restBill B
WHERE B.bill_total > 450.00
AND EXISTS (
    SELECT 1
    FROM restRoom_management RM
    JOIN restStaff S ON RM.headwaiter = S.staff_no
    WHERE S.first_name = 'Charles'
    AND RM.room_name = (
        SELECT RT.room_name
        FROM restRest_table RT
        WHERE RT.table_no = B.table_no
    )
    AND RM.room_date = B.bill_date
);
-- 2
SELECT S.first_name, S.surname
FROM restRoom_management RM
JOIN restStaff S ON RM.headwaiter = S.staff_no
WHERE RM.room_date = 160111
AND RM.room_name = (
    SELECT RT.room_name
    FROM restRest_table RT
    WHERE RT.table_no = (
        SELECT B.table_no
        FROM restBill B
        WHERE B.cust_name = 'Nerida' AND B.bill_date = 160111
    )
);
-- 3
SELECT DISTINCT B.cust_name
FROM restBill B
WHERE B.bill_total = (SELECT MIN(bill_total) FROM restBill);
-- 4
SELECT S.first_name, S.surname
FROM restStaff S
WHERE S.staff_no NOT IN (SELECT DISTINCT B.waiter_no FROM restBill B);
-- 5
SELECT B.cust_name, H.first_name AS headwaiter_first_name, H.surname AS headwaiter_surname, RT.room_name
FROM restBill B
JOIN restRest_table RT ON B.table_no = RT.table_no
JOIN restRoom_management RM ON RT.room_name = RM.room_name AND B.bill_date = RM.room_date
JOIN restStaff H ON RM.headwaiter = H.staff_no
WHERE B.bill_total = (SELECT MAX(bill_total) FROM restBill);
