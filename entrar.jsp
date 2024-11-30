<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Entrar</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" defer></script>
    <!-- Boxicons CSS -->
    <link href="https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css" rel="stylesheet">
    <!-- CSS -->
    <link href="styles/auth.css" rel="stylesheet">
</head>
<body>
    <div class="login-container">
        <!-- Ícone -->
        <div class="icon-container">
            <i class='bx bxs-landscape'></i>
        </div>
        
        <!-- Título -->
        <h2>Entrar</h2>
        
        <!-- Form -->
        <form action="./back-end/login.jsp" method="post">
            <div class="mb-3 input-group">
                <span class="input-group-text bg-transparent border-0">
                    <i class='bx bx-id-card' style="color: white;"></i>
                </span>
                <input type="text" class="form-control" name="cpf" id="cpf" placeholder="CPF" required>
            </div>
            
            <div class="mb-3 input-group">
                <span class="input-group-text bg-transparent border-0">
                    <i class='bx bx-lock' style="color: white;"></i>
                </span>
                <input type="password" class="form-control" name="senha" placeholder="Senha" required>
            </div>
            
            <div class="form-check d-flex justify-content-start">
                <input class="form-check-input me-2" type="checkbox" id="rememberMe">
                <label class="form-check-label" for="rememberMe">Lembrar-me</label>
            </div>
            
            <button type="submit" class="btn btn-primary w-100">Entrar</button>
            <a href="#" class="mx-lg-2 mx-md-0">Esqueceu a senha?</a>
            <a href="cadastrar.html">Não tem um cadastro?</a>
        </form>
    </div>
    
    <%
        String erro = request.getParameter("erro");
        if (erro != null) {
            out.println("Mensagem de erro");
        }
    %>  
    <!-- Máscara de CPF -->
    <script>
        document.getElementById('cpf').addEventListener('input', function(e) {
        var value = e.target.value;
        var cpfPattern = value.replace(/\D/g, '') // Remove qualquer coisa que não seja número
            .replace(/(\d{3})(\d)/, '$1.$2') // Adiciona ponto após o terceiro dígito
            .replace(/(\d{3})(\d)/, '$1.$2') // Adiciona ponto após o sexto dígito
            .replace(/(\d{3})(\d)/, '$1-$2') // Adiciona traço após o nono dígito
            .replace(/(-\d{2})\d+?$/, '$1'); // Impede entrada de mais de 11 dígitos
        e.target.value = cpfPattern;
        });
    </script>
</body>
</html>
