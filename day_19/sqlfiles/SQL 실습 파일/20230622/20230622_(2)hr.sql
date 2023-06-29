/**join**/

select studno, name, student.deptno, department.dname
from student, department
where student.deptno = department.deptno;


-- 사원 테이블에서 dallas 에서 근무하는 사원의 사번, 이름 부서번호, 부서이름 , 부서 위치를 출력

select * from emp;
select * from dept;
select e.empno, e.ename, e.deptno, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno and d.loc = 'DALLAS';

-- 급여가 400 이상인 교수 이름, 급여 학과번호, 학과 이름

select p.name, p.sal, p.deptno, d.dname
from professor p, department d
where p.deptno = d.deptno and p.sal >= 400;

select * from ;
-- 컴퓨터공학과 학생들의 학번, 이름, 학과번호, 학과이름, 학과 위치, 지도교수 이름, 급여
select s.studno 학번, s.name 이름, s.deptno 학과번호,
        d.dname 학과이름,d.loc 학과위치,p.name 지도교수, p.sal 급여
from student s, professor p ,department d
where s.deptno = 101 and p.profno = s.profno and d.deptno = 101;

select s.studno, s.name, s.deptno, d.dname, d.loc
from student s, department d
where s.deptno = d.deptno;



--1.  보너스를 받으면 이름과 보너스를 출력하고, 받지 않으면 이름과 200 출력해 보세요.(emp)

select ename, NVL(comm,'200')
from emp;

--2. 총 급여가 $5,000이 넘는 각 JOB에 대해 JOB와 월급 총액을 출력하세요.
--(단, PRESIDENT를 제외시키고, 월급 총액별으로 정렬)

select job,sum(sal)
from emp
where job != 'PRESIDENT'
group by job
having sum(sal)>=5000
order by sum(sal);

select * from emp;
--3.CHICAGO에 근무하는 모든 종업원에 대해서 
--이름, 업무, 부서 번호 그리고 부서 이름을 출력하는 질의를 작성하세요.(emp, dept)

select e.ename, e.job, d.deptno,d.dname
from emp e,dept d
where d.loc = 'CHICAGO' and e.deptno = 30;

-- 4. 사원명, 입사일 그리고 입사한 요일을 출력하세요. 
-- 열 레이블은 DAY 입니다.(***결과는 월요일부터 시작하는 요일 순으로 정렬하세요.)

select ename, hiredate, to_char(hiredate,'DAY') DAY
from emp;

--5. 1980, 1981, 1982, 1987년에 입사한 사원에 대해서 전체 사원 수와 연도별 사원 수를 출력하세요.
--적당한 열레이블을 부여하세요. (emp)
desc emp;

select count(ename) TOTAL ,to_char(hiredate,'YYYY') hiredate, count(*) cnt
from emp
group by to_char(hiredate,'YYYY');

select count(*) TOTAL, count(case to_char(hiredate,'YYYY') when '1980' then 1 else null end) "1980",
        count(case to_char(hiredate,'YYYY') when '1981' then 1 else null end) "1981",
        count(case to_char(hiredate,'YYYY') when '1982' then 1 else null end) "1982",
        count(case to_char(hiredate,'YYYY') when '1987' then 1 else null end) "1987"
from emp;

select count(ename) TOTAL
from emp;