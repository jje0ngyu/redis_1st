# MySQL 8.0.22 이미지를 기반으로 시작
FROM mysql:8.0.22

# 기본 환경 변수 설정 (MySQL root 암호, 사용자, 데이터베이스)
ENV MYSQL_ROOT_PASSWORD=verysecret
ENV MYSQL_DATABASE=mydatabase
ENV MYSQL_USER=myuser
ENV MYSQL_PASSWORD=secret

# MySQL 초기화 스크립트를 컨테이너로 복사 (필요시 설정)
# COPY ./init.sql /docker-entrypoint-initdb.d/

# 기본 포트 노출
EXPOSE 3306

# MySQL 기본 실행 명령어 유지
CMD ["mysqld"]
