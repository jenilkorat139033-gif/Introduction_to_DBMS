--------------------------------------------------
-- 1. Add 15 days to current date
--------------------------------------------------
SELECT SYSDATE + 15 AS new_date FROM DUAL;

--------------------------------------------------
-- 2. Add and subtract 5 months from current date
--------------------------------------------------
SELECT 
    ADD_MONTHS(SYSDATE, 5) AS add_5_months,
    ADD_MONTHS(SYSDATE, -5) AS sub_5_months
FROM DUAL;

--------------------------------------------------
-- 3. ASCII value of 'M'
--------------------------------------------------
SELECT ASCII('M') AS ascii_value FROM DUAL;

--------------------------------------------------
-- 4. Character from ASCII 67, 65, 84
--------------------------------------------------
SELECT 
    CHR(67) AS char1,
    CHR(65) AS char2,
    CHR(84) AS char3
FROM DUAL;

--------------------------------------------------
-- 5. Last day of current month
--------------------------------------------------
SELECT LAST_DAY(SYSDATE) AS last_day FROM DUAL;

--------------------------------------------------
-- 6. Date difference (today - 20/05/2015)
--------------------------------------------------
SELECT SYSDATE - TO_DATE('20-05-2015','DD-MM-YYYY') 
AS date_difference 
FROM DUAL;

--------------------------------------------------
-- 7. Months between today and 03/03/2016
--------------------------------------------------
SELECT MONTHS_BETWEEN(SYSDATE, 
TO_DATE('03-03-2016','DD-MM-YYYY')) 
AS months_diff 
FROM DUAL;

--------------------------------------------------
-- 8. Second occurrence of 'or' from 3rd position
--------------------------------------------------
SELECT INSTR('corporate floor','or',3,2) 
AS position 
FROM DUAL;

--------------------------------------------------
-- 9. Capitalize first letter of each word
--------------------------------------------------
SELECT INITCAP('marwadi university') 
AS formatted_text 
FROM DUAL;

--------------------------------------------------
-- 10. Current user name and user id
--------------------------------------------------
SELECT USER AS username,
       USERENV('SESSIONID') AS user_id
FROM DUAL;
