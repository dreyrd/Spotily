<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/banco/database.jsp" %>
<% if(session.getAttribute("usuarioAutenticado") == null) response.sendRedirect("entrar.jsp");%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu Usuário</title>
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
    <nav class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between mb-4 border-bottom gradient-background">
        <div class="col-md-3">
            <div class="d-flex bg-light p-2 rounded-circle">
                <i class='bx bx-landscape bx-md'></i>
            </div>
        </div>
        <div class="nav col-md-auto justify-content-center">
            <li><a href="#" class="nav-link" style="color: white;">Espaços</a></li>
            <li><a href="avPendentes.jsp" class="nav-link" style="color: white;">Avaliações Pendentes</a></li>
            <li><a href="cadastrarEspaco.html" class="nav-link" style="color: white;">Cadastrar Espaço</a></li>
            <li><a href="" class="nav-link" style="color: white;">Cadastrar Espaço</a></li>
        </div>
        <div class="col-md-3 text-end">
            <a href="./back-end/sair.jsp" class="btn btn-danger">Sair</a>
        </div>
    </nav>
    
    <div class="container my-4">
        <div class="list-group">
            <%
                String query = "SELECT e.id, e.titulo, e.descricao, e.capacidade, f.foto " +
                            "FROM espaco e " +
                            "LEFT JOIN foto_espaco f ON e.id = f.id";
                ResultSet rs = executarSelect(query);
            
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String titulo = rs.getString("titulo");
                    String descricao = rs.getString("descricao");
                    String capacidade = rs.getString("capacidade");
                    String imagePath = rs.getString("foto");
            %>
                    <div class="list-group-item py-4">
                        <div class="row">
                            <div class="col-3 col-md-1">
                                <img src="<%= imagePath %>" alt="Espaço" class="img-fluid" style="width: 100%; height: auto; object-fit: cover;">
                            </div>
                            <div class="col-6 col-md-5">
                                <h5 class="mb-0"><%= titulo %></h5>
                                <p class="mb-0 text-muted"><%= descricao %></p>
                            </div>
                            <div class="col-6 col-md-3">
                                <h5 class="mb-0">Capacidade</h5>
                                <p class="mb-0 text-muted"><%= capacidade %></p>
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
