/**문자 함수**/

-- initcap : 첫 번째 영문자를 대문자로 변환
select name, userid, initcap(userid)
from student
where name='김영균';

select * from emp;
-- ename 전체를 변환한 후 탐색
select empno, ename
from emp
where initcap(ename)='Smith';

-- lower, upper 함수 / 문자열 전체를 소문자, 대문자로 변환
select userid, lower(userid),upper(userid)
from student
where studno = 20101;

-- manager들만 출력
select ename, initcap(job) job,deptno
from emp
where lower(job)='manager'
order by ename;

-- length/lengthb  문자열의 길이/바이트 수 반환
select dname, length(dname),lengthb(dname)
from department;


--오라클에서 캐릭터 셋이 AL32UTF8 인경우 한글을 한자당 3바이트씩 인식한다
--현재 캐릭터셋 확인
SELECT *
FROM nls_database_parameters
WHERE parameter = 'NLS_CHARACTERSET';

/**문자 조작 함수**/


-- concat : 첫 번째 문자와 두 번째 문자를 연결
select concat(concat(concat(name,'의 직책은 '),position),'이다.') sentence
from professor;

-- substr : 문자열의 일부를 추출하는 함수
select substr(name,1,3) name, idnum,substr(idnum,1,6) birth_date, substr(idnum,3,2) birth_mon
from student
where grade=1;
/* 동일 조건 여학생만*/
select substr(name,2,3) name, idnum,substr(idnum,1,6) birth_date, substr(idnum,3,2) birth_mon
from student
where grade=1 and substr(idnum,7,1)=2;
select * from emp;

/*이름이 J,A,M으로 시작하는 모든 사원, 첫번째 문자는 대문자로
나머지는 모두 소문자로 나타나는 사원의 이름과 이름 길이*/
select initcap(ename) as Name, length(ename) Length
from emp
where substr(ename,1,1) in ('J','A','M');

--instr : 문자열중에서 특정 문자가 포함된 위치를 반환하는 함수
select dname, instr(dname,'과')
from department;

--LPAD/RPAD : 문자열이 일정한 크기가 되도록 왼쪽 또는 오른쪽에 지정한 문자 삽입
select position, lpad(position,10,'*') lpad_position,
        userid, rpad(userid,12,'+') rpad_userid
from professor;

--LTRIM/RTRIM : 문자역에서 특정 문자를 삭제하기 위한 함수
select ltrim('xyxXxyLASTWORD','xy')
from dual;
select rtrim('TURNERxyxXxy','xy')
from dual;
/* dname에서 '과'삭제*/
select dname, rtrim(dname,'과')
from department;


/**숫자 함수**/


-- round : 지정한 자리 이하에서 반올림한 결과값
select name, sal, sal/22,round(sal/22),round(sal/22,2),round(sal/22,-1)
from professor
where deptno=101;

-- trunc : 지정한 소수점 자리수 이하를 절삭한 결과
select name, sal, sal/22,trunc(sal/22),round(sal/22,2),trunc(sal/22,-1)
from professor
where deptno=101;

-- mod : 나누기 연산 후에 나머지를 출력
select name, sal, comm, mod(sal,comm)
from professor
where deptno=101;

-- ceil : 지정한 숫자보다 크거나 같은 정수 중 최소값
-- floor : 지정한 숫자보다 작거나 같은 정수 중에서 최대값
select ceil(19.7), floor(12.345)
from dual;

/** 날짜 계산 함수**/

select name,hiredate, hiredate+30,hiredate+60
from professor
where profno  = 9908;

-- months_between
-- add_months
select hiredate from professor;

select profno, hiredate,round(months_between(sysdate,hiredate)) tenure,
        add_months(hiredate,6) review
from professor
where months_between(sysdate,hiredate) < 360;






/****/
-- 1. 학생 테이블에서 이름이 진으로 끝나고 지도교수가 배정되지 않은 101번 학과 학생의 아이디 이름 학년 학과번호
select * from student;
select userid,name,grade,deptno
from student
where substr(name,3,1)='진' and profno is null;
-- 2. MANAGER이거나 SALESMAN이며 급여가 $1500,$3000,#5000이 아닌 모든 사원에 대해 이름, 업무, 급여
select * from emp;
select ename, job,sal
from emp
where job in ('MANAGER','SALESMAN') and sal not in(1500,300,5000)
order by sal desc;
-- 3. 사원테이블에서 2월에 입사한 사원을 출력
select ename
from emp
where substr(hiredate,4,2)=02;
-- 4. 직급이 'manager'인 사원을 검색하려 햇으나 '선택된 레코드가 없음'이라 나온 이유와 결과가 나오도록 수정
-- 이유 : 저장된 값은 대문자이기 때문에 소문자로 검색하면 나오지 않음
-- 수정
select empno, ename,job
from emp
where lower(job) = 'manager';

--5. 사원 테이블에서 사원 번호, 이름 급여, 12% 증가된 급여 모두 출력(소수점 세번째 자리에서 반올림)
select empno,ename,sal,round(sal*1.12,2) as "New Salary", (round(sal*1.12,2) - sal) as "Increase"
from emp;
