/*  Select ��  */ 

/* ���̺��� ��� Ŀ���� ��� */  

select * from Employee;     -- ��� ������ ����� ���̺� 

select * from Department;   -- ����� ���� �μ� ������ ���� 

select * from Salgrade;     -- ������ ���� ����� ����� 

/* EMPLOYEE ���̺��� �÷�(�ʵ�) ���� */ 
  /* 
    ENO : �����ȣ 
    ENAME : ����� 
    JOB   : ��å 
    MANAGER : ���� ��� (���) 
    HIREDATE : �Ի����� 
    SALARY : ���� 
    COMMISSION : ���ʽ� 
    DNO : �μ���ȣ 
  */
  
  /* DEPARTMENT ���̺��� �÷�(�ʵ�) ���� */ 
  /* 
    DNO : �μ���ȣ 
    DNAME : �μ���
    LOC  : �μ� ��ġ 
  */ 
  
/* SALGRADE ���̺��� �÷�(�ʵ�) ���� */ 
 /*
    GRADE : ��� 
    LOSAL : �ּҿ��� 
    HISAL : �ִ���� 
 */
 
 /* SELECT ����  : ����϶�  */ 
 
 SELECT �÷���
 FROM ���̺��[��]
 WHERE ���� 
 GROUP BY �׷������÷�
 HAVING ����(�׷����� ����� ����) 
 ORDER BY �÷��� (������ �÷���) 
 
 /* �⺻ Select */ 
 -- ��� �÷� ��� �ϱ� 
select * from employee; 

-- Ư�� �÷��� ��� �ϱ� 
select eno, ename, salary
from employee; 

-- �÷��� ������ ��� �� �� �ִ�. �÷��� ������ ���� �� �� �ִ�. 
select ename, salary, salary + 100 , hiredate , salary * 2
from employee; 

-- �÷��� ��Ī �����ϱ� ,  �����̸� as ��Ī�̸� 
select ename as �̸� , salary as ���� , salary +100 as "���+100" , salary * 2 as "������2��"
from employee; 

-- as�� ������ �� �ִ�. 
select ename  �̸� , salary  ���� , salary +100  "���+100" , salary * 2  "������2��"
from employee; 

-- WHERE ���� ����ϱ�  
select * from employee 

--�̸��� JAMES �� ����� �̸��� ��å, �Ի��, �μ���ȣ ��� �ϱ� 
-- SELECT , select, FROM , from , WHERE, where 
-- �÷��� ����� ��(���ڵ�) �� �����ö� ��ҹ��ڸ� ������.  

select ename �̸�, job ��å, hiredate �Ի�����, dno �μ���ȣ
from employee 
where ename ='JAMES'; 

-- where ������ ������ ��� : or , and 
select * 
from employee 
where ename = 'JAMES' or ename = 'SMITH' ; 

-- where������ in ������ ��� 
select * 
from employee
where ename in ('JAMES', 'SMITH'); 

-- where ������ �� ������ ����ϱ� :   > , < , >= , <= 
-- ������ 1500 �̻��� ����ڸ� ��� 
select * 
from employee
where salary >= 1500 ; 

-- ������ 1500 �̰�  �μ��� 30�� ����� ������ ��� 
select * 
from employee
where salary >= 1500 and dno = 30; 

-- ���̺��� �÷��� �ڷ��� �� ���̺� ���� Ȯ�� 
-- NUMBER : Oracle���� ����, �Ǽ� 
    /*
        NUMBER(4) : ���� :  4�ڸ������� ���� �� �ִ�. 
        NUMBER(7,2) : �Ǽ� ( ��ü 7�ڸ�, �Ҽ������� 2�ڸ� ) 
        
        CHAR(10) : ���� 10byte                <== �ڸ����� �˼� �ִ� ��� 
            varchar2���� ������ ������. �ϵ���� ���� �ִ�. 
            �ֹι�ȣ(13) , ��й�ȣ 4�ڸ�������. 
            
        VARCHAR2(10) : ���� 10byte    <== VARCHAR2�� ��� , <== �ڸ����� �˼� ���� ��� 
            char ���� ������ ���������� �ϵ� ������ �������� �ʴ´�. 
        
        DATA : ��¥�� �����ϴ� ������ Ÿ�� 
        
    */ 

--���̺� ���� Ȯ�� 
desc employee; 

select * from employee; 

-- NUMBER  : ����, �Ǽ� , ���� �����ö� '' �� ���̸� �ȵ� 
-- CHAR, VARCHAR2, DATE  ���� �����ö� ''�� �ٿ�����. 

--��å�� �������(SALESMAN) �̰� ������ 1500�̻� 3000 �̸��� ����� �̸��� ����� ����  
select * 
from employee
where job = 'SALESMAN' and ( salary >=1500 and salary <3000 ); 

-- null �� �˻� :  ���� : =�� ����ϸ� �ȵ�, is null 
    -- null : 0 �� �ƴϰ� ����ִ� ���� 

-- ���ʽ�(commission) �� ���� ��� ������ ��� 
select * 
from employee 
where commission is null ; 

-- ���ʽ�(commission) �� �ִ� ��� ������ ��� : null �� �ƴѰ͸� �˻� 
select * 
from employee 
where commission is not null ; 

/* ���(���) MANAGER �� ���� ��� ���� ��� */ 
select * from employee; 

select * 
from employee
where manager is null ; 




 
 
 
 
 
 
 
 
 
 
 
