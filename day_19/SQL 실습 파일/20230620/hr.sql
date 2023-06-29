select * from professor;
select * from student;

/** 실습에 사용하는 테이블 확인 **/
SELECT * FROM student;
select * from professor;
select * from department;
select * from salgrade;
select * from tab;

/** 테이블 구조 확인**/
desc student;

desc professor;

/**명령문**/
select deptno, dname, college, loc
from department;

select *
from department;

/**나열된 칼럼 이름 순서대로 출력**/
select dname, deptno
from department;


desc student;
select studno,name,weight
from student;


desc professor;
select profno,name,sal
from professor;

/*distinct - 중복제거*/
select distinct deptno
from student;

select distinct deptno
from professor;

select distinct position
from professor;

select distinct deptno, grade
from student;

select dname dpet_name, deptno as dn
from department;


select name 이름, studno 학번, deptno 학과번호
from student;

select name 교수이름, sal "급여$", deptno "학과번호 No"
from professor;

/* 하나의 칼럼과 다른 칼럼, 산술 표현식 또는 상수 값과 연결하여 하나의 칼럼처럼 출력할 경우 사용 */
select studno || ' ' || name "Student"
from student;

/*사원 테이블에서 열 레이블이 employee and title , 콤마와 공백으로 구분, 이름과 직무를 연결되도록*/

select * from emp;

select ename || ',' || job as "Employee and Title"
from emp;

/*산술 연산자 사용*/
select name, weight, weight * 2.2 as weight_pound
from student;

select empno, ename, job,sal, sal * 1.22 as "New Salary"
from emp;

select empno, ename, job,sal, sal * 1.22 as "New Salary", (sal * 1.22) - sal as "Increase"
from emp;


select studno, name, grade,deptno
from student
where grade=1;

select *
from student
where name = '조명훈';


select name, position, sal
from professor
where position='부교수';


select studno, name, grade, deptno, weight
from student
where weight <= 70;


select studno, name, weight, deptno
from student
where grade='1' and weight >= 70;

select studno, name, weight, deptno, grade
from student
where grade='1' or weight >= 70;



select name, sal, position
from professor
where position ='교수' and sal >= 300;




select studno, name, weight, deptno
from student
where not deptno = 101;

select studno, name, weight, deptno
from student
where not deptno = 101 and weight >= 70;


select studno, name, weight
from student
where weight between 50 and 70;

select * from professor;
select * from emp;
/*1*/
select ename as Name, sal * 12 as "Annual Salary"
from emp;

/*2*/
select ename || ': 1 Month salary = ' || sal "Monthly"
from emp;

/*3*/
select name, deptno
from professor
where not deptno=101 and not deptno=202;

/*4*/
select ename, sal
from emp
where sal>=2850;

/*5*/
select ename as Employee, sal as "Monthly Salary"
from emp
where sal between 1250 and 2800 and not deptno=20;