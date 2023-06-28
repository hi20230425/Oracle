/* select 3 */
/* 형식 변환 함수 
    TO_CHAR : 날짜, 숫자형을 문자형으로 변환 
    TO_DATE : 문자형을 날짜형으로 변환 
    TO_NUMBER : 문자형을 숫자로 변환 
*/ 

-- TO_CHAR (date, 'YYYYMMDD') : 날짜형식을 'YYYYMMDD' 형식으로 뽑아와서 char 타입으로 변환 

/*
    YYYY : 날짜 정보의 년도를 뽑아냄 
    YY   : 년도의 마지막 2자리 뽑아옴 
    MM   : 월
    DD   : 일 
    
    DAY  : 요일을 뽑아옴 ( 월요일, 화요일, ...일요일)
    DY   : 요일을 뽑아옴 ( 월, 화, ...일)
    
    HH  : 시간 
    MI  : 분 
    SS : 초 

*/


select TO_CHAR (sysdate, 'YYYY/MM/DD'), TO_CHAR(sysdate, 'YYYY-MM-DD DAY HH:MI:SS')  
from dual; 

select sysdate , TO_CHAR (sysdate , 'YY/MM/DD_HH:MI:SS_DY')
from dual; 

select * from employee; 

desc employee; 

select hiredate , TO_CHAR ( hiredate, 'YYYY-MM-DD DAY HH:MM:SS') 
from employee; 

-- TO_CHAR : 날짜 , 숫자 ==> 문자형으로 변환 

/*
    0 : 자릿수를 처리함, 자릿수가 맞지 않으면 0으로 처리됨 
    9 : 자릿수를 처리함, 자릿수가 맞지 않으면 공백 처리됨 
    L : 각 지역의 통화를 기호로 표시 
    . : 소숫점으로 처리 
    , : 천단위 구분자 

*/ 

desc employee; 

select ename , salary , to_char(salary, 'L999,999'), to_char(salary, 'L000,000') 
from employee; 

-- TO_DATE   :  문자형, 숫자 => 날짜타입으로 변환    
    /*
        TO_DATE (변환할문자[숫자], YYYYMMDD)
    */

select TO_DATE(20230628, 'YYYYMMDD') , TO_DATE ('06282023', 'MMDDYYYY') 
from dual; 

select to_date ( '2001-10-30', 'YYYY-MM-DD') 
from dual ; 

-- 생일에서 오늘날짜까지 몇 일 살았는지 출력 : 1981-04-15  
select TRUNC (sysdate - to_date ('1981-04-15', 'YYYY-MM-DD') )  -- 해당날짜에서 현재까지의 일수 
from dual; 

select to_date ( '12/06/22' , 'MM/DD/YY')  - to_date( '1900-10-17', 'YYYY-MM-DD')  as 두날짜의차
from dual; 


-- 자신의 생일 에서 현재 까지 몇일 살았는지. , 몇개월 지났는지?   1981/01/01
select trunc( sysdate - to_date('1981/01/01' , 'YYYY/MM/DD')) as "살아온일 수", 
        trunc (months_between (sysdate ,to_date('1981/01/01' , 'YYYY/MM/DD'))) as "살아온 개월수" 
from dual; 

-- employee 테이블에서 각사원의 입사일에서 2030/01/01 까지의 근무 개월수를 구함.  
select * from employee; 
select ename , hiredate , 
    trunc (months_between (to_date('2030/01/01','YYYY/MM/DD'), hiredate) ) as  "특정날짜까지개월수"
from employee

-- null 처리 함수 : NVL, NVL2, NULLIF    
/*
    NVL (컬럼, 값) : 컬럼에 NULL이 존재할 경우 값으로 대치 
    NVL2 (컬럼명, null이아닐경우처리, null경우처리블락)   
*/ 
select * from employee; 

-- NVL 함수를 사용해서 처리 -  연봉을 구함.  월급(salary) * 12 + 보너스(commission)  
select ename, salary, commission , 
        salary *12 + NVL (commission,0) as 총연봉
from employee; 

-- NVL2 함수를 사용해서 처리 - 
select ename, salary, commission , 
           NVL2(commission ,salary * 12 +commission , salary*12 ) as 총연봉 
