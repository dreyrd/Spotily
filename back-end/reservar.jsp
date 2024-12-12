<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.security.MessageDigest" %>
<%@ include file="../banco/database.jsp" %>
<% if(session.getAttribute("usuarioAutenticado") == null) response.sendRedirect("entrar.jsp");%>

<%
    String dataEntrada = request.getParameter("dataEntrada");
    String dataSaida = request.getParameter("dataSaida");
    String id = (String) session.getAttribute("idEspaco");
    String cpf = (String) session.getAttribute("usuarioCpf");

    try{

        String queryEncontraConflitos = "SELECT COUNT(*) FROM reserva WHERE ('"+ dataEntrada +"' BETWEEN data_inicio AND data_fim) OR ('"+ dataSaida +"' BETWEEN data_inicio AND data_fim) OR (data_inicio BETWEEN '" + dataEntrada + "' AND '"+ dataSaida +"') OR (data_fim BETWEEN '"+ dataEntrada +"' AND '"+ dataSaida +"') AND espaco = " + id;
        ResultSet rs = executarSelect(queryEncontraConflitos);

        if (rs != null && rs.next()) {
            if(rs.getInt(1) > 0){
                out.println("Reserva conflitante encontrada.");
            }
            else{
                String query = "INSERT INTO reserva (data_inicio, data_fim, usuario, espaco) VALUES (?, ?, ?, ?)";
                executarQueryExterno(query, dataEntrada, dataSaida, cpf, id);
                response.sendRedirect("../reservar.jsp");
            }
        }
    }
    catch(Exception e){
        out.println("Erro ao reservar espaço: " + e.getMessage());
    }
    
    

%>