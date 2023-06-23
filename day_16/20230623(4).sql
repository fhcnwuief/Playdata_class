--1. �а��� �л����� �ִ��� �а���ȣ, �а���,  �л� ���� ����ϼ���.
--select * from students ;
select s.deptno �а���ȣ,d.dname, count(*) "�л� ��"
from student s inner join department d
        on s.deptno = d.deptno
group by s.deptno, d.dname
having count(*) = (select max(count(*)) 
                    from student 
                    where deptno is not null
                    group by deptno);
                
--select * from locations;
--2. Sales�μ��� �ٹ��ϴ� ����� ���� last_name, job_id, �μ���ȣ, �μ��̸��� 
-- last_name ������ ����ϼ���.(���-34��)

select e.last_name, e.job_id,d.department_id, d.department_name
from employees e, departments d
where d.department_name = 'Sales' and e.department_id = d.department_id;

-- 3. oxford���� �ٹ��ϴ� ��� ����� ���� 
-- last_name, job, �μ���ȣ, �μ��̸�, �μ���ġ(city)�� ����ϼ���.(���-34��)

select e.last_name, e.job_id, d.department_id,d.department_name, l.city
from employees e, departments d, locations l
where d.location_id = (select location_id from locations where city = 'Oxford')
and d.location_id = l.location_id
and e.department_id = d.department_id;