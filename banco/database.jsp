<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%!
    private static final String USUARIO = "root";
    private static final String SENHA = "";
    private static final String URL = "jdbc:mysql://127.0.0.1:3306/spotily";

    public static Connection conectar() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USUARIO, SENHA);
        } catch (SQLException | ClassNotFoundException e) {
            throw new SQLException("Connection failed", e);
        }
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

    public static void executarQuery(String queryStmt) throws SQLException {
        try (Connection con = conectar();
             Statement stmt = con.createStatement()) {
            stmt.executeUpdate(queryStmt);
        }
    }

    public static void executarQueryExterno(String queryStmt, Object... params) throws SQLException {
        try (Connection con = conectar();
             PreparedStatement pstmt = con.prepareStatement(queryStmt)) {
             
            for (int i = 0; i < params.length; i++) {
                pstmt.setObject(i + 1, params[i]);
            }
            pstmt.executeUpdate();
        }
    }
%>