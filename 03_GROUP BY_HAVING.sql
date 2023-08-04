/* SELECT 문 해석순서
 * 
 * 5 : SELECT 컬럼명 AS별칭, 계산식, 함수식
 * 1 : FROM 참조할 테이블명
 * 2 : WHERE 컬럼명 | 함수식 비교연산자 비교값
 * 3 : GROUP BY 그룹을 묶을 컬럼명
 * 4 : HAVING 그룹함수식 비교연산자 비교값
 * 6 : ORDER BY 컬럼명 | 별칭 | 컬럼순번 정렬방식 [NULLS FIRST | LAST]
 * 
 */

-----------------------------------------------------------------------------

-- GROUP BY 절 : 같은 값들이 여러개 기록된 컬럼을 가지고 같은 값들을 하나의 그룹으로 묶음
-- 같은 값들을 하나의 그룹으로 묶음
-- GROUP BY 컬럼명 | 함수식, ...
-- 여러개의 값을 묶어서 하나로 처리할 목적으로 사용함
-- 그룹으로 묶은 값에 대해서 SELECT절에서 그룹함수를 사용함

-- 그룹 함수는 단 한개의 결과값만 산출하기 때문에
-- 그룹이 여러개일 경우 오류 발생


-- EMPLOYEE 테이블에서 부서코드, 부서별 급여 합 조회
-- 1) 부서코드만 조회
SELECT DEPT_CODE FROM EMPLOYEE; -- 23행

-- 2) 전체 급여 합 조회
SELECT SUM(SALARY) FROM EMPLOYEE; -- 1행

SELECT DEPT_CODE, SUM(SALARY) -- 5
FROM EMPLOYEE; -- 1
GROUP BY DEPT_CODE; -- 3 DEPT_CODE가 같은 행끼리 하나의 그룹이 됨
--SQL Error [937] [42000]: ORA-00937: 단일 그룹의 그룹 함수가 아닙니다

-- EMPLOYEE 테이블에서
-- 직급 코드가 같은 사람의 직급코드, 급여 평균, 인원수를
-- 직급코드 오름 차순으로 조회

SELECT JOB_CODE, ROUND(AVG(SALARY)), COUNT(*)
FROM EMPLOYEE
GROUP BY JOB_CODE
ORDER BY JOB_CODE;








