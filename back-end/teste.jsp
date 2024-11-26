<%@ include file="/banco/database.jsp" %>
<%@ page import="java.sql.*, javax.sql.rowset.*" %>
<%

String query = "SELECT * FROM usuario WHERE cpf LIKE ? AND senha LIKE ?";
String cpf = "123";
String senha = "123";
//query onde o usuario digita
executarQueryExterno(query, cpf, senha);

//query interna que soh nos digitamos, eh um pouco mais rapida e simples
String queryDesenvolvedor = "SELECT * FROM usuario WHERE cpf LIKE '" + cpf + "' AND senha LIKE '" + senha + "'";
executeQuery(queryDesenvolvedor);
%>