<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu Usuário</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
        <a href="#" class="btn btn-danger">Sair</a>
    </nav>
    
    <div class="container my-4">
        <div class="list-group">
            <!-- Item de exemplo. No final do projeto, o back do site var precisar imprimir esses itens com out.println(). -->
            <div class="list-group-item py-4">
                <div class="row">
                    <div class="col-3 col-md-1">
                        <img src="placeholder.jpg" alt="Espaço" class="img-fluid" style="width: 100%; height: auto; object-fit: cover;">
                    </div>
                    <div class="col-6 col-md-5">
                        <h5 class="mb-0">Título</h5>
                        <p class="mb-0 text-muted">Descrição do espaço</p>
                    </div>
                    <div class="col-6 col-md-3">
                        <h5 class="mb-0">Capacidade</h5>
                        <p class="mb-0 text-muted">Capacidade</p>
                    </div>
                    <div class="col-12 col-md-3 text-md-end mt-2 mt-md-0">
                        <a href="reservar.jsp?id=123" class="btn btn-outline-info btn-sm w-100 w-md-auto">Reservar</a>
                    </div>
                </div>
            </div>
            <%-- Fim do card --%>
        </div>
    </div>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>