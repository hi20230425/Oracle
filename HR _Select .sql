/*  Select 문  */ 

/* 테이블의 모든 커럼을 출력 */  

select * from Employee;     -- 사원 정보가 저장된 테이블 

select * from Department;   -- 사원에 대한 부서 정보가 저장 

select * from Salgrade;     -- 연봉에 대한 등급이 저장됨 

/* EMPLOYEE 테이블의 컬럼(필드) 구조 */ 
  /* 
    ENO : 사원번호 
    ENAME : 사원명 
    JOB   : 직책 
    MANAGER : 직급 상사 (사수) 
    HIREDATE : 입사년월일 
    SALARY : 연봉 
    COMMISSION : 보너스 
    DNO : 부서번호 
  */
  
  /* DEPARTMENT 테이블의 컬럼(필드) 구조 */ 
  /* 
    DNO : 부서번호 
    DNAME : 부서명
    LOC  : 부서 위치 
  */ 
  
/* SALGRADE 테이블의 컬럼(필드) 구조 */ 
 /*
    GRADE : 등급 
    LOSAL : 최소월급 
    HISAL : 최대월급 
 */
 
 /* SELECT 쿼리  : 출력하라  */ 
 
 SELECT 컬럼명
 FROM 테이블명[뷰]
 WHERE 조건 
 GROUP BY 그룹핑할컬럼
 HAVING 조건(그룹핑한 결과의 조건) 
 ORDER BY 컬럼명 (정렬할 컬럼명) 
 
 /* 기본 Select */ 
 -- 모든 컬럼 출력 하기 
select * from employee; 

-- 특정 컬럼만 출력 하기 
select eno, ename, salary
from employee; 

-- 컬럼을 여러번 출력 할 수 있다. 컬럼에 연산을 적용 할 수 있다. 
select ename, salary, salary + 100 , hiredate , salary * 2
from employee; 

-- 컬럼에 별칭 적용하기 ,  원본이름 as 별칭이름 
select ename as 이름 , salary as 월급 , salary +100 as "년봉+100" , salary * 2 as "월급의2배"
from employee; 

-- as는 생략될 수 있다. 
select ename  이름 , salary  월급 , salary +100  "년봉+100" , salary * 2  "월급의2배"
from employee; 

-- WHERE 조건 사용하기  
select * from employee 

--이름이 JAMES 인 사원의 이름과 직책, 입사월, 부서번호 출력 하기 
-- SELECT , select, FROM , from , WHERE, where 
-- 컬럼에 저장된 값(레코드) 을 가져올때 대소문자를 구분함.  

select ename 이름, job 직책, hiredate 입사년월일, dno 부서번호
from employee 
where ename ='JAMES'; 

-- where 절에서 연산자 사용 : or , and 
select * 
from employee 
where ename = 'JAMES' or ename = 'SMITH' ; 

-- where절에서 in 연산자 사용 
select * 
from employee
where ename in ('JAMES', 'SMITH'); 

-- where 절에서 비교 연산자 사용하기 :   > , < , >= , <= 
-- 연봉이 1500 이상인 사용자만 출력 
select * 
from employee
where salary >= 1500 ; 

-- 월급이 1500 이고  부서가 30인 사원의 정보를 출력 
select * 
from employee
where salary >= 1500 and dno = 30; 

-- 테이블의 컬럼의 자료형 및 테이블 구조 확인 
-- NUMBER : Oracle에서 정수, 실수 
    /*
        NUMBER(4) : 정수 :  4자리까지만 넣을 수 있다. 
        NUMBER(7,2) : 실수 ( 전체 7자리, 소숫점이하 2자리 ) 
        
        CHAR(10) : 문자 10byte                <== 자릿수를 알수 있는 경우 
            varchar2보다 성능이 빠르다. 하드공간 낭비가 있다. 
            주민번호(13) , 비밀번호 4자리만들어간다. 
            
        VARCHAR2(10) : 문자 10byte    <== VARCHAR2를 사용 , <== 자릿수를 알수 없는 경우 
            char 보다 성능을 떨어지지만 하드 공간을 낭비하지 않는다. 
        
        DATA : 날짜를 저장하는 데이터 타입 
        
    */ 

--테이블 구조 확인 
desc employee; 

select * from employee; 

-- NUMBER  : 정수, 실수 , 값을 가져올때 '' 를 붙이면 안됨 
-- CHAR, VARCHAR2, DATE  값을 가져올때 ''를 붙여야함. 

--직책이 영업사원(SALESMAN) 이고 연봉이 1500이상 3000 미만인 사원의 이름만 출력해 보기  
select * 
from employee
where job = 'SALESMAN' and ( salary >=1500 and salary <3000 ); 

-- null 을 검색 :  주의 : =를 사용하면 안됨, is null 
    -- null : 0 이 아니고 비어있는 상태 

-- 보너스(commission) 가 없는 사원 정보를 출력 
select * 
from employee 
where commission is null ; 

-- 보너스(commission) 가 있는 사원 정보를 출력 : null 이 아닌것만 검색 
select * 
from employee 
where commission is not null ; 

/* 상사(사수) MANAGER 가 없는 사원 정보 출력 */ 
select * from employee; 

select * 
from employee
where manager is null ; 




 
 
 
 
 
 
 
 
 
 
 
