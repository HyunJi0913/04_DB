# sqldb에서 usertbl 테이블에서 다음 내용들을 확인하세요
USE sqldb;
SELECT * FROM usertbl;
SHOW INDEX FROM usertbl;

# usertbl의 addr 컬럼에 대해 idx_usertbl_addr이름으로 인덱스를 만들고,
# 인덱스 목록을 확인하세요.
CREATE INDEX idx_usertbl_addr ON usertbl(addr);
SHOW INDEX FROM usertbl;

# usertbl의 상태를 출력하여 인덱스의 내용이 만들어졌는지 확인하고,
# 내용이 없다면 실제 적용되도록 한 후, 인덱스의 크기를 확인하세요.
SHOW INDEX FROM usertbl;
CREATE INDEX idx_usertbl_addr ON usertbl(addr);

# usertbl에 대해 다음을 처리하세요.
CREATE INDEX idx_usertbl_birthYear ON usertbl(birthYear);
CREATE INDEX idx_usertbl_nam ON usertbl(name);
# 이미 name 컬럼에 PRIMARY KEY가 걸려 있으므로,
# 내부적으로 인덱스가 존재합니다.
SHOW INDEX FROM usertbl;

# usertbl에 대해 다음을 처리하세요.
ALTER TABLE usertbl DROP PRIMARY KEY;
CREATE INDEX idx_usertbl_name_birthYear ON usertbl(name, birthYear);
SHOW INDEX FROM usertbl;

# usertbl에서 앞에서 만든 인덱스를 삭제하세요.
-- addr 컬럼 인덱스 삭제
DROP INDEX idx_usertbl_addr ON usertbl;

-- birthYear 컬럼 인덱스 삭제
DROP INDEX idx_usertbl_birthYear ON usertbl;

-- name + birthYear 복합 인덱스 삭제
DROP INDEX idx_usertbl_name_birthYear ON usertbl;

# 다음과 같이 실습 데이터베이스 및 사용자를 생성하고,
# 해당 데이터베이스에 대해 모든 권한을 부여하세요
-- 1. 데이터베이스 생성
CREATE DATABASE scoula_db;

-- 2. 사용자 생성 (모든 호스트에서 접속 가능하게 % 사용)
CREATE USER 'scoula'@'%' IDENTIFIED BY '1234';

-- 3. 권한 부여 (해당 데이터베이스에 대해 모든 권한 부여)
GRANT ALL PRIVILEGES ON scoula_db.* TO 'scoula'@'%';

-- 4. 권한 적용
FLUSH PRIVILEGES;
