/* select 3 */
/* 형식 변환 함수 
    TO_CHAR : 날짜, 숫자형을 문자형으로 변환 
    TO_DATE : 문자형을 날짜형으로 변환 
    TO_NUMBER : 문자형을 숫자로 변환 
*/ 

-- TO_CHAR (date, 'YYYYMMDD') : 날짜형식을 'YYYYMMDD' 형식으로 뽑아와서 char 타입으로 변환 

select TO_CHAR (sysdate, 'YYYYMMDD') 
from dual; 