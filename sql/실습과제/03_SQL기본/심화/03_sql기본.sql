-- 다음 결과가 나오도록 buytbl에 대한 SQL 문을 각각 작성하세요.
SELECT userID AS '사용자 아이디', SUM(amount) AS '총 구매 개수' FROM sqldb.buytbl GROUP BY userID;
SELECT userID AS '사용자 아이디', SUM(price) AS '총 구매 액' FROM sqldb.buytbl GROUP BY userID;

-- 다음 결과가 나오도록 buytbl에 대한 SQL 문을 각각 작성하세요.
SELECT AVG(amount) AS '평균 구매 개수' FROM sqldb.buytbl;
SELECT userID, AVG(amount) AS '평균 구매 개수' FROM sqldb.buytbl GROUP BY userID;

-- 다음 결과가 나오도록 usertbl에 대한 SQL 문을 작성하세요.
-- 가장 키가 큰 사람과 가장 키가 작은 사람을 출력함
SELECT name, height FROM sqldb.usertbl
WHERE height = (SELECT MAX(height) FROM usertbl)
   OR height = (SELECT MIN(height) FROM usertbl);

-- 다음 결과가 나오도록 usertbl에 대한 SQL 문을 작성하세요.
SELECT COUNT(*) AS '휴대폰이 있는 사용자'
FROM sqldb.usertbl
WHERE mobile1 IS NOT NULL AND mobile2 IS NOT NULL;

-- 사용자별 총 구매액을 출력하세요.
SELECT userID AS '사용자', SUM(price * amount) AS '총 구매액'
FROM sqldb.buytbl
GROUP BY userID;

-- 총 구매액이 1,000이상인 사용자만 출력하세요.
SELECT userID AS '사용자',SUM(price * amount) AS '총 구매액'
FROM sqldb.buytbl GROUP BY userID HAVING SUM(price * amount) >= 1000;

-- city 테이블에서 국가코드가 'KOR'인 도시들의 인구수 총합을 구하시오.
SELECT SUM(Population) AS '총합'
FROM world.city
WHERE CountryCode = 'KOR';

-- city 테이블에서 국가코드가 'KOR'인 도시들의 인구수 중 최소값을 구하시오. 결과 필드명은 '최소값'
SELECT MIN(Population) AS '최소값'
FROM world.city
WHERE CountryCode = 'KOR';

-- city 테이블에서 국가코드가 'KOR'인 도시들의 평균 인구수를 구하시오.
SELECT AVG(Population) AS '평균'
FROM world.city
WHERE CountryCode = 'KOR';

-- city 테이블에서 국가코드가 'KOR'인 도시들의 인구수 중 최대값을 구하시오. 결과 필드명은 '최대값'
SELECT MAX(Population) AS '최대값'
FROM world.city
WHERE CountryCode = 'KOR';

-- country 테이블 각 레코드의 Name 칼럼의 글자수를 표시하시오.
SELECT Name, CHAR_LENGTH(Name) AS '글자수'
FROM world.country;

-- country 테이블의 나라명(Name 칼럼)을 앞 세글자만 대문자로 표시하시오.
SELECT UPPER(LEFT(Name, 3)) AS '앞세글자'
FROM world.country;

-- country 테이블의 기대수명(LifeExpectancy)을 소수점 첫째자리에서 반올림해서 표시하시오.
SELECT Name, ROUND(LifeExpectancy, 1) AS '기대수명(반올림)'
FROM world.country;

-- buytbl 테이블에서 사용자별 총 구매액을 구하시오.
SELECT userID AS '사용자', SUM(price * amount) AS '총 구매액'
FROM sqldb.buytbl
GROUP BY userID;

-- 총 구매액이 1,000 이상인 사용자만 출력하시오.
SELECT userID AS '사용자', SUM(price * amount) AS '총 구매액'
FROM sqldb.buytbl
GROUP BY userID
HAVING SUM(price * amount) >= 1000;

-- employees db에서 각 부서별 관리자를 출력하세요. (재직자만)
SELECT dept_no, emp_no
FROM employees.dept_manager
WHERE to_date = '9999-01-01';

-- 부서번호 d005 부서의 현재 관리자 정보를 출력하세요.
SELECT *
FROM employees.dept_manager
WHERE dept_no = 'd005' AND to_date = '9999-01-01';

-- employees 테이블에서 8번 페이지(입사일 내림차순, 20명씩) 출력
SELECT *
FROM employees.employees
ORDER BY hire_date DESC
LIMIT 140, 20; -- (8페이지 - 1) * 20 = 140

-- employees db에서 재직자의 총 수를 구하시오.
SELECT COUNT(*) AS '재직자 수'
FROM employees.dept_emp
WHERE to_date = '9999-01-01';

-- employees db에서 재직자의 평균 급여를 출력하시오.
SELECT AVG(salary) AS '재직자 평균 급여'
FROM employees.salaries
WHERE to_date = '9999-01-01';

-- 재직자 전체 평균 급여보다 급여를 더 많이 받는 재직자를 출력하세요.
SELECT emp_no, salary
FROM employees.salaries
WHERE to_date = '9999-01-01'
  AND salary > (
    SELECT AVG(salary)
    FROM employees.salaries
    WHERE to_date = '9999-01-01'
);

-- employees db에서 각 부서별 재직자의 수를 구하시오.
SELECT dept_no, COUNT(*) AS '재직자 수'
FROM employees.dept_emp
WHERE to_date = '9999-01-01'
GROUP BY dept_no
ORDER BY dept_no ASC;

