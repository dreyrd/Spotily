function uploadFile() {
    const fileInput = document.getElementById('fileInput');
    const file = fileInput.files[0];

    if (!file) {
        alert('Por favor, selecione um arquivo.');
        return;
    }

    const formData = new FormData();
    formData.append('imagem', file);

    fetch('/cadastrarImagem', {
        method: 'POST',
        body: formData
    })
    .then(response => response.text())
    .then(result => {
        alert('Upload realizado com sucesso!');
        console.log(result);
    })
    .catch(error => {
        console.error('Erro ao fazer upload:', error);
    });
}