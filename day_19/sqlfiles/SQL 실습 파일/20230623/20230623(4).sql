--1. 학과별 학생수가 최대인 학과번호, 학과명,  학생 수를 출력하세요.
--select * from students ;
select s.deptno 학과번호,d.dname, count(*) "학생 수"
from student s inner join department d
        on s.deptno = d.deptno
group by s.deptno, d.dname
having count(*) = (select max(count(*)) 
                    from student 
                    where deptno is not null
                    group by deptno);
                
--select * from locations;
--2. Sales부서에 근무하는 사원에 대해 last_name, job_id, 부서번호, 부서이름을 
-- last_name 순으로 출력하세요.(결과-34건)

select e.last_name, e.job_id,d.department_id, d.department_name
from employees e, departments d
where d.department_name = 'Sales' and e.department_id = d.department_id;

-- 3. oxford에서 근무하는 모든 사원에 대해 
-- last_name, job, 부서번호, 부서이름, 부서위치(city)를 출력하세요.(결과-34건)

select e.last_name, e.job_id, d.department_id,d.department_name, l.city
from employees e, departments d, locations l
where d.location_id = (select location_id from locations where city = 'Oxford')
and d.location_id = l.location_id
and e.department_id = d.department_id;