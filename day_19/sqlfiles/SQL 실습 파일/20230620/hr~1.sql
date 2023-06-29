--4. 데이터 타입

desc student;
--char 데이터타입

-- 테이블 생성
create table ex_type
(c char(10), v varchar2(10));
-- 데이터 삽입
insert into ex_type
values('sql','sql');
-- 결과 확인
select *
from ex_type
where c='sql';
-- char와 varchar의 길이가 다르므로 비교결과가 거짓
select *
from ex_type
where c=v;


-- number 데이터 타입
-- date 데이터 타입
/*오늘 날짜 출력*/
select sysdate from dual;
-- LOB 데이터 타입
-- ROEWID 데이터 타입(데이터 주소)

select * from emp;
select rowid, empno,ename from emp;
select rowid, empno,ename from emp 
where rowid = 'AAAE5wAAEAAAAHsAAJ';


select rowid, name from professor;
select rowid, name from professor
where rowid = 'AAAE51AAEAAAAIUAAE';

--timestamp 데이터 타입
create table ex_time
(id  number(2),
basictime  timestamp,
standardtime timestamp with time zone,
localtime timestamp with local time zone);

insert into ex_time
values(1,sysdate,sysdate,sysdate);
-- cmdline에서만 적용되는 코드
set linesize 100
select * from ex_time;

-- DUAL 테이블
desc sys.dual;

select dummy from dual;
/*
오라클이 생성될 때 데이터딕셔너리에 자동 생성, 모든 사용자들의 접근 허용
sys가 소유한 테이블 데이터가 있는 테이블에서 유래하지 않는 상수값, 의사열, 표현식 등의 값을
한 번만 돌리거나 현재 날짜, 시각을 알고자 할 때 이리적 산술, 날짜연산 등에 주요 사용
*/
SELECT 20*30 from dual;

select (sysdate-1) Yesterday, sysdate Today, (sysdate + 1) Tomorrow 
from dual;

