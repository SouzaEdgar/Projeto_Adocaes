<?php
include_once("../util_php/Conexao.php");
include "../util_php/info_ong.php";

// Receber dados do formulário
$idONG = $_POST['idOng'];
$site = $_POST['site'];
$telefone = $_POST['telefone'];
$cnpj = $_POST['cnpj'];

// Preparar SQL para atualização
echo "<script>console.log('[UPDATE]: $site, $telefone, $cnpj')</script>";

$sql = "UPDATE ongs SET cnpj = '$cnpj', site = '$site' WHERE idOng = $idONG";
$sql_telefone = "UPDATE telefone SET numero = '$telefone' WHERE idONG = $idONG";

// Verificar se a execução foi bem-sucedida
if ($conn->query($sql) === TRUE) {
    if ($conn->query($sql_telefone) === TRUE) { 
        buildInfo($conn, $cnpj);
        echo "<script> window.location.href = 'administracao.html';</script>";
        echo "<script>console.log('[UPDATE-SUCESSO]')</script>";
    };
} else {
    echo "Erro ao atualizar o registro: " . $conn->error;
}

// Fechar a conexão
$conn->close();
?>
