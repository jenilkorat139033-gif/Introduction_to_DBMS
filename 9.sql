--------------------------------------------------
-- 1. Create CUSTOMER table
--------------------------------------------------
CREATE TABLE CUSTOMER (
    CUST_NO NUMBER(4) PRIMARY KEY,
    FIRST_NAME VARCHAR2(20) NOT NULL,
    LAST_NAME VARCHAR2(20),
    ADDRESS VARCHAR2(20),
    CITY VARCHAR2(8),
    STATE VARCHAR2(20),
    PIN NUMBER(6),
    B_DATE DATE,
    STATUS CHAR(1),
    CONSTRAINT chk_status CHECK (STATUS IN ('V','I','A'))
);

--------------------------------------------------
-- 2. Insert data
--------------------------------------------------
INSERT INTO CUSTOMER VALUES (1003,'RAJ','BAHADUR','SHANTI VILLA','UDP','KARNATAKA',576101,TO_DATE('01-AUG-70','DD-MON-YY'),'V');

INSERT INTO CUSTOMER VALUES (1004,'FELIX','SIMON','M-J-56 PJM','GOA','GOA',403002,TO_DATE('12-FEB-71','DD-MON-YY'),'A');

INSERT INTO CUSTOMER VALUES (1005,'RAJAN','KUTTY','A1 TRADERS','KNR','KERALA',670001,TO_DATE('09-JUN-71','DD-MON-YY'),'A');

INSERT INTO CUSTOMER VALUES (1006,'SHILPA','PAI','12/4B','MNG','KARNATAKA',574154,TO_DATE('11-DEC-70','DD-MON-YY'),'I');

INSERT INTO CUSTOMER VALUES (1007,'BOSCO','RAKSHIT','R.K. PLAZA','BNG','KARNATAKA',576201,TO_DATE('01-JAN-71','DD-MON-YY'),'A');

--------------------------------------------------
-- 3. Display all records
--------------------------------------------------
SELECT * FROM CUSTOMER;

--------------------------------------------------
-- 4. Records where state = KARNATAKA
--------------------------------------------------
SELECT * FROM CUSTOMER WHERE STATE='KARNATAKA';

--------------------------------------------------
-- 5. Delete row where PIN = 576201
--------------------------------------------------
DELETE FROM CUSTOMER WHERE PIN=576201;

--------------------------------------------------
-- 6. Update PIN to 476001 where CUST_NO=1004
--------------------------------------------------
UPDATE CUSTOMER SET PIN=476001 WHERE CUST_NO=1004;

--------------------------------------------------
-- 7. Update address and PIN for CUST_NO=1003
--------------------------------------------------
UPDATE CUSTOMER 
SET ADDRESS='KAVI MUDDANNA MARG', PIN=576104 
WHERE CUST_NO=1003;

--------------------------------------------------
-- 8. Delete GOA records and rollback
--------------------------------------------------
DELETE FROM CUSTOMER WHERE STATE='GOA';
ROLLBACK;

--------------------------------------------------
-- 9. INVALID customers (I)
--------------------------------------------------
SELECT * FROM CUSTOMER WHERE STATUS='I';

--------------------------------------------------
-- 10. Unique states
--------------------------------------------------
SELECT DISTINCT STATE FROM CUSTOMER;

--------------------------------------------------
-- 11. Sort by STATE (ascending)
--------------------------------------------------
SELECT * FROM CUSTOMER ORDER BY STATE ASC;

--------------------------------------------------
-- 12. Sort STATE descending
--------------------------------------------------
SELECT STATE FROM CUSTOMER ORDER BY STATE DESC;

--------------------------------------------------
-- 13. Karnataka + Valid (V)
--------------------------------------------------
SELECT * FROM CUSTOMER 
WHERE STATE='KARNATAKA' AND STATUS='V';

--------------------------------------------------
-- 14. Karnataka OR Kerala
--------------------------------------------------
SELECT * FROM CUSTOMER 
WHERE STATE='KARNATAKA' OR STATE='KERALA';

--------------------------------------------------
-- 15. Karnataka/Kerala AND Active (A)
--------------------------------------------------
SELECT * FROM CUSTOMER 
WHERE (STATE='KARNATAKA' OR STATE='KERALA') 
AND STATUS='A';

--------------------------------------------------
-- 16. Karnataka with PIN 576201
--------------------------------------------------
SELECT * FROM CUSTOMER 
WHERE STATE='KARNATAKA' AND PIN=576201;

--------------------------------------------------
-- 17. All except CUST_NO 1005
--------------------------------------------------
SELECT * FROM CUSTOMER 
WHERE CUST_NO <> 1005;

--------------------------------------------------
-- 18. State begins with K
--------------------------------------------------
SELECT * FROM CUSTOMER 
WHERE STATE LIKE 'K%';

--------------------------------------------------
-- 19. Name contains 'RAJ'
--------------------------------------------------
SELECT * FROM CUSTOMER 
WHERE FIRST_NAME LIKE '%RAJ%';

--------------------------------------------------
-- 20. CUST_NO between 1003 and 1005
--------------------------------------------------
SELECT * FROM CUSTOMER 
WHERE CUST_NO BETWEEN 1003 AND 1005;

--------------------------------------------------
-- 21. Date between 10-JAN-71 and 31-DEC-71
--------------------------------------------------
SELECT * FROM CUSTOMER
WHERE B_DATE BETWEEN 
TO_DATE('10-JAN-71','DD-MON-YY') 
AND TO_DATE('31-DEC-71','DD-MON-YY');

--------------------------------------------------
-- 22. City = UDP, MNG, BNG, PGN
--------------------------------------------------
SELECT * FROM CUSTOMER 
WHERE CITY IN ('UDP','MNG','BNG','PGN');

--------------------------------------------------
-- 23. Rename CUSTOMER to CUST
--------------------------------------------------
ALTER TABLE CUSTOMER RENAME TO CUST;

--------------------------------------------------
-- Commit changes
--------------------------------------------------
COMMIT;
