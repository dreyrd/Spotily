<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/banco/database.jsp" %>
<% if(session.getAttribute("usuarioAutenticado") == null) response.sendRedirect("entrar.jsp");%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservas</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap JS -->
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Boxicons CSS -->
    <link href="https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css" rel="stylesheet">
    <!-- Custom CSS -->
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
        <h1 class="text-center mb-4">Lista de Reservas</h1>
        <div class="list-group">
            <% 
                String query = "SELECT reserva.id, titulo, nome, data_inicio, data_fim FROM reserva INNER JOIN espaco ON espaco = espaco.id INNER JOIN usuario ON usuario = usuario.cpf";
                ResultSet rs = executarSelect(query);
                // Exibir os dados na interface
                while(rs.next()) {
            %>
                <!-- Card de reserva -->
                <div class="list-group-item py-4">
                    <div class="d-flex flex-row">
                        <div class="col-3 col-md-1">
                            <img src="placeholder.jpg" alt="Imagem do Espaço" class="img-fluid" style="width: 100%; height: auto; object-fit: cover;">
                        </div>
                        <div class="flex-grow-1 mx-2">
                        <div class="flex-grow-1 mx-2">
                            <h5 class="mb-0">Espaço: <%= rs.getString("titulo") %></h5>
                            <p class="mb-0 text-muted">Início: <%= rs.getString("data_inicio") %></p>
                            <p class="mb-0 text-muted">Fim: <%= rs.getString("data_fim") %></p>
                            <p class="mb-0 text-muted">Usuário: <%= rs.getString("nome") %></p>
                        </div>
                        <div class="text-md-end mt-2 mt-md-0">
                            <a href="detalhesReserva.jsp?id=<%= rs.getString("id") %>" class="btn btn-outline-danger btn-sm w-100 w-md-auto">Cancelar</a>
                        </div>
                    </div>
                </div>
            <% 
                } 
            %>
        </div>
    </div>

</body>
</html>
