import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/cadastrarImagem")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
    maxFileSize = 1024 * 1024 * 50,      // 50 MB
    maxRequestSize = 1024 * 1024 * 100   // 100 MB
)
public class CadastrarImagemServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Pasta para salvar as imagens
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        
        // Cria diretório se não existir
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();
        
        // Pega a parte do arquivo
        Part filePart = request.getPart("imagem");
        
        // Gera nome de arquivo único
        String fileName = System.currentTimeMillis() + "_" + Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        
        // Caminho completo do arquivo
        String filePath = uploadPath + File.separator + fileName;
        
        // Salva o arquivo
        filePart.write(filePath);
        
        // Salvar caminho no banco de dados (opcional)
        String relativePath = "uploads/" + fileName;
        // Aqui você pode salvar relativePath no banco de dados
        
        response.getWriter().println("Upload realizado com sucesso!");
    }
}