/*student 전체 데이터 형 확인*/
desc student;
/*between 연산자 -> and 연산자*/
select name, birthdate
from student
where birthdate between '81/01/01' and '83/12/31';


/*in 연산자 -> or 연산자*/
select name, grade, deptno
from student
where deptno in (102,201);

/* 문제1 */
select * from emp;

select empno, ename,job,sal
from emp
where sal between 1500 and 5000 and job not in ('PRESIDENT','ANALYST');

select empno, ename,job,sal
from emp
where sal between 1500 and 5000 and job in ('PRESIDENT','ANALYST');

/* LIKE 연산자 : 칼럼에 저장된 문자열 중 지정한 문자패턴과 부분적으로 일치하면 참*/
/* 김씨인 사람*/
select name, grade, deptno
from student
where name like '김%';


/* 이름이 영으로 끝나는 사람*/
select name, grade, deptno
from student
where name like '%영';

/* 김씨이고 이름이 영으로 끝나는 사람*/
/* _ : 한글자, % : 글자 개수 상관없음*/
select name, grade, deptno
from student
where name like '김_영';

select * from student;
/* 학생테이블에서 여학생의 이름, 학년 학과번호, 주민등록번호*/
select name, grade,deptno,idnum
from student
where idnum like '______2%';

/*데이터 추가*/
insert into student(studno,name)
values (33333,'황보_정호');

select * from student;
/* escape 옵션 : like 연산자에서 사용하는 와일드 문자(%,_)를 일반 문자처럼 취급하기 위한 옵션*/
select name
from student
/*escape 문자가  _앞에 있으므로 _을 문자로 해석*/
where name like '황보\_%' escape '\';

/* NULL : 미확인 값, 아직 적용되지 않은 값. NULL값과 다른 값과의 연산결과는 NULL*/
select empno, sal, comm,sal + comm
from emp;
/* NULL값 대체 함수 : NVL(판단 대상, 대체 값)*/
select empno, sal, comm, NVL(sal + comm,sal)
from emp;

/* NULL값 확인*/
select name, position, comm
from professor;
/*IS NULL, IS NOT NULL*/
select name, position, comm
from professor
where comm is null;
/*사원 테이블에서 커미션을 받지 않고 이름의 세번째 글자가 A, 급여가 300이상인 사원의 이름 급여 커미션*/
select * from emp;

select ename, sal, comm
from emp
where comm is null and ename like '__A%' and sal >= 2500;

/*employees 테이블에서 커미션을 받지 안혹, 급여가 2500이상 이름의 세번째 글자는 e를 포함하는 사원의 이름 급여 커미션*/
select * from employees;

select first_name, salary, commission_pct
from employees
where commission_pct is null and salary >=2500 and first_name like '__e%';

/*연산자 우선순위 : 비교연산자,sql연산자-> not-> and-> or*/

select name, grade, deptno
from student
where deptno = 102 and (grade = '1' or grade = '4');

/**집합 연산자**/

/*기존에 존재하는 테이블을 사용하여 조건을 지정하여 신규 테이블 2개 만들기*/
create table stud_heavy
as select *
from student
where weight >= 70 and grade = '1';

create table stud_101
as select *
from student
where deptno = 101 and grade='1';

select * from stud_heavy;
select * from stud_101;


/*union - 중복 제거 합집합 연산, union all - 중복 제거 안함 합집합*/
/*union 연산을 실행할 때 두 칼럼수가 같아야 함*/
select studno, name
from stud_heavy
union
select studno, name
from stud_101;

select studno, name
from stud_heavy
union all
select studno, name
from stud_101;

/*학생 테이블과 교수테이블에 대해 union 연산을 수행 name, userid, sal출력, sal이 없으면 0*/
select name, userid,sal
from professor
union
select name, userid,0
from student;


/*intersect - 교집합 연산*/
select name from stud_heavy
intersect
select name from stud_101;

/*minus - 차집합 연산*/
/*A minus B => A - B*/
select studno 학번, name 이름
from stud_heavy
minus
select studno, name
from stud_101;

select studno 학번, name 이름
from stud_101
minus
select studno, name
from stud_heavy;

/* 직입이 전임강사인 사람들은 명단에서 제외*/
select name, position
from professor
minus 
select name, position
from professor
where position ='전임강사';

select name, position
from professor
where position <> '전임강사';


/*정렬, order by*/
/*학생 테이블에서 이름을 가나다순으로 정렬하여 이름 학년 전화번호를 출력*/
select name, grade, tel
from student
order by name;
/*학생 테이블에서 학년을 내림차순으로 정렬하여 이름 학년 전화번호를 출력, desc 생략 불가능*/
select name, grade, tel
from student
order by grade desc;
/* select 절에 포함되지 않은 컬럼도 order by 할 수 있음*/

/*부서 번호로 결과를 정렬한 후(1) 급여에 대해서는 내림차순(2) 급여도 같다면 이름은 오름차순(3)*/
select ename, job,deptno,sal
from emp
order by deptno, sal desc, ename; /*대체 가능 : order by 3,4 desc,1*/


select * from emp;


/* 실습 */
select ename,deptno
from emp
where deptno in (10,30)
order by ename,deptno;


select ename, hiredate
from emp
where hiredate like '82/%';


select ename, sal, comm
from emp
where comm is not null
order by sal desc, comm desc;


select ename, sal, comm
from emp
where comm >= sal*0.2 and deptno = 30;

/*사원 테이블에서 급여가 1000~5000이고, 직무가 president analyst가 아니면서 보너스가 급여의 10% 이상인 모든 사원에 대해
   job 내림차순, sal 내림차순*/
select empno "사번", ename "사원의 이름", job "직무", sal "급여"
from emp
where sal between 1000  and 5000 and job not in ('PRESIDENT','ANALYST') and comm >= sal *0.1
order by job desc, sal desc;


