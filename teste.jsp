<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="./banco/database.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
    <%
        ResultSet rs = null;
        try {
            String query = "SELECT * FROM espaco";
            String titulo = "";
            rs = executarSelect(query);
            while (rs != null && rs.next()) {
                titulo = rs.getString("titulo");
                out.println(titulo);
            }
        } catch (Exception e) {
            out.println("Erro ao buscar espaços: " + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    out.println("Erro ao fechar ResultSet: " + e.getMessage());
                }
            }
        }
    %>


</body>
</html>