#다음과 같이 테이블과 데이터를 준비하세요.
#(준비완료)

# 앞에서 정의한 3개의 테이블을 이용해서 다음을 처리하세요.
# # ○ 학생 테이블, 동아리 테이블, 학생 동아리 테이블을 이용해서 학생을 기준으로 학생 이름/지역/가입한 동아리/
# # 동아리방을 출력하세요.
USE sqldb;
SELECT
    s.stdname AS '학생이름',
    s.addr AS '지역',
    c.clubname AS '가입한 동아리',
    c.roomno AS '동아리방'
FROM stdtbl s
         JOIN stdclubtbl sc ON s.stdname = sc.stdname
         JOIN clubtbl c ON sc.clubname = c.clubname;

# 동아리를 기준으로 가입한 학생의 목록을 출력하세요.
#  출력정보: clubName, roomNo, stdName, addr
SELECT
    c.clubname AS '동아리명',
    c.roomno AS '동아리방',
    s.stdname AS '학생이름',
    s.addr AS '지역'
FROM clubtbl c
         JOIN stdclubtbl sc ON c.clubname = sc.clubname
         JOIN stdtbl s ON sc.stdname = s.stdname;

#다음과 같이 테이블과 데이터를 준비하세요.
#(준비완료)

# 앞에서 추가한 테이블에서 '우대리'의 상관 연락처 정보를 확인하세요.
# ○ 출력할 정보
#  부하직원, 직속상관, 직속상관연락처
SELECT
    e.emp AS '부하직원',
    m.manager AS '직속상관',
    m.empTel AS '직속상관연락처'
FROM sqldb.emptbl e
         JOIN sqldb.emptbl m ON e.manager = m.emp
WHERE e.emp = '우대리';

# 현재 재직 중인 직원의 정보를 출력하세요
# ○ 출력 항목: emp_no, first_name, last_name, title
SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    t.title
FROM employees.employees e
         JOIN employees.titles t ON e.emp_no = t.emp_no
WHERE t.to_date = '9999-01-01';

# 현재 재직 중인 직원 정보를 출력하세요
# ○ 출력항목: 직원의 기본 정보 모두, title, salary
SELECT
    e.*,
    t.title,
    s.salary
FROM employees.employees e
         JOIN employees.titles t ON e.emp_no = t.emp_no
         JOIN employees.salaries s ON e.emp_no = s.emp_no
WHERE t.to_date = '9999-01-01'
  AND s.to_date = '9999-01-01';

# 현재 재직중인 직원의 정보를 출력하세요.
# ○ 출력항목: emp_no, first_name, last_name, department
# ○ 정렬: emp_no 오름 차순
USE employees;
SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    d.dept_name
FROM employees e
         JOIN dept_emp de ON e.emp_no = de.emp_no
         JOIN departments d ON de.dept_no = d.dept_no
WHERE de.to_date = '9999-01-01'
ORDER BY e.emp_no ASC;

# 부서별 재직중인 직원의 수를 출력하세요.
# ○ 출력 항목: 부서 번호, 부서명, 인원수
# ○ 정렬: 부서 번호 오름차순
SELECT
    d.dept_no,
    d.dept_name,
    COUNT(*) AS '인원수'
FROM employees.dept_emp de
         JOIN employees.departments d ON de.dept_no = d.dept_no
WHERE de.to_date = '9999-01-01'
GROUP BY d.dept_no, d.dept_name
ORDER BY d.dept_no ASC;

# 직원 번호가 10209인 직원의 부서 이동 히스토리를 출력하세요.
# ○ 출력항목: emp_no, first_name, last_name, dept_name, from_date, to_date
SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    d.dept_name,
    de.from_date,
    de.to_date
FROM employees.employees e
         JOIN employees.dept_emp de ON e.emp_no = de.emp_no
         JOIN employees.departments d ON de.dept_no = d.dept_no
WHERE e.emp_no = 10209
ORDER BY de.from_date;


