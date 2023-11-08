package Main;

import view.login;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Run {

    static public Connection conn;
    static public Statement stmt;
    static public login login;

    static public void ConnecSQL() throws SQLException, ClassNotFoundException {
        {
            conn = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
                conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/librarymanagementsystem", "root", "admin");
                System.out.println("Noi ket thanh cong");
            } catch (Exception ex) { //xử lý ngoại lệ nếu có
                System.out.println("Noi ket khong thanh cong");
                ex.printStackTrace();
            }
            stmt = conn.createStatement();
        }
    }

    public static void main(String args[]) throws SQLException, ClassNotFoundException {
        ConnecSQL();
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                login = new login();
                login.setVisible(true);
            }
        });
    }
}
