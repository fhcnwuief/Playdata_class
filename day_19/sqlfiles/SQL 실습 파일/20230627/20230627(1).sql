/**뷰(view)**/
-- 하나 이상의 기본 테이블이나 다른 뷰를 이용하여 생성되는 가상 테이블
-- 전체 데이터중에서 일부만 접근할 수 있도록 제한
-- 테이블에서 파생된 객체 테이블과 유사하게 사용
-- 뷰에 대한 수정 결과는 뷰를 정의한 기본 테이블에 적용
-- 뷰를 정의 한 기본 테이블에서 정의된 무결성 제약 조건 상속

/*가상 테이블*/
-- 테이블은 디스크에 공간이 할당되어 데이터를 저장
-- 뷰틑 데이터딕셔너리 테이블에 뷰에 대한 정의만 저장
-- 디스크 저장공간 할당이 안됨

/*장점*/
-- 데이터를 보호하기 위한 보안
-- 사용자 편의성

/*단순 뷰 : 하나의 기본 테이블에 의해 정의한 뷰,
        DML 명령문의 실행 결과 기본 테이블에 반영
복합 뷰 : 두개 이상의 기본 테이블로 구성한 뷰
        무결성 제약조건, 표현식, group by절의 유무에 따라 DML 명령문의 제한적 사용
*/



/**뷰의 생성**/
/*CREATE VIEW : 뷰 생성 시 칼럼 이름을 명시 하지 않으면 기본 테이블의 칼럼 이름 상속
            함수나 표현식에 의해 정의 된 칼럼을 별도로 이름을 명시*/

-- 단순 뷰
create view v_stud_dept101 as
select studno, name, deptno
from student
where deptno = 101;
-- 복합 뷰
create view v_stud_dept102
as select s.studno, s.name, s.grade, d.dname
from student s, department d
where s.deptno = d.deptno and s.deptno = 102;

select * from v_stud_dept102;
-- 함수를 사용하여 뷰 생성
create view v_prof_avg_sal
as select deptno, sum(sal) sum_sal, avg(sal) avg_sal
from professor
group by deptno;

/**인라인 뷰**/
/*from 절에서 참조하는 테이블의 크기가 클 경우,
필요한 행과 컬럼만으로 구성된 집합을 재정의 하여 질의문 효율적 구성*/

select dname, avg_height, avg_weight
from (select deptno, avg(height) avg_height, avg(weight) avg_weight
        from student
        group by deptno)s, department d
where s.deptno = d.deptno;


-- 학과별 최대 키를 구하고 최대키를 가진 학생의 학과명, 
-- 최대키 ,이름, 키 출력
select * from department;
select * from student;



select d.dname, a.max_height, s.name, s.height
from (select deptno, max(height) max_height
        from student
        group by deptno) a, department d, student s
where s.deptno = a.deptno
and s.height = a.max_height
and s.deptno = d.deptno;


/**뷰에 대한 질의의 내부적인 처리 과정**/
-- user_view 데이터 딕셔너리에서 뷰에 대한 정의 를 조회
-- 기본 테이블에 대한 뷰의 접근 권한을 확인
-- 뷰에 대한 질의를 기본 테이블에 대한 질의 로 변환
-- 기본 테이블에 대한 질의를 통해 데이터를 검색
-- 검색된 결과를 출력

select view_name, text
from user_views;


/**뷰의 변경**/
-- 기존 뷰에 대한 정의를 삭제한 후 재생성

/*단순 뷰*/
-- 기본 테이블과 동일하게 DML 명령문 사용
-- 내부적으로 기본 테이블에 대한 데이터를 조작
-- 뷰에 대한 무결성 제약조건도 기본 테이블에 정의 된 무결성 제약조건 적용

/*복합 뷰*/
-- DML 명령어 사용 제한


/*뷰의 삭제*/
-- 뷰는 실체가 없는 가상 테이블이므로 데이터 딕셔너리에 저장된 뷰의 정의를 삭제
-- 뷰를 정의 한 기본 테이블의 구조나 데이터에는 전혀 영향 없음
drop view v_stud_dept101;

drop view v_stud_dept102;