/* select 3 */
/* ���� ��ȯ �Լ� 
    TO_CHAR : ��¥, �������� ���������� ��ȯ 
    TO_DATE : �������� ��¥������ ��ȯ 
    TO_NUMBER : �������� ���ڷ� ��ȯ 
*/ 

-- TO_CHAR (date, 'YYYYMMDD') : ��¥������ 'YYYYMMDD' �������� �̾ƿͼ� char Ÿ������ ��ȯ 

select TO_CHAR (sysdate, 'YYYYMMDD') 
from dual; 