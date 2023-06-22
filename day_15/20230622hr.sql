/**날짜 함수**/

-- 이번달의 마지막 날짜와 돌아오는 일요일의 날짜
select sysdate, last_day(sysdate), next_day(sysdate,'일')
from dual;

select sysdate, last_day(sysdate), next_day(sysdate,1)
from dual;

-- trunc : 시간정보와 상관없이 당일날을 출력
-- round : 정오를 넘으면 다음날을 출력(정오가 안넘으면 trunc와 결과 똑같음)
-- to_char : 출력될 형식을 지정
select to_char(sysdate,'YY/MM/DD HH24:MI:SS') normal,
        to_char(trunc(sysdate),'YY/MM/DD HH24:MI:SS') trunc,
        to_char(round(sysdate),'YY/MM/DD HH24:MI:SS') round
from dual;


select to_char(hiredate,'YY/MM/DD HH24:MI:SS') hiredate,
--입사일을 일을 기준으로 반올림
        to_char(round(hiredate,'dd'),'YY/MM/DD') round_dd,
--입사일을 월을 기준으로 반올림
        to_char(round(hiredate,'mm'),'YY/MM/DD') round_mm,
--입사일을 연도를 기준으로 반올림
        to_char(round(hiredate,'yy'),'YY/MM/DD') round_yy
from professor
where deptno = 101;

desc student;


--to_char 함수
select studno, birthdate 생일, to_char(birthdate,'YY-MM') birthdate
from student
where name='전인하';

select name, grade, to_char(birthdate,'Day Month Mon DD,YYYY') BIRTHDATE
FROM STUDENT
WHERE DEPTNO = 102;


-- 데이터 타입 언어 변경
alter session set nls_language = American;
alter session set nls_language = Korean;

select name,to_char(hiredate,'MONTH DD, YYYY HH24:MI:SS:PM') hiredate
from professor
where deptno = 101;

select name, position, to_char(hiredate,'mon "the" DDTH "of" YYYY') hiredate
from professor
where deptno = 101;


-- 숫자를 문자 형식으로 변환
select name, sal, to_char((sal+comm)*12, '9,999') anual_sal
from professor
where comm is not null;

-- to_nuber : 숫자로 구성된 문자열을 숫자 데이터로 변환
select to_number('1') num
from dual;

-- to_date : 숫자와 문자로 구성된 문자열을 날짜 데이터로 변환
select name, hiredate
from professor
where hiredate = to_date('june 01, 01','MONTH DD, YY');

-- 출생한지 몇일 째
select trunc(sysdate - to_date('1999/12/18','YYYY/MM/DD')) as "Lived day"
from dual;

select trunc(sysdate - to_date('1999/12/18','YYYY/MM/DD')) as "Lived day",
        trunc(months_between(sysdate,to_date('1999/12/18','YYYY/MM/DD'))) as "Lived month" 
from dual;


--중첩 함수
select to_char(to_date(substr(idnum,1,6),'YYMMDD'),'YY/MM/DD') as "birthdate"
from student;



/**일반 함수**/

--NVL : NULL을 0 또는 다른 값으로 변환
select name, position,sal, comm,sal+comm,
        sal+NVL(comm,0) s1,NVL(sal+comm,sal) s2
from professor
where deptno = 201;

-- NVL2 함수 
select name, position, sal, comm, NVL2(comm, sal+comm,sal) total
from professor
where deptno = 102;

select ename, sal, comm, sal+comm, NVL2(comm,sal+comm,sal), sal+NVL(comm,0)
from emp;

select ename , NVL2(comm,to_char(comm),'no') as comm2
from emp;

select * from emp;

desc emp;

select name, userid, lengthb(name),lengthb(userid), nullif(lengthb(substr(name,1,2)),lengthb(userid)) nullif_result
from professor;
-- COLESCE ; null이 아닌 첫 번째 인수를 반환
select name, comm,sal,coalesce(comm,sal,0) co_result
from professor;

