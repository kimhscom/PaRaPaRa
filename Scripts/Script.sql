
					
DELETE FROM STOCK WHERE STORE_CODE = 'SEOUL01_06';
DELETE FROM TIMESHEET;
DELETE FROM STOCK WHERE STORE_CODE = 'SEOUL01_06';


INSERT INTO PARA.ITEM (ITEM_SEQ, ITEM_NAME, ITEM_PRICE)
VALUES(98, '강냉이', 100000);


SELECT STOCK_SEQ, STORE_CODE, NVL(S.STOCK_NAME, I.ITEM_NAME) AS STOCK_NAME, ITEM_NAME, NVL(S.STOCK_QTY,0) AS STOCK_QTY
			FROM (SELECT * FROM STOCK SS WHERE SS.STORE_CODE = 'SEOUL01_06') S FULL JOIN ITEM I
    	  		ON S.STOCK_NAME = I.ITEM_NAME
					ORDER BY S.STORE_CODE, S.STOCK_NAME