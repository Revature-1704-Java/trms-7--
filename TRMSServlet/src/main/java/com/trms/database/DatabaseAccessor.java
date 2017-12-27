package com.trms.database;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

public class DatabaseAccessor {

    private Connection connection;

    public DatabaseAccessor() {
        try {
            connection = ConnectionUtil.getConnection();
        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }
    }

}