--decode 함수 : if문/case 문의 기능
select name, deptno,
        decode(deptno,101,'컴퓨터공학과',102,'멀티미디어학과',201,'전자공학과','기계공학과') dname
from professor;

-- 학생 테이블에서 학과번호와 이름, 학과명을 출력하되
-- 191번 학과 학생만 'Computer Science'로 출력, 101번이 아닌 학생들을 학과명을 "ETC"

select deptno,name,decode(deptno,101,'Computer Science','ETC') dname
from student
where deptno is not null;

-- case 함수
select name, deptno,sal,
    case when deptno = 101 then sal*0.1
        when deptno = 102 then sal*0.2
        when deptno = 201 then sal*0.3
        else 0
    end bobus
from professor;

select * from student;
-- 학생 테이블에서 생년월일에서 월을 추출하여 태어난 분기를 출력
select name, to_char(birthdate,'MM') month, 
    case when to_char(birthdate,'Q') = 1 then  '1/4'
    when to_char(birthdate,'Q') = 2 then  '2/4'
    when to_char(birthdate,'Q') = 3 then  '3/4'
    else '4/4'
    end 분기
from student;



/**GROUP 함수**/


--COUNT 함수
select count(comm)
from professor
where deptno=101;

select count(job)
from emp;

select count(distinct(job)) 
from emp;

-- AVG SUM 함수
select avg(weight), sum(weight)
from student
where deptno = 101;

-- MIN MAX 함수
select max(height),min(height)
from student
where deptno = 102;

select studno, name, height, deptno
from student
where deptno = 102
order by height;

select max(sal) Maximum, min(sal) Minimum, sum(sal) Sum, round(avg(sal)) Average
from emp;

-- STDDEV,VARIANCE : 표준편차와 분산
select stddev(sal),variance(sal)
from professor;

/**group by**/

select deptno, count(*), count(comm)
from professor
group by deptno
order by deptno;

-- 다중 칼럼을 이용한 그룹핑
select deptno, avg(sal), min(sal),max(sal)
from professor
group by deptno
order by deptno;


select deptno, profno, sal
from professor
order by deptno;

select deptno, grade, count(*), round(avg(weight))
from student
group by deptno, grade;

--rollup 연산자
select deptno, sum(sal)
from professor
group by rollup(deptno);

select deptno, position, count(*)
from professor
group by rollup(deptno, position);

select deptno, position, count(*)
from professor
group by cube(deptno, position);


--grouping 함수

select deptno, grade, count(*),
        grouping(deptno) grp_dno,
        grouping(grade) grp_grade
from student
where deptno is not null
group by rollup(deptno,grade);

--grouping sets 함수

select deptno, grade, null,count(*)
from student
group by deptno, grade
union all
select deptno, null,to_char(birthdate,'YYYY'), count(*)
from student
group by deptno, to_char(birthdate,'YYYY');


select deptno, grade, to_char(birthdate, 'YYYY') birthdate, count(*)
from student
group by grouping sets((deptno, grade),(deptno, to_char(birthdate,'YYYY')));


/**HAVING절**/
select grade, count(*), round(avg(height)) avg_height,
        round(avg(weight)) avg_weight
from student
group by grade
order by avg_height desc;


select grade, count(*), round(avg(height)) avg_height,
        round(avg(weight)) avg_weight
from student
group by grade
having count(*) > 4
order by avg_height desc;


select deptno, avg(weight)
from student
group by deptno;

select deptno, max(avg(weight)) max_weight
from student
group by deptno;


select * from emp;
/*사원 테이블에서 급여를 1500이상 받는 사원들 중에서
평균 급여가 2000이상인 부서번호, 병균 급여, 부서순으로 정렬*/
select deptno, round(avg(sal))
from emp
where sal>=1500
group by  deptno
having avg(sal)>=2000
order by deptno;

select studno
from student;

select max(count(studno)) max_cnt, min(count(studno)) min_cnt
from student
group by deptno;