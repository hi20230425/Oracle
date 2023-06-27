/* Select 2  */ 

/* 함수 사용 하기 */ 

/* 
  오라클에서 제공해 주는 다양한 기본 제공된 함수
  1. 문자 처리 함수
  2. 숫자 처리 함수 
  3. 날짜 처리 함수 
  4. 변환 함수 
  5. 일반 함수  
*/ 

/*
  1. 문자 함수 :
        UPPER : 대문자로 변환 해주는 함수 
        LOWER : 소문자로 변환 해주는 함수 
        INITCAP : 첫자만 대문자로 변환해주는 함수 
*/ 

/*
    dual : 가상의 테이블 , 단일 함수를 처리 하기 위해 가상으로 만든 테이블, 
*/

select UPPER ('Oracle mania') as 대문자
from dual; 

select LOWER ('Oracle mania') as 소문자
from dual; 

select INITCAP('oracle mania') as 단어의첫자만대문자
from dual; 

select ename as "이름(원본)", LOWER(ename) as 소문자, INITCAP(ename) as 첫자만대문자
from employee; 

-- 
select * 
from employee; 

select * 
from employee 
where ename = UPPER('ward'); 

/* 
    문자의 길이를 처리하는 함수 
    LENGTH : 글자수를 반환 ( 한글을 1byte)
    LENGTHB : 글자수를 반환 (한글을 3byte)로 처리 <== UTF-8   
*/
-- 글자수를 리턴 
select LENGTH ('Oracle mania') as 글자수
from dual;

-- 한글 1자는 3byte  ==> 1자로 출력 
select LENGTH('오라클 매니아') as 글자수 
from dual ;

select LENGTHB('Oracle mania') as 글자수 
from dual; 

-- LENGTHB : 한글 1자를 3byte 로 처리 
select LENGTHB('오라클 매니아') as 글자수 
from dual ;

/*
    char(6) : 영문 : 6자, 한글 : 2자      <== 글자의 자릿수가 지정된 경우     : 주민번호 (13) , 은행의 비밀번호 
    varchar2(6) : 영문 : 6자, 한글 : 2자  <== 글자의 자릿수를 알수 없는 경우   : 주소, 메일 
    
    nchar(6) : 유니코드 (3byte) 6자를 입력 : 한글, 일본어, 중국어 , 아스키코드 영문 6자 
    nvarchar2(6) :  유니코드 (3byte) 6자를 입력 : 한글, 일본어, 중국어 , 아스키코드 영문 6자 
    
*/


-- Test01 테이블 생성 
CREATE TABLE test01 (
    name1 char(6) not null , 
    name2 varchar2(6) null, 
    name3 nchar(6) null, 
    name4 nvarchar2(6) null
    ); 
    
drop table test01; 

desc test01; 

-- test01 테이블에 값넣기 
-- name1 : char(6) , name2 varchar2(6) : 영문 6자 , 한글 2자 
-- name3 : nchar(6), name4 nvarchar2(6) : 영문 6자, 한글 6자 
select LENGTH ('abcdefghijklmnopqr') from dual; 

insert into test01 ( name1, name2, name3, name4 ) 
values ('abcdef', 'hijklm', 'abcde6', '오라클매니아');

insert into test01 ( name1, name2, name3, name4 ) 
values ('abcdef', 'hijklm', 'abcde6', 'abcdefg');

insert into test01 (name1, name2) 
values ('오늘은', '날씨는') ; 

select * from test01; 

-- 실제 테이블의 글자수를 읽어오기 
select * from employee; 

select ename , length(ename) as 이름의글자수 
from employee; 

/*
    CONCAT : 문자열을 연결 시켜주는 함수 
    SUBSTR : 문자를 잘라내는 함수 , 한글 1자를 1byte로 처리함. 
    SUBSTRB: 문자를 잘라내는 함수,  한글 1자를 3byte로 처리함. 
    INSTR : 특정 문자의 위치값을 반환 ( 한글 1byte) 
    INSTRB : 특정 문자의 위치값을 반환 ( 한글 3byte)
    LPAD : 글자 자릿수를 입력받고 나머지는 특정기호로 채움 (왼쪽)
    RPAD : 글자 자릿수를 입력받고 나머지는 특정기호로 채움 (오른쪽)
*/ 

select 'Oracle', 'mania' ,
        concat ('Oracle', ' mania')
from dual ; 

select * from employee; 

select ename, job, concat(ename, job) as 컬럼연결 from employee; 

-- substr : 문자열을 잘라오는 함수 : substr(컬럼, 4,3 ) --- 컬럼의 4번째 자리에서 3자를 잘라와서 출력 
select substr('Oracle mania', 4,3)  
from dual; 

select substr('오라클 매니아', 5,3)
from dual; 

select substrb('Oracle mania', 4,3)  
from dual; 

select substrb('오라클 매니아', 4,3)
from dual;

-- 실제 테이블에서 사용 
select * from employee; 

select  hiredate, substr(hiredate, 1,2)  as 연도만출력 , substr(hiredate, 4,2)  as 월만출력
        , substr(hiredate, 7,2)  as 일만출력
from employee ; 

-- INSTR : 특정 문자의 위치를 출력,  
-- Oracle mania 에서 a라는 단어가 들어간 자릿수 : 3
select instr('Oracle mania', 'a') 
from dual; 

-- 4번째 자리 이후 부터 검색 : a가 들어간 자릿수 : 9 
select instr('Oracle mania', 'a' , 4 ) 
from dual; 

-- 사원 이름 컬럼에 'K' 글자가 들어간 자릿수를 검색 : 검색이 되지 않는경우 : 0 , 
select ename , instr(ename, 'K')
from employee; 

-- LPAD :  LPAD ( 컬럼, 자릿수를늘림,'*')   : 특수문자를 왼쪽에 출력 
-- RPAD :  RPAD ( 컬럼, 자릿수를늘림,'*')   : 특수문자를 오른쪽에 출력 
select salary , LPAD (salary, 10, '*'), RPAD (salary, 10, '*')
from employee; 







