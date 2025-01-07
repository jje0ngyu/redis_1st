-- MySQL 유저 생성 및 권한
CREATE USER 'myuser'@'%' IDENTIFIED BY 'secret';
CREATE USER 'myuser'@'localhost' IDENTIFIED BY 'secret';
GRANT ALL PRIVILEGES ON mydatabase.* TO 'myuser'@'%';
GRANT ALL PRIVILEGES ON mydatabase.* TO 'myuser'@'localhost';
FLUSH PRIVILEGES;


-- SQL 생성
-- 영화 테이블
CREATE TABLE MOVIE (
                       MOVIE_ID INT PRIMARY KEY AUTO_INCREMENT, -- 영화 ID
                       MOVIE_NM VARCHAR(100) NOT NULL, -- 영화명
                       GENRE VARCHAR(50) NOT NULL, -- 장르
                       AGE_RATING CHAR(3) NOT NULL, -- 영상물 등급
                       RELEASE_DT DATE NOT NULL, -- 개봉일
                       DURATION VARCHAR(10) NOT NULL, -- 상영시간
                       DIRECTOR VARCHAR(100), -- 감독
                       THUMB_URL VARCHAR(255), -- 썸네일 이미지 URL
                       INS_DE DATETIME DEFAULT CURRENT_TIMESTAMP, -- 작성일
                       INS_ID VARCHAR(50), -- 작성자
                       UPT_DE DATETIME, -- 수정일
                       UPT_ID VARCHAR(50) -- 수정자
);

-- 상영관 테이블
CREATE TABLE THEATER (
                       THEATER_ID INT PRIMARY KEY AUTO_INCREMENT, -- 상영관 ID
                       THEATER_NM VARCHAR(100) NOT NULL, -- 상영관명
                       LOCATION VARCHAR(255) NOT NULL, -- 위치
                       INS_DE DATETIME DEFAULT CURRENT_TIMESTAMP, -- 작성일
                       INS_ID VARCHAR(50), -- 작성자
                       UPT_DE DATETIME, -- 수정일
                       UPT_ID VARCHAR(50) -- 수정자
);

-- 좌석 테이블
CREATE TABLE SEAT (
                      SEAT_ID INT PRIMARY KEY AUTO_INCREMENT, -- 좌석 ID
                      THEATER_ID INT NOT NULL, -- 상영관 ID
                      SEAT_NM VARCHAR(20) NOT NULL, -- 좌석명
                      STATUS CHAR(1) NOT NULL, -- 예약 상태
                      INS_DE DATETIME DEFAULT CURRENT_TIMESTAMP, -- 작성일
                      INS_ID VARCHAR(50), -- 작성자
                      UPT_DE DATETIME, -- 수정일
                      UPT_ID VARCHAR(50), -- 수정자
                      FOREIGN KEY (THEATER_ID) REFERENCES THEATER(THEATER_ID)
);

-- 상영 스케줄 테이블
CREATE TABLE SCHEDULE (
                      SCHEDULE_ID INT PRIMARY KEY AUTO_INCREMENT, -- 상영 스케줄 ID
                      THEATER_ID INT NOT NULL, -- 상영관 ID
                      MOVIE_ID INT NOT NULL, -- 영화 ID
                      START_DT DATETIME NOT NULL, -- 상영 시작 시간
                      END_DT DATETIME NOT NULL, -- 상영 종료 시간
                      INS_DE DATETIME DEFAULT CURRENT_TIMESTAMP, -- 작성일
                      INS_ID VARCHAR(50), -- 작성자
                      UPT_DE DATETIME, -- 수정일
                      UPT_ID VARCHAR(50), -- 수정자
                      FOREIGN KEY (THEATER_ID) REFERENCES THEATER(THEATER_ID),
                      FOREIGN KEY (MOVIE_ID) REFERENCES MOVIE(MOVIE_ID)
);

-- 사용자 테이블
CREATE TABLE USER (
                      USER_ID INT PRIMARY KEY AUTO_INCREMENT, -- 사용자 ID
                      USER_NM VARCHAR(100) NOT NULL, -- 사용자명
                      PASSWORD VARCHAR(255) NOT NULL, -- 비밀번호
                      STATUS CHAR(1) NOT NULL, -- 상태
                      INS_DE DATETIME DEFAULT CURRENT_TIMESTAMP, -- 작성일
                      INS_ID VARCHAR(50), -- 작성자
                      UPT_DE DATETIME, -- 수정일
                      UPT_ID VARCHAR(50) -- 수정자
);

-- 예매 테이블
CREATE TABLE BOOKING (
                     BOOKING_ID INT PRIMARY KEY AUTO_INCREMENT, -- 예매 ID
                     SEAT_ID INT NOT NULL, -- 좌석 ID
                     SCHEDULE_ID INT NOT NULL, -- 상영 스케줄 ID
                     USER_ID INT NOT NULL, -- 사용자 ID
                     STATUS CHAR(1) NOT NULL, -- 예매 상태
                     INS_DE DATETIME DEFAULT CURRENT_TIMESTAMP, -- 작성일
                     INS_ID VARCHAR(50), -- 작성자
                     UPT_DE DATETIME, -- 수정일
                     UPT_ID VARCHAR(50), -- 수정자
                     FOREIGN KEY (SEAT_ID) REFERENCES SEAT(SEAT_ID),
                     FOREIGN KEY (SCHEDULE_ID) REFERENCES SCHEDULE(SCHEDULE_ID),
                     FOREIGN KEY (USER_ID) REFERENCES USER(USER_ID)
);