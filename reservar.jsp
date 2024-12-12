<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="./banco/database.jsp" %>
<% if(session.getAttribute("usuarioAutenticado") == null) response.sendRedirect("entrar.jsp");%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservar</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" defer></script>
    <!-- Boxicons CSS -->
    <link href="https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css" rel="stylesheet">
    <!-- CSS -->
     <link rel="stylesheet" href="styles/styles.css">
</head>
<body style="min-height: 100svh; background-color: #f8f9fa; font-family: Arial, sans-serif;">
    <nav class="navbar navbar-light py-2 gradient-background">
        <div class="d-flex align-items-center bg-light p-2 rounded-circle">
            <i class='bx bx-landscape bx-md'></i>
        </div>
        <a href="./back-end/sair.jsp" class="btn btn-danger">Sair</a>
    </nav>
    <form class="container" action="./back-end/reservar.jsp" method="post">
        <div class="title-section">
            <img src="https://via.placeholder.com/150" alt="Espaço">
            <div class="info">
                
                    <%
                        String id = request.getParameter("id");
                        String titulo = "";
                        String capacidade = "";
                        String descricao = "";
                        ResultSet rs = null;
                        try {
                            String query = "SELECT * FROM espaco where id = " + id + " limit 1";
                            rs = executarSelect(query);

                            if (rs != null && rs.next()) {
                                titulo = rs.getString("titulo");
                                capacidade = rs.getString("capacidade");
                                descricao = rs.getString("descricao");
                                
                            }
                        } catch (Exception e) {
                            out.println("Erro ao buscar espaço: " + e.getMessage());
                        } finally {
                            if (rs != null) {
                                try {
                                    rs.close();
                                    session.setAttribute("idEspaco", id);
                                } catch (SQLException e) {
                                    out.println("Erro ao fechar ResultSet: " + e.getMessage());
                                }
                            }
                        }
                    %>
                <h2><%= titulo %></h2>
                <p id="capacidade">Capacidade: <%= capacidade %></p>
                <p id="descricao">Descrição do espaço: <%= descricao %></p>
            </div>
        </div>
        <div class="calendar-container">
            <div class="calendar">
                <h5>Entrada</h5>
                <input type="date" class="form-control" name="dataEntrada">
            </div>
            <div class="calendar">
                <h5>Saída</h5>
                <input type="date" class="form-control" name="dataSaida">
            </div>
        </div>
        <div class="d-flex mt-3">
            <div class="col-md-6 text-start">
                <a href="./menuUsuario.jsp" class="btn btn-danger">Cancelar</a>
            </div>
            <div class="col-md-6 text-end">
                <input type="submit" value="Reservar" href="#" class="btn btn-success">
            </div>
        </div>
    </form>

</body>
</html>
