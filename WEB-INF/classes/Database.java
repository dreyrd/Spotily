import java.sql.*;
import javax.sql.rowset.CachedRowSet;
import javax.sql.rowset.RowSetProvider;
public class Database {

    private static final String SGBD = "postgresql";
    private static final String SERVER = "localhost";
    private static final String PORTA = "5432";
    private static final String DATABASE = "spotily";
    private static final String USUARIO = "postgres";
    private static final String SENHA = "123";
    private static final String URL = "jdbc:" + SGBD + "://" + SERVER + ":" + PORTA + "/" + DATABASE;

    private Database() {
        
    }


    public static Connection conectar() throws SQLException {
        return DriverManager.getConnection(URL, USUARIO, SENHA);
    }


    public static CachedRowSet executarSelect(String queryStmt) throws SQLException {
        try (Connection con = conectar();
             Statement stmt = con.createStatement();
             ResultSet resultSet = stmt.executeQuery(queryStmt)) {
            
            CachedRowSet crs = RowSetProvider.newFactory().createCachedRowSet();
            crs.populate(resultSet);
            return crs;
        }
    }

    public static void executarQueryInterna(String queryStmt) throws SQLException {
        try (Connection con = conectar();
             Statement stmt = con.createStatement()) {
            stmt.executeUpdate(queryStmt);
        }
    }

    public static CachedRowSet executarSelect(String queryStmt, Object... params) throws SQLException {
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


// usar = String sql = "UPDATE livros SET estoque = ? WHERE id = ?"; Database.executarQueryParametrizada(sql, 10, 1);