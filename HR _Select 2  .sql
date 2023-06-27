/* Select 2  */ 

/* �Լ� ��� �ϱ� */ 

/* 
  ����Ŭ���� ������ �ִ� �پ��� �⺻ ������ �Լ�
  1. ���� ó�� �Լ�
  2. ���� ó�� �Լ� 
  3. ��¥ ó�� �Լ� 
  4. ��ȯ �Լ� 
  5. �Ϲ� �Լ�  
*/ 

/*
  1. ���� �Լ� :
        UPPER : �빮�ڷ� ��ȯ ���ִ� �Լ� 
        LOWER : �ҹ��ڷ� ��ȯ ���ִ� �Լ� 
        INITCAP : ù�ڸ� �빮�ڷ� ��ȯ���ִ� �Լ� 
*/ 

/*
    dual : ������ ���̺� , ���� �Լ��� ó�� �ϱ� ���� �������� ���� ���̺�, 
*/

select UPPER ('Oracle mania') as �빮��
from dual; 

select LOWER ('Oracle mania') as �ҹ���
from dual; 

select INITCAP('oracle mania') as �ܾ���ù�ڸ��빮��
from dual; 

select ename as "�̸�(����)", LOWER(ename) as �ҹ���, INITCAP(ename) as ù�ڸ��빮��
from employee; 

-- 
select * 
from employee; 

select * 
from employee 
where ename = UPPER('ward'); 

/* 
    ������ ���̸� ó���ϴ� �Լ� 
    LENGTH : ���ڼ��� ��ȯ ( �ѱ��� 1byte)
    LENGTHB : ���ڼ��� ��ȯ (�ѱ��� 3byte)�� ó�� <== UTF-8   
*/
-- ���ڼ��� ���� 
select LENGTH ('Oracle mania') as ���ڼ�
from dual;

-- �ѱ� 1�ڴ� 3byte  ==> 1�ڷ� ��� 
select LENGTH('����Ŭ �ŴϾ�') as ���ڼ� 
from dual ;

select LENGTHB('Oracle mania') as ���ڼ� 
from dual; 

-- LENGTHB : �ѱ� 1�ڸ� 3byte �� ó�� 
select LENGTHB('����Ŭ �ŴϾ�') as ���ڼ� 
from dual ;

/*
    char(6) : ���� : 6��, �ѱ� : 2��      <== ������ �ڸ����� ������ ���     : �ֹι�ȣ (13) , ������ ��й�ȣ 
    varchar2(6) : ���� : 6��, �ѱ� : 2��  <== ������ �ڸ����� �˼� ���� ���   : �ּ�, ���� 
    
    nchar(6) : �����ڵ� (3byte) 6�ڸ� �Է� : �ѱ�, �Ϻ���, �߱��� , �ƽ�Ű�ڵ� ���� 6�� 
    nvarchar2(6) :  �����ڵ� (3byte) 6�ڸ� �Է� : �ѱ�, �Ϻ���, �߱��� , �ƽ�Ű�ڵ� ���� 6�� 
    
*/


-- Test01 ���̺� ���� 
CREATE TABLE test01 (
    name1 char(6) not null , 
    name2 varchar2(6) null, 
    name3 nchar(6) null, 
    name4 nvarchar2(6) null
    ); 
    
drop table test01; 

desc test01; 

-- test01 ���̺� ���ֱ� 
-- name1 : char(6) , name2 varchar2(6) : ���� 6�� , �ѱ� 2�� 
-- name3 : nchar(6), name4 nvarchar2(6) : ���� 6��, �ѱ� 6�� 
select LENGTH ('abcdefghijklmnopqr') from dual; 

insert into test01 ( name1, name2, name3, name4 ) 
values ('abcdef', 'hijklm', 'abcde6', '����Ŭ�ŴϾ�');

insert into test01 ( name1, name2, name3, name4 ) 
values ('abcdef', 'hijklm', 'abcde6', 'abcdefg');

insert into test01 (name1, name2) 
values ('������', '������') ; 

select * from test01; 

-- ���� ���̺��� ���ڼ��� �о���� 
select * from employee; 

select ename , length(ename) as �̸��Ǳ��ڼ� 
from employee; 

/*
    CONCAT : ���ڿ��� ���� �����ִ� �Լ� 
    SUBSTR : ���ڸ� �߶󳻴� �Լ� , �ѱ� 1�ڸ� 1byte�� ó����. 
    SUBSTRB: ���ڸ� �߶󳻴� �Լ�,  �ѱ� 1�ڸ� 3byte�� ó����. 
    INSTR : Ư�� ������ ��ġ���� ��ȯ ( �ѱ� 1byte) 
    INSTRB : Ư�� ������ ��ġ���� ��ȯ ( �ѱ� 3byte)
    LPAD : ���� �ڸ����� �Է¹ް� �������� Ư����ȣ�� ä�� (����)
    RPAD : ���� �ڸ����� �Է¹ް� �������� Ư����ȣ�� ä�� (������)
*/ 

select 'Oracle', 'mania' ,
        concat ('Oracle', ' mania')
from dual ; 

select * from employee; 

select ename, job, concat(ename, job) as �÷����� from employee; 

-- substr : ���ڿ��� �߶���� �Լ� : substr(�÷�, 4,3 ) --- �÷��� 4��° �ڸ����� 3�ڸ� �߶�ͼ� ��� 
select substr('Oracle mania', 4,3)  
from dual; 

select substr('����Ŭ �ŴϾ�', 5,3)
from dual; 

select substrb('Oracle mania', 4,3)  
from dual; 

select substrb('����Ŭ �ŴϾ�', 4,3)
from dual;

-- ���� ���̺��� ��� 
select * from employee; 

select  hiredate, substr(hiredate, 1,2)  as ��������� , substr(hiredate, 4,2)  as �������
        , substr(hiredate, 7,2)  as �ϸ����
from employee ; 

-- INSTR : Ư�� ������ ��ġ�� ���,  
-- Oracle mania ���� a��� �ܾ �� �ڸ��� : 3
select instr('Oracle mania', 'a') 
from dual; 

-- 4��° �ڸ� ���� ���� �˻� : a�� �� �ڸ��� : 9 
select instr('Oracle mania', 'a' , 4 ) 
from dual; 

-- ��� �̸� �÷��� 'K' ���ڰ� �� �ڸ����� �˻� : �˻��� ���� �ʴ°�� : 0 , 
select ename , instr(ename, 'K')
from employee; 

-- LPAD :  LPAD ( �÷�, �ڸ������ø�,'*')   : Ư�����ڸ� ���ʿ� ��� 
-- RPAD :  RPAD ( �÷�, �ڸ������ø�,'*')   : Ư�����ڸ� �����ʿ� ��� 
select salary , LPAD (salary, 10, '*'), RPAD (salary, 10, '*')
from employee; 







