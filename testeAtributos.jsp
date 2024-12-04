<!-- Criei isso aqui pra ver os quais são os atributos da sessão -->
<%
    java.util.Enumeration<String> nomesAtributos = session.getAttributeNames();

    out.println("<h3>Variáveis na sessão:</h3>");
    out.println("<ul>");
    while (nomesAtributos.hasMoreElements()) {
        String nome = nomesAtributos.nextElement();
        Object valor = session.getAttribute(nome);
        out.println("<li><strong>" + nome + ":</strong> " + valor + "</li>");
    }
    out.println("</ul>");
%>