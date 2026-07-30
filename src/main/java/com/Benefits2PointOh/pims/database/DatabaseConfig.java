package com.Benefits2PointOh.pims.database;

/*
-- Database Configuration
Stores all settings required to connect to MySQL.
For database name, username or password changes, only update this file.
 */
public final class DatabaseConfig {

    private DatabaseConfig() {
    }

    public static final String HOST = "localhost";

    public static final String PORT = "3306";

    public static final String DATABASE =
            "pharmacy_inventory_management_system";

    public static final String USERNAME = "root";

    public static final String PASSWORD = "Password";

}