import java.sql.*;
import javax.sql.rowset.CachedRowSet;
import javax.sql.rowset.RowSetProvider;
public class Database {

    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static final String SGBD = "mysql";
    private static final String SERVER = "localhost";
    private static final String PORTA = "3306";
    private static final String DATABASE = "spotily";
    private static final String USUARIO = "root";
    private static final String SENHA = "";
    private static final String URL = "jdbc:" + SGBD + "://" + SERVER + ":" + PORTA + "/" + DATABASE;

    private Database() {
        
    }


    public static Connection conectar() throws SQLException {
        try {
            Class.forName(DRIVER);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return DriverManager.getConnection(URL, USUARIO, SENHA);
    }

    // Para uso exclusivo dos desenvolvedores
    public static CachedRowSet executarSelect(String queryStmt) throws SQLException {
        try (Connection con = conectar();
             Statement stmt = con.createStatement();
             ResultSet resultSet = stmt.executeQuery(queryStmt)) {
            
            CachedRowSet crs = RowSetProvider.newFactory().createCachedRowSet();
            crs.populate(resultSet);
            return crs;
        }
    }

    // Evitar SQL Injection
    public static CachedRowSet executarSelectExterno(String queryStmt, Object... params) throws SQLException {
        try (Connection con = conectar();
             PreparedStatement pstmt = con.prepareStatement(queryStmt)) {
             
            for (int i = 0; i < params.length; i++) {
                pstmt.setObject(i + 1, params[i]);
            }
            
            try (ResultSet resultSet = pstmt.executeQuery()) {
                CachedRowSet crs = RowSetProvider.newFactory().createCachedRowSet();
                crs.populate(resultSet);
                return crs;
            }
        }
    }

    // Para uso exclusivo dos desenvolvedores
    public static void executarQuery(String queryStmt) throws SQLException {
        try (Connection con = conectar();
             Statement stmt = con.createStatement()) {
            stmt.executeUpdate(queryStmt);
        }
    }

    // Evitar SQL Injection
    public static void executarQueryExterna(String queryStmt, Object... params) throws SQLException {
        try (Connection con = conectar();
             PreparedStatement pstmt = con.prepareStatement(queryStmt)) {
             
            for (int i = 0; i < params.length; i++) {
                pstmt.setObject(i + 1, params[i]);
            }
            pstmt.executeUpdate();
        }
    }
}

// Como usar:
// <%@ page import="Database" %>
// String sql = "UPDATE livros SET estoque = ? WHERE id = ?"; 
// Database.executarQueryExterna(sql, 10, 1);