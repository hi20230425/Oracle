
/* DDL, DML, �������� */ 

/*
SQL ( Structured Query Language) : ����ť��, ����, ����ȭ�� ���� ��� 

select �÷���
from ���̺��[��]
where ����
group by �÷�[�׷���]
having ����[group by ���������]
order by �����÷� 

SQL ������ ������ �з� 

DDL (Data Definition Language)  : ��ü(���̺�, ����,  �Լ�, ��, Ʈ����, �������ν���, �ε���, )�� �����ϴ� ���(����)
                                : ��Ű��(Ʋ, ��ü) �� �����ϴ� ��� 
    - create (����), alter (����), drop (����) 
    
DML (Data Manipulation Language) : ���̺��� ���ڵ�(��)�� ���� ��� <== Ʈ������� �߻� ��Ŵ (commit, rollback) 
    -- ����Ŭ������ Ʈ����� ������ �ڵ����� �۵���. 
    -- Ʈ������� �Ϸ� �ؾ��Ѵ�. ( commit , rollback)  
        <== Ʈ������� �Ϸ����� ������ LOCK �� �ɷ��� �ٸ� ����ڰ� ������ �ȵ�
    - insert (�Է�), update (����), delete (����)
    
DCL (Data Control Language) : ������ ���� ���, ������ ������ �ο�,����,���� 
    - grant (������ �ο�), revoke (������ ���) 
    
==============================================================

DQL (Data Query Language) : ����Ÿ ���� ��� (���), 
    - Select 
TCL (Transaction Control Language ) : Ʈ����� ���� ��� ,   <== DML �߻��� 
    -- begin transaction     : Ʈ����� �ڵ����� ���� ( insert, update, delete) 
    
    -- commit [ transaction ]: Ʈ������� �Ϸ�, ���� DataBase �� ���������� ���� 
    -- rollback  [ transaction ] : Ʈ������� ���۽������� �ǵɸ�. 
    
    -- savepoint : Ʈ������� �ӽ� ���� ���� ���� 

*/ 

-- ���̺� ���� : create table 

create table dept (
    dno number(2) not null , 
    dname varchar2(50) not null, 
    loc varchar2 (13) null
); 

desc dept ;   -- ���̺� ���� Ȯ��  

-- ���̺� �� �ֱ� 
--begin transaction ; 
insert into dept ( dno , dname , loc ) 
values ( 10, '�λ��', '����'); 

rollback; 
commit ; 


select * from dept; 

/*
     Ʈ����� (Transaction) : �۾�(��) �� ó���ϴ� �ּ� ���� 
        -- DBMS : ��Ʈ��ũ�� ���ؼ� ���� ���� ����ڰ� ���ÿ� �۾� 
        -- �۾��� �Ҷ� LOCK �� �ɰ� �Ϸ�Ǹ� LOCK�� Ǯ���� 
        -- DML ������ �۵� , 
        -- Ʈ������� ����(commit, rollback) �ϱ� �������� LOCK �� �ɷ��� �ٸ� ������� ������ ���� 
        -- commit : RAM�� ������ ������ DB�� ���������� ���� 
        -- rollback : Ʈ����� ���� �������� �ǵ���.
        -- commit �������� RAM ������ ����Ǿ� ����. 
        -- log �� ��ϵ� , "Ʈ����Ƿα�"   <== ��������� �ƴ϶� ������������ ����  
        
        -- Ʈ������� 4���� Ư¡ 
            -- ALL or NOTHING : �Ǹ� ���� �ǰ� �ϰų� �ƴϸ� ������ �ǵ����ų� 
           
           - ���ڼ� (Atomicity) : ����ó���ϴ� �ּ� ���� 
           - �ϰ��� (Consistency) : Ʈ����ǿ��� ó���� ����� �ϰ����� ������.
           - ������ (lsolation) : �ϳ��� Ʈ������� �ٸ� Ʈ����ǰ� �ݸ� , LOCK 
           - ���Ӽ� (Durability) : commit Ʈ������� DB�� ����� 
                
            A �� B ���� 100�� �Ա� ��   :  �� update ������ �ϳ��� Ʈ���������� �۵��Ǿ����. 
            
            1. update ���� ����ؼ� A ���� 100���� ��� 
            
            2. update ���� ����ؼ� B ���� 100���� �Ա� 
        
*/ 

-- insert �� 
desc dept; 

insert into dept ( loc, dname, dno)
values ( '�λ�', '������', 20); 

-- �÷��� ���� �Ǹ� ��� �÷��� ���� �Ҵ� 
insert into dept 
values ( 30, '������' , null ) 

select * from dept; 

insert into dept (dno, dname) 
values ( 40, '����'); 

commit; 

select * from dept; 

-- UPDATE : ����     <=== ���� : �ݵ�� where����(Primary Key, Unique �÷� ) �� ����ؾ� �Ѵ�.  

update dept 
set dname = '������'
where dno = 40; 

rollback; 
commit; 



























