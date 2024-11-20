<%@ page import="banco.DatabaseTeste" %>
<%@ page import="java.sql.*, javax.sql.rowset.*" %>
<%
    out.println("oi");
    String query = "DELETE FROM livro WHERE descricao LIKE 'Romeu%'";
    DatabaseTeste.executarQuery(query);
%>