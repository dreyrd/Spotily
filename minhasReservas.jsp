<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservas</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
        <a href="#" class="btn btn-danger">Sair</a>
    </nav>

    <div class="container my-4">
        <h1 class="text-center mb-4">Lista de Reservas</h1>
        <div class="list-group">
            <% 
                // Classe para simular uma reserva
                class Reserva {
                    int id;
                    String dataInicio;
                    String dataFim;
                    String espaco;

                    public Reserva(int id, String dataInicio, String dataFim, String espaco) {
                        this.id = id;
                        this.dataInicio = dataInicio;
                        this.dataFim = dataFim;
                        this.espaco = espaco;
                    }
                }

                // Lista de dados simulados
                List<Reserva> reservas = new ArrayList<>();
                reservas.add(new Reserva(1, "2024-12-01", "2024-12-05", "Rio de Janeiro"));
                reservas.add(new Reserva(2, "2024-12-10", "2024-12-15", "São Paulo"));
                reservas.add(new Reserva(3, "2024-12-20", "2024-12-25", "Belo Horizonte"));

                // Exibir os dados na interface
                for (Reserva reserva : reservas) {
            %>
                <!-- Card de reserva -->
                <div class="list-group-item py-4">
                    <div class="row">
                        <div class="col-3 col-md-1">
                            <img src="placeholder.jpg" alt="Imagem do Espaço" class="img-fluid" style="width: 100%; height: auto; object-fit: cover;">
                        </div>
                        <div class="col-6 col-md-5">
                            <h5 class="mb-0">Espaço: <%= reserva.espaco %></h5>
                            <p class="mb-0 text-muted">Início: <%= reserva.dataInicio %></p>
                            <p class="mb-0 text-muted">Fim: <%= reserva.dataFim %></p>
                        </div>
                        <div class="col-12 col-md-3 text-md-end mt-2 mt-md-0">
                            <a href="detalhesReserva.jsp?id=<%= reserva.id %>" class="btn btn-outline-info btn-sm w-100 w-md-auto">Ver Detalhes</a>
                        </div>
                    </div>
                </div>
            <% 
                } 
            %>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
