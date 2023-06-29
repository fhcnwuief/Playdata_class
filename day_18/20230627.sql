/**인덱스**/
-- SQL 명령문의 처리 속도를 향상시키기 위해 칼럼에 대해 생성하는 객체
-- 포인트를 이용하여 테이블에 저장된 데이터를 랜덤 액세스하기 위함

/*고유 인덱스*/
-- 유일한 값을 가지는 칼럼에 대해 생성하는 인덱스로
-- 모든 인덱스 키는 테이블의 하나의 행과 연결
-- 만일 부서 이름이 중복되면 고유 인덱스가 생성되지 않음
create unique index idx_dept_name
on department(dname);

/*비고유 인덱스*/
-- 중복된 값을 가지는 칼럼에 대해 생성하는 인덱스로
-- 나하의 인덱스 키는 테이블의 여러 행과 연결될 수 있다
create index idx_stud_birthdate
on student(birthdate);

/*단일 인덱스*/
-- 하나의 칼럼으로만 구성된 인덱스
/*결합 인덱스*/
-- 두 개 이상의 칼럼을 결합하여 생성하는 인덱스
create index idx_stud_dno_grade
on student(deptno,grade);

/*DESCENDING INDEX*/
-- 칼럼별로 정렬 순서를 별도로 지정하여
-- 결합 인덱스를 생성하기 위한 방법
create index fidx_stud_no_name 
on student(deptno desc, name asc);

/*함수 기반 인덱스*/
-- upper(column_name)/lower(column_name)키워드로 정의된
-- 함수기반 인덱스를 사용하면 대소문자 구분 없이 검색 가능

create index uppercase_idx on emp (upper(ename));
select * from emp where upper(ename) = 'KING';

/* 학생 테이블에서 학생들의 비만도 측정을 위해 표준 체중을 구하고자 함
표준 체중에 대한 함수 기반 인덱스 생성 */

create index idx_standard_weight on student((height-100)*0.9);


/**인덱스 실행 경로 확인**/
-- 실행 경로 : 명령문이 내부적으로 처리되는 경로
-- cmd 창에서 실행 또는
-- F10을 누르면 실행 경로 확인 가능

/*학과 테이블에서 학과 이름이 '정보미디어학부'인 학과 번호를
검색한 결과에 대한 실행경로를 분석하라. dname 컬럼에 고유 인덱스가
생성되어 잇다*/
select deptno, dname
from department
where dname = '정보미디어학부';

-- idx_dept_name 인덱스 삭제
drop index idx_dept_name;
-- dname칼럼에 생성된 인덱스가 삭제되어 전체 테이블을 검색
select deptno, dname
from department
where dname = '정보미디어학부';

/*학생 테이블에서 생일이'79/04/02'인 학생 이름을 검색한 결과에 대한
실행 경로를 분석
birthdate 칼럼에 대해 비고유 인덱스가 생성되어 잇음*/

-- birthdate 칼럼에 생성된 idx_stud_birthdate 인덱스를 이용한 랜덤엑세스
select name, birthdate
from student
where birthdate = '79/04/02';

/**인덱스 정보 조회**/
-- 인덱스 이름과 이율성 여부 등을 확인

select index_name, uniqueness
from user_indexes
where table_name = 'STUDENT';

-- 인덱스의 이름, 인덱스가 생성된 테이블 이름과 칼럼 이름 등을 확인
select index_name, column_name
from user_ind_columns
where table_name = 'STUDENT';

--인덱스 삭제 : drop index

/*인덱스 재구성*/
-- 인덱스를 정의한 테이블의 칼럼 값에 대해 변경 작업이 자주 발생하여,
-- 불필요하게 생성된 인덱스 내부 노드를 정리하는 작업

alter index stud_no_pk rebuild;




돈 내게 해주세여 제발ㅠㅜㅠㅜㅠ 2번이나 튕기는게 어딧서ㅓ ㅠㅜ