<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/banco/database.jsp" %>
<% 
    if(session.getAttribute("usuarioAutenticado") == null) {
        response.sendRedirect("entrar.jsp");
    } 
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Minhas Reservas</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" defer></script>
    <!-- Boxicons CSS -->
    <link href="https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css" rel="stylesheet">
    <!-- CSS -->
    <link href="styles/styles.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-light py-2 gradient-background">
        <div class="d-flex align-items-center bg-light p-2 rounded-circle">
            <i class='bx bx-landscape bx-md'></i>
        </div>
        <a href="./back-end/sair.jsp" class="btn btn-danger">Sair</a>
    </nav>
    
    <div class="container my-4">
        <h2 class="mb-4">Minhas Reservas</h2>
        <div class="list-group">
        <%
            // Obtendo o ID do usuário logado
            String usuarioAutenticado = (String) session.getAttribute("usuarioCpf");
            String queryReservas = 
                    "SELECT r.id AS reserva_id, e.titulo, e.descricao, e.capacidade, r.data_reserva " +
                    "FROM reservas r " +
                    "INNER JOIN espaco e ON r.espaco_id = e.id " +
                    "INNER JOIN usuarios u ON r.usuario_id = u.id " +
                    "WHERE u.cpf = ?";

            ResultSet rsReservas = executarSelect(queryReservas);

            // Exibir reservas do usuário logado
            boolean possuiReservas = false;
            while (rsReservas.next()) {
                possuiReservas = true;
                out.println(
                    "<div class='list-group-item py-4'>" +
                        "<div class='row'>" +
                            "<div class='col-3 col-md-1'>" + 
                                "<img src='placeholder.jpg' alt='Espaço' class='img-fluid' style='width: 100%; height: auto; object-fit: cover;'>" + 
                            "</div>" + 
                            "<div class='col-6 col-md-5'>" + 
                                "<h5 class='mb-0'>" + rsReservas.getString("titulo") + "</h5>" + 
                                "<p class='mb-0 text-muted'>" + rsReservas.getString("descricao") + "</p>" + 
                            "</div>" + 
                            "<div class='col-6 col-md-3'>" + 
                                "<h5 class='mb-0'>Capacidade</h5>" + 
                                "<p class='mb-0 text-muted'>" + rsReservas.getString("capacidade") + "</p>" + 
                            "</div>" + 
                            "<div class='col-6 col-md-3'>" + 
                                "<h5 class='mb-0'>Data da Reserva</h5>" + 
                                "<p class='mb-0 text-muted'>" + rsReservas.getDate("data_reserva") + "</p>" + 
                            "</div>" + 
                        "</div>" + 
                    "</div>"
                );
            }

            if (!possuiReservas) {
                out.println("<p class='text-center text-muted'>Você ainda não possui reservas.</p>");
            }
        %>
        </div>
    </div>
</body>
</html>
