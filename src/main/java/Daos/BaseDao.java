package Daos;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;

public abstract class BaseDao {

    public Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e1) {
            e1.printStackTrace();
        }

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/bi_corp_business?serverTimeZone=America/Lima";

        return DriverManager.getConnection(url, user, pass);
    }
}