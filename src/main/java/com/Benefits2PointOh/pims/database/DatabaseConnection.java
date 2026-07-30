package com.Benefits2PointOh.pims.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    private static final String URL =
        "jdbc:mysql://"
        + DatabaseConfig.HOST
        + ":"
        + DatabaseConfig.PORT
        + "/"
        + DatabaseConfig.DATABASE;

    private static final String USERNAME = DatabaseConfig.USERNAME;

    /*
    MySQL password
     */
    private static final String PASSWORD = DatabaseConfig.PASSWORD;

    public static Connection getConnection() {

        try {

            Connection connection =
                    DriverManager.getConnection(URL, USERNAME, PASSWORD);

            System.out.println("Database connected successfully.");

            return connection;

        } catch (SQLException e) {

            System.out.println("Failed to connect to the database.");

            e.printStackTrace();

            return null;

        }

    }

}