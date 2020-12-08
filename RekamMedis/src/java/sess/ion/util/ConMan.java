package sess.ion.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConMan {

    private Connection conn;
    private String url = "jdbc:mysql://localhost:3306/sik";
    private String user = "root";
    private String password = "";

    public ConMan(String url, String user, String password) {
        this.url = url;
        this.user = user;
        this.password = password;

    }

    public ConMan() {
    }

    public void logOff() {
        try {
            if (conn != null) {
                conn.close();
                System.out.println("Connection Closed");
            }
        } catch (SQLException e) {
            System.out.println("Connection Error : " + e.getMessage());
        }
    }
    public static void main(String args[]){
       ConMan cm = new ConMan();
       cm.logOn();
    }

    public Connection logOn() {
        conn = null;
        try {
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(url, user, password);
            System.out.println("Connected Successded");
        } catch (SQLException e) {
            System.out.println("Connection Error : " + e.getMessage());
        }
        return conn;
    }
}

