-- EQUI JOIN : 조인 대상 테이블에서 공통 칼럼을 equal 비교를 통해
-- 같은 값을 가지는 행을 연결하여 결과를 생성하는 조인 방법
select s.studno, s.name, s.deptno, d.dname,d.loc
from student s, department d
where s.deptno = d.deptno;

-- 자연 조인을 이용한 EQUI JOIN
-- where 정를 사용하지 않고 natural join 키워드 사용
-- 자동적으로 테이블의 코든 칼럼을 대상으로 공통 칼럼을 조사한 후
-- 내부적으로 조인문 생성

select s.studno, s.name, deptno, d.dname, d.loc
from student s natural join department d;

-- 공통 칼럼은 출처 테이블명을 뺌. 넣으면 에러남

select p.profno, p.name, p.deptno, d.dname
from professor p, department d
where p.deptno = d.deptno;
select p.profno, p.name, deptno, d.dname
from professor p natural join department d;


select s.name,s.grade, s.deptno, d.dname
from student s, department d
where s.deptno = d.deptno and s.grade = '4';
select s.name,s.grade, deptno, d.dname
from student s natural join department d
where s.grade = '4';


-- JOIN~USING : USING절에 조인 대상 칼럼을 지정함
select s.studno, s.name, deptno, d.dname, d.loc
from student s join department d
    using (deptno);

select studno, name, deptno, dname, loc
from student join department
    using (deptno);
    
--하단의 4개는 모두 같은 코드    
select name, dname, loc
from student s, department d
where s.deptno = d.deptno and name like '김%';

select name, dname, loc
from student s inner join department d
on s.deptno = d.deptno
where name like '김%';

select name, dname, loc
from student s natural join department d
where name like '김%';

select name, dname, loc
from student s join department d
using(deptno)
where name like '김%';

select * from salgrade;
-- NON EQUI JOIN : '='조건이 아닌 연산자 사용
-- (<,BETWEEN A AND B)
select p.profno, p.name, p.sal, s.grade
from professor p, salgrade s
where p.sal between s.losal and s.hisal;

select p.profno, p.name, p.sal, s.grade
from professor p, salgrade s
where p.sal between s.losal and s.hisal and p.deptno = 101;
select * from professor;

select name, grade, profno, position
from student natural join professor;

select s.studno, s.name, deptno, d.dname, d.loc
from student s natural join department d;

select s.name, s.grade, p.name, p.position
from student s, professor p
where s.profno = p.profno;

--outer join

-- 학생 테이블과 교수 테이블을 조인하여 이름, 학년, 지도교수의 이름, 직급을 출력
-- 지도교수가 배정되지 않은 학생이름도 함께
select s.name, s.grade, p.name, p.position
from student s, professor p
where s.profno = p.profno(+)
order by p.profno;

-- 이름, 학년, 지도교수 이름, 직급을 출력, 지도학생을 배정받지 않은
-- 교수 이름도 함께 출력
select s.name, s.grade, p.name, p.position
from student s, professor p
where s.profno(+) = p.profno
order by p.profno;


-- 학생 테이블과 교수 테이블을 조인하여 학년, 이름, 지도교수 이름, 
-- 직급을 출력, 지도교수가 배정되지 않은 학생 명단과
-- 지도 학생이 배정되지 않은 교수 명단도 함께 출력
select s.name, s.grade, p.name, p.position
from student s, professor p
where s.profno = p.profno(+)
union
select s.name, s.grade, p.name, p.position
from student s, professor p
where s.profno = p.profno(+);

--full outer join : left outer join + right outer join

select studno, s.name, s.profno, p.name
from student s
full outer join professor p on s.profno = p.profno;

---self join : 하나의 테이블내에 있는 칼럼끼리 연결하는 조인이 필요한 경우
-- where 절을 이용한 self join
select dept.dname ||'의 소속은 ' || org.dname
from department dept, department org
where dept.college = org.deptno;
-- join~on 절을 이용한 self join
select dept.dname ||'의 소속은 ' || org.dname
from department dept join department org
on dept.college = org.deptno;

