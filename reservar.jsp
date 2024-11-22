<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservar</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Boxicons CSS -->
    <link href="https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css" rel="stylesheet">
    <!-- CSS -->
     <link rel="stylesheet" href="styles/styles.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        
    </style>
</head>
<body style="min-height: 100svh;">
    <nav class="navbar navbar-light py-2 gradient-background">
        <div class="d-flex align-items-center bg-light p-2 rounded-circle">
            <i class='bx bx-landscape bx-md'></i>
        </div>
        <a href="#" class="btn btn-danger">Sair</a>
    </nav>
    <div class="container">
        <div class="title-section">
            <img src="https://via.placeholder.com/150" alt="Espaço">
            <div class="info">
                <h2>Título</h2>
                <p>Capacidade</p>
                <p>Descrição do espaço</p>
            </div>
        </div>
        <div class="calendar-container">
            <div class="calendar">
                <h5>Entrada</h5>
                <input type="date" class="form-control">
            </div>
            <div class="calendar">
                <h5>Saída</h5>
                <input type="date" class="form-control">
            </div>
        </div>
        <div class="d-flex mt-3">
            <div class="col-md-6 text-start">
                <a href="./menuUsuario.html" class="btn btn-danger">Cancelar</a>
            </div>
            <div class="col-md-6 text-end">
                <a href="#" class="btn btn-success">Reservar</a>
            </div>
        </div>
    </div>
    <%
        String id = request.getParameter("id");
        if (id != null) {
            out.println("ID recebido: " + id);
        }
    %>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