from employee; 

/* 그룹 함수 : group by , 특정 컬럼을 그룹핑해서 처리함.  */ 

select 컬럼명
from 테이블이름[뷰]
where 조건
group by 컬럼명[그룹핑할컬럼명]
having 조건[그룹핑한결과의조건]
order by 컬럼명[정렬할컬럼명] 

/* 집계 함수 : SUM, AVG, MAX, MIN, COUNT    <== null 을 자동으로 처리해서 작동됨 
    NUMBER 타입에서만 사용 가능 
    
    -- SUM : 컬럼의 모든 값을 더하는 함수 
    -- AVG : 컬럼의 모든 값의 평균을 구하는 함수
    -- MAX : 컬럼의 모든 값의 최대값을 가져오는 함수 
    -- MIN : 컬럼의 모든 값의 최소값을 가져오는 함수 
    -- COUNT : 레코드수, 그룹핑된 갯수 출력 
    
    주의 : 단일 row로 출력됨, 다른 컬럼을 같이 사용될 경우 오류가 발생
*/ 

select commission from employee
order by commission asc; 

select SUM(commission) as 합계, 
    AVG(commission) as 평균, 
    MAX (commission) as 최대값, 
    MIN(commission) as 최소값, 
    count (commission) 
from employee; 

select * from employee; 


-- 부서별 월급의 합계, 평균, 최대값, 최소값, 그룹핑된 갯수 
-- dno : 부서번호 가 동일한 값을 그룹해서 처리함. 
select sum (salary) as 부서합계 , dno , count (dno) as 그룹핑된갯수
from employee
group by dno 

select ename, salary, dno 
from employee
order by dno asc; 

-- 부서별로 월급의 합계, 평균, 최대월급, 최소월급, 그룹핑된수를 출력 
select sum(salary), round (avg(salary)), max(salary), min(salary), dno 부서번호 , count(dno) 그룹핑수
from employee
group by dno 
order by dno asc; 

select salary from employee where dno = 20; 


select ename, job , salary 
from employee; 

-- 직급 별로  월급의 합계, 평균, 최대값, 최소값, 그룹핑된수 
select sum (salary), round (avg(salary)) as 평균, max (salary), min(salary), job, count(job) 
from employee
group by job 
having round (avg(salary)) > 2000
order by 평균 desc

-- group by 에서 
  /*
    where 절  :  <조건> : group by 전에 조건을 처리해서 나온 결과만 group by 
    having 절 :  <조건> : group by 한 결과에 대한 조건처리 , 별칭이름을 사용하면 안됨.
    order by 는 별칭이름 사용가능 
  */ 
  
-- 직급별로 월급의 합계, 평균, 최대값, 최소값을 출력하되 20부서는 빼고, 평균이 2000 이상인것만 출력 하라. 
-- 평균을 내림차순으로 정렬하라. 

select sum (salary), round (avg(salary)) as 평균, max(salary), min(salary), job, count(*) 그룹핑수 
from employee
where dno not in (20) 
group by job
having round (avg(salary)) >= 2000 
order by round (avg(salary)) desc


-- 두 컬럼 이상 그룹핑을 할 수 있다. 두 컬럼모두가 동일할때 그룹핑 이됨.  
select dno, job
from employee
order by dno , job 

-- 부서번호와 직책컬럼 모두를 그룹핑 해서 월급의 합계, 평균, 최대값, 최소값, 그룹핑된수 
select sum (salary), round (avg (salary)), max (salary), min(salary), count (*) 그룹핑된수
from employee
group by dno, job 
order by 그룹핑된수 desc; 


-- 각 직책에 대해서 월급의 합계, 평균, 최대값, 최소값을 출력하는데 입사일이 81년도에 입사한 사원들만 출력하되
-- 월급의 평균이 1500 만원이상이것만 출력하고 평균을 내림 차순으로 정렬해서 출력 . 

select sum(salary), round(avg (salary)) as 평균, max (salary), min (salary), job , count(*)
from employee
where hiredate like '81%'
group by job
having round(avg (salary)) > 1500
order by 평균 desc; 

select count (*) 
from employee
where hiredate like '81%'





















