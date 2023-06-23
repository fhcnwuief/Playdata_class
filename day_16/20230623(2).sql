/*서브 쿼리*/
select name, position
from professor
where position = (select position
                    from professor
                    where name = '전은지')
and name like'%웅'; 

/*단일행 서브쿼리*/
select studno, name, grade
from student
where grade = (select grade from student where userid = 'jun123');
-- 사용자 아이디가 'jun123'인 학생과 같은 학년인 
-- 학번, 이름, 학년, 학과이름, 학과위치
select s.studno, s.name, s.grade,d.dname, d.loc
from student s, department d 
where s.deptno = d.deptno and s.grade = (select grade from student where userid = 'jun123');

select name, deptno, weight
from student
where weight < (select avg(weight) from student 
                        where deptno = 101)
order by deptno;

select * from student;

select deptno "학과번호", max(avg(weight)) "최대몸무게"
from student
group by deptno
having max(avg(weight)) = (select avg(weight) from student group by deptno);

-- in 연산자를 이용한 다중 행 서브쿼리
select name, grade, deptno
from student
where deptno in(select deptno from department where college =100);

-- 사원 테이블 조회, 각 부서별 최대 급여를 받은 사원들의 
-- 부서번호 이름 급여

select * from emp;
select e.deptno, e.ename ,e.sal,d.dname
from emp e, dept d
where e.deptno = d.deptno
and sal in (select max(sal) from emp group by deptno)
order by deptno;

-- any 연산자를 이용한 다중 행 서브쿼리

-- 모든 학생 중에서 4학년 학생 중에서 키가 제일 작은 학생보다
-- 키가 큰 학생의 학번, 이름, 키
--4학년의 최소 키인 175보다 키가 큰 학생을 검색하는 경우와 동일
select studno, name, height
from student
where height > any (select height from student where grade ='4');

-- all 연산자

-- 모든 학생 중에서 4학년 학쟁 중에서 키가 가장 큰 학생보다
-- 키가 큰 학생의 학번, 이름 키
select studno, name, height
from student
where height > all (select height from student where grade ='4');

-- exists 연산자를 이용한 다중 행 서브쿼리
-- 보직수당을 받는 교수가 한 명이라도 있으면 모든 교수의 교수 번호
-- 보직수당 그리고 급여와 보직수당의 합
select profno, name, sal, comm, sal+NVL(comm,0)
from professor
where exists (select profno from professor where comm is not null);

-- not exist
select 1 userid_exist
from dual
where not exists(select userid from student where userid = 'goodstudent');


/*다중 컬럼 서브쿼리*/

--pairwise 다중 칼럼 서브쿼리
-- pairwise 비교 방법에 의해 학년별로 몸무게가 최소인 학생의
-- 이름 학년 몸무게를 출력
select name, grade, weight
from student
where (grade,weight) in (select grade,min(weight) from student group by grade);


-- 각 학과별로 입사일이 가장 오래된 교수의 교수번호와 이름
-- 입사일과 학과명

select p.name, p.profno, p.hiredate, d.dname
from professor p, department d
where (p.deptno,p.hiredate) in  (select deptno,min(hiredate) from professor group by deptno)
and p.deptno = d.deptno; 

--unpairwise 다중 컬럼 서브쿼리
-- unpairwise 비교 방법에 의해 학년별로 몸무게가 최소인 학생의 
-- 이름, 학년 몸무게

select name, grade, weight
from student
where grade in (select grade from student group by grade)
and weight in (select min(weight) from student group by grade);

select ename, hiredate
from emp
where deptno = (select deptno from emp where initcap(ename) = 'Blake');

select empno, ename, sal
from emp
where sal>(select avg(sal) from emp)
order by sal desc;