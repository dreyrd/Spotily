<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/banco/database.jsp" %>
<% if(session.getAttribute("usuarioAutenticado") == null) response.sendRedirect("entrar.jsp");%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Avaliações Pendentes</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" defer></script>
    <!-- Boxicons CSS -->
    <link href="https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css" rel="stylesheet">
    <!-- CSS -->
    <link rel="stylesheet" href="styles/styles.css">
</head>
<body>
    <nav class="navbar navbar-light py-2 gradient-background">
        <div class="d-flex align-items-center bg-light p-2 rounded-circle">
            <i class='bx bx-landscape bx-md'></i>
        </div>
        <a class="nav-link" href="#">Espaços</a>
        <a class="nav-link active" href="#">Avaliações pendentes</a>
        <a class="nav-link" href="#">Cadastrar espaço</a>
        <a href="./back-end/sair.jsp" class="btn btn-danger">Sair</a>
    </nav>
    <div class="container my-4">
        <h2 class="mt-4">Avaliações pendentes</h2>
        <div class="list-group">
          <%
            String id = null;
            String query = "SELECT avaliacao.id as id, nome, titulo FROM avaliacao INNER JOIN usuario ON cpf = usuario_avaliado INNER JOIN espaco ON espaco.id = espaco WHERE nota IS NULL";
            ResultSet rs = executarSelect(query);
            while(rs.next()){
              id = rs.getString("id");
              out.println(
                "<form action='./back-end/avaliar.jsp?id=" + id + "' method='post'>" + 
                  "<div class='list-group-item py-4'>" +
                    "<div class='d-flex'>" +
                      "<div class='col-md-2'>" + rs.getString("nome") + "</div>" +
                      "<div class='col-md-2'>" + rs.getString("titulo") + "</div>" +
                      "<div class='col-md-6'>" +
                        "<select class='form-select' name='" + id + "'>" +
                          "<option value='null'>Nota (0-10)</option>" +
                          "<option value='0'>0</option>" +
                          "<option value='1'>1</option>" +
                          "<option value='2'>2</option>" +
                          "<option value='3'>3</option>" +
                          "<option value='4'>4</option>" +
                          "<option value='5'>5</option>" +
                          "<option value='6'>6</option>" +
                          "<option value='7'>7</option>" +
                          "<option value='8'>8</option>" +
                          "<option value='9'>9</option>" +
                          "<option value='10'>10</option>" +
                        "</select>" +
                      "</div>" +
                      "<div>" +
                        "<input type='submit' value='Avaliar' class='btn btn-outline-info'></a>" +
                      "</div>" +
                    "</div>" +
                  "</div>" + 
                  "</form>"
              );
            }
          %>
        </div>
      </div>      

      <%
        String erro = request.getParameter("erro");
        if (erro != null) {
            out.println("Mensagem de erro");
        }
      %> 
</body>