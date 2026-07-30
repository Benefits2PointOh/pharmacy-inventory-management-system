package com.Benefits2PointOh.pims.app;

import com.Benefits2PointOh.pims.database.DatabaseConnection;
import java.sql.Connection;

public class App {

    public static void main(String[] args) {

        System.out.println("Starting Pharmacy Inventory Management System...");

        Connection connection = DatabaseConnection.getConnection();

        if (connection != null) {

            System.out.println("Application is ready.");

        } else {

            System.out.println("Application failed to start.");

        }

    }

}