
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
where dno = 40;         -- 

rollback; 
commit; 

insert into dept ( dno, dname )
values (40, '�Ǹź�') ; 

-- dno : where �� ���, �ߺ��� ���� ��������ʴ� �÷��� ��� ( primary key, Unique ) 
update dept 
set dname = 'HR', loc = '����'
where dno = 40; 

-- ���̺��� Primary Key �÷��� �����ؾ� �Ѵ�.   <== �ߺ��� ���� ������ ������ ������ ����  


-- delete : ���̺��� Ư�� ���ڵ� ���� : ���� : : �ݵ�� where����(Primary Key, Unique �÷� ) �� ����ؾ� �Ѵ�.
delete dept
where dno = 40; 

commit; 


/* ���� ���� : �÷��� �ο��Ǵ� ����, Primary Key, Unique, Default, Not null, Check, 
        Ư�� �÷��� ���Ἲ �� Ȯ���ϱ� ���ؼ� �ο� 
    Primary Key : 
        -- �ߺ��� ���� ���� ���ϵ��� ����
        -- NOT NULL 
        -- ���̺� �ѹ��� ���� �� �ִ�. ���� �÷��� �ϳ��� Primary Key �� ���� �� �ִ�. 
        -- INDEX �� �ڵ����� �����ȴ�.   <== �˻��� ������ ��. 
        -- update, delete �� where ������ ���Ǵ�  �÷� 
*/ 

create table member1 (
    id varchar2(50) not null Primary key, 
    pass varchar2(50) not null , 
    addr varchar2(100) null, 
    phone varchar2(30) null,
    age number (3) ,        -- ���� 3�ڸ�
    weight number(5,2)      -- �Ǽ� : ��ü 5�ڸ�, �Ҽ������� 2�ڸ� 
); 

-- Insert 
insert into member1 
values ( 'ddd', 'aaa', '����', '010-1111-1111', 20, 70.55); 

select * from member1; 

commit ; 

-- update �� where ���ǿ� primary key �÷��� �������� ó�� 

update member1 
set addr = '�λ�', phone = '010-2222-2222', age = 30, weight = 88.55
where id = 'bbb' 

-- delete �� where ���ǿ� primary key �÷��� �������� ó��
delete member1
where id ='ccc'; 






























