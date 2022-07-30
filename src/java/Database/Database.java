package Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Database {
    
    private static Statement stmt;
    
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aulavirtual", "root", "");
            stmt = con.createStatement();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static int update(String update, Object... args) throws SQLException {
        return stmt.executeUpdate(String.format(update, args));
    }
    
    public static ResultSet query(String query, Object... args) throws SQLException {
        return stmt.executeQuery(String.format(query, args));
    }
    
}