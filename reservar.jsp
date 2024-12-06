<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/banco/database.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<% if(session.getAttribute("usuarioAutenticado") == null) response.sendRedirect("entrar.jsp"); %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservar</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FullCalendar CSS -->
    <link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css" rel="stylesheet">
    <!-- CSS -->
    <link rel="stylesheet" href="styles/styles.css">
</head>
<body style="min-height: 100vh; background-color: #f8f9fa; font-family: Arial, sans-serif;">
    <nav class="navbar navbar-light py-2 gradient-background">
        <div class="d-flex align-items-center bg-light p-2 rounded-circle">
            <i class='bx bx-landscape bx-md'></i>
        </div>
        <a href="./back-end/sair.jsp" class="btn btn-danger">Sair</a>
    </nav>
    <div class="container">
        <div class="title-section my-3">
            <img src="https://via.placeholder.com/150" alt="Espaço" class="img-thumbnail">
            <div class="info">
                <h2>Título</h2>
                <p>Capacidade</p>
                <p>Descrição do espaço</p>
            </div>
        </div>
        <div class="calendar-container d-flex justify-content-around">
            <div id="calendarEntrada" class="calendar"></div>
            <div id="calendarSaida" class="calendar"></div>
        </div>
        <form action="./back-end/reservar.jsp" method="post" class="mt-3">
            <input type="hidden" id="dataEntrada" name="dataEntrada">
            <input type="hidden" id="dataSaida" name="dataSaida">
            <div class="d-flex justify-content-between">
                <a href="./menuUsuario.html" class="btn btn-danger">Cancelar</a>
                <button type="submit" class="btn btn-success">Reservar</button>
            </div>
        </form>
    </div>

    <!-- JSON dos dias reservados -->
    <script>
        const diasReservados = ["2024-12-10", "2024-12-11", "2024-12-15"]; 
    </script>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Configuração dos calendários
            const config = {
                initialView: 'dayGridMonth',
                selectable: true,
                dateClick: function (info) {
                    // Atualiza os campos de entrada e saída
                    if (!document.getElementById('dataEntrada').value) {
                        document.getElementById('dataEntrada').value = info.dateStr;
                        alert("Data de entrada selecionada: " + info.dateStr);
                    } else if (!document.getElementById('dataSaida').value) {
                        document.getElementById('dataSaida').value = info.dateStr;
                        alert("Data de saída selecionada: " + info.dateStr);
                    } else {
                        alert("Datas já selecionadas. Clique em 'Reservar' ou 'Cancelar' para redefinir.");
                    }
                },
                events: diasReservados.map(date => ({
                    start: date,
                    end: date,
                    display: 'background',
                    backgroundColor: 'red',
                })),
            };

            // Renderizar calendários
            const calendarEntrada = new FullCalendar.Calendar(document.getElementById('calendarEntrada'), config);
            const calendarSaida = new FullCalendar.Calendar(document.getElementById('calendarSaida'), config);
            calendarEntrada.render();
            calendarSaida.render();
        });
    </script>

    <!-- FullCalendar JS -->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" defer></script>
</body>
</html>

