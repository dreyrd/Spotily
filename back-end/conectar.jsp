<%@ page import="java.sql.*" %>
<%
  String url = "jdbc:mysql://127.0.0.1:3306/spotily";
  String user = "root";
  String password = "";
  Connection conexao = null;
  try {
      Class.forName("com.mysql.jdbc.Driver"); // Dependendo do banco, o driver pode ser diferente
      conexao = DriverManager.getConnection(url, user, password);
  } catch (SQLException | ClassNotFoundException e) {
      e.printStackTrace();
  }
%>