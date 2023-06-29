select * from emp;
select * from dept;

/*emp,dept 테이블을 조회하여 부서번호와 부서별 최대 급여, 부서명 출력*/
select e.deptno, d.dname, max_sal
from (select deptno ,max(sal) max_sal
        from emp
        group by deptno) e, dept d
where e.deptno = d.deptno
order by deptno;
/*empno, ename, deptno 열만을 포함하는 emp 테이블의 구조를 기초로
emp1테이블을 생성, 새 테이블에서 ID, LAST_NAME과 DEPT_ID로 열 이름 지정*/
create table emp1(id,last_name,dept_id)
as
select empno, ename,deptno from emp;

/*이전 단계에서 생성한 EMP1테이블에서 LAST_NAME 필드를 10--> 30 수정*/
alter table emp1
modify last_name varchar2(30);
/*SYSTEM이나 SYS소유의 EMPLOYEE 테이블을 생성하고 데이터를 하나 입력*/

/*SYSTEM의 EMPLOYEE 테이블에 대해 PUB_EMPLOYEE 라는 공용 동의어 생성*/
/*이전 단계에서 생성한 공용 동의어에 의해 SYSTEM 소유의 EMPLOYEE 테이블을
HR유저가 조회하도록*/
/*공용동의어 PUB_EMPLOYEE 삭제*/
