
/* DDL, DML, 제약조건 */ 

/*
SQL ( Structured Query Language) : 에스큐엘, 씨퀄, 구조화된 질의 언어 

select 컬럼명
from 테이블명[뷰]
where 조건
group by 컬럼[그룹핑]
having 조건[group by 결과의조건]
order by 정렬컬럼 

SQL 구문의 종류를 분류 

DDL (Data Definition Language)  : 객체(테이블, 계정,  함수, 뷰, 트리거, 저장프로시져, 인덱스, )를 생성하는 언어(구문)
                                : 스키마(틀, 객체) 를 생성하는 언어 
    - create (생성), alter (수정), drop (삭제) 
    
DML (Data Manipulation Language) : 테이블의 레코드(값)를 조작 언어 <== 트랜잭션을 발생 시킴 (commit, rollback) 
    -- 오라클에서는 트랜잭션 시작은 자동으로 작동됨. 
    -- 트랜잭션을 완료 해야한다. ( commit , rollback)  
        <== 트랜잭션을 완료하지 않으면 LOCK 이 걸려서 다른 사용자가 접근이 안됨
    - insert (입력), update (수정), delete (삭제)
    
DCL (Data Control Language) : 데이터 제어 언어, 계정에 권한을 부여,수정,제거 
    - grant (권한을 부여), revoke (권한을 취소) 
    
==============================================================

DQL (Data Query Language) : 데이타 질의 언어 (출력), 
    - Select 
TCL (Transaction Control Language ) : 트랜잭션 제어 언어 ,   <== DML 발생됨 
    -- begin transaction     : 트랜잭션 자동으로 시작 ( insert, update, delete) 
    
    -- commit [ transaction ]: 트랜잭션을 완료, 실제 DataBase 에 영구적으로 저장 
    -- rollback  [ transaction ] : 트랜잭션을 시작시점으로 되될림. 
    
    -- savepoint : 트랜잭션의 임시 저장 시점 설정 

*/ 

-- 테이블 생성 : create table 

create table dept (
    dno number(2) not null , 
    dname varchar2(50) not null, 
    loc varchar2 (13) null
); 

desc dept ;   -- 테이블 구조 확인  

-- 테이블에 값 넣기 
--begin transaction ; 
insert into dept ( dno , dname , loc ) 
values ( 10, '인사부', '서울'); 

rollback; 
commit ; 


select * from dept; 

/*
     트랜잭션 (Transaction) : 작업(일) 을 처리하는 최소 단위 
        -- DBMS : 네트워크를 통해서 여러 명의 사용자가 동시에 작업 
        -- 작업을 할때 LOCK 을 걸고 완료되면 LOCK을 풀어줌 
        -- DML 문에서 작동 , 
        -- 트랜잭션을 종료(commit, rollback) 하기 전까지는 LOCK 이 걸려서 다른 사용자의 접근을 차단 
        -- commit : RAM의 수정된 내용을 DB에 영구적으로 저장 
        -- rollback : 트랜잭션 시작 시점으로 되돌림.
        -- commit 전까지는 RAM 에서만 적용되어 있음. 
        -- log 에 기록됨 , "트랜잭션로그"   <== 백업시점이 아니라 오류시점까지 복구  
        
        -- 트랜잭션의 4가지 특징 
            -- ALL or NOTHING : 되면 전부 되게 하거나 아니면 원래로 되돌리거나 
           
           - 원자성 (Atomicity) : 일을처리하는 최소 단위 
           - 일관성 (Consistency) : 트랜잭션에서 처리한 결과는 일관성을 가진다.
           - 독립성 (lsolation) : 하나의 트랜잭션은 다른 트랜잭션과 격리 , LOCK 
           - 지속성 (Durability) : commit 트랜잭션은 DB에 저장된 
                
            A 가 B 에게 100억 입금 예   :  두 update 구문이 하나의 트랜젹션으로 작동되어야함. 
            
            1. update 문을 사용해서 A 통장 100억을 출금 
            
            2. update 문을 사용해서 B 통장 100억을 입금 
        
*/ 

-- insert 문 
desc dept; 

insert into dept ( loc, dname, dno)
values ( '부산', '관리부', 20); 

-- 컬럼이 생략 되면 모든 컬럼에 값을 할당 
insert into dept 
values ( 30, '영업부' , null ) 

select * from dept; 

insert into dept (dno, dname) 
values ( 40, '광주'); 

commit; 

select * from dept; 

-- UPDATE : 수정     <=== 주의 : 반드시 where조건(Primary Key, Unique 컬럼 ) 을 사용해야 한다.  

update dept 
set dname = '제조부'
where dno = 40; 

rollback; 
commit; 



























