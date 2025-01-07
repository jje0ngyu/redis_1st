package com.hangheacinema;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MySQLConnectionTest {
    public static void main(String[] args) {
        // Docker MySQL 설정
        String jdbcUrl = "jdbc:mysql://localhost:3307/mydatabase"; // MySQL URL (Docker의 MySQL 컨테이너와 연결)
        String username = "myuser"; // MySQL 사용자 이름
        String password = "secret"; // MySQL 비밀번호

        // 테스트용 쿼리
        String testQuery = "SELECT 1";

        try (Connection connection = DriverManager.getConnection(jdbcUrl, username, password)) {
            System.out.println("MySQL 연결 성공!");

            // 간단한 쿼리 실행
            try (PreparedStatement statement = connection.prepareStatement(testQuery);
                 ResultSet resultSet = statement.executeQuery()) {

                if (resultSet.next()) {
                    System.out.println("테스트 쿼리 실행 성공: " + resultSet.getInt(1));
                } else {
                    System.out.println("테스트 쿼리 결과가 없습니다.");
                }
            }
        } catch (Exception e) {
            System.err.println("MySQL 연결 실패:");
            e.printStackTrace();
        }
    }
}
