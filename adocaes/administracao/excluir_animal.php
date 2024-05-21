<?php
include_once("../util_php/Conexao.php");

// Verifica se o ID do animal foi enviado
if (isset($_POST['idAnimal'])) {
    $idAnimal = $_POST['idAnimal'];

    // Inicia uma transação para garantir que ambas as exclusões ocorram juntas
    mysqli_begin_transaction($conn);

    try {
        // Cria a query de exclusão da URL do animal (necessária devido a FK)
        $DELETE_URLS_QUERY = "DELETE FROM urls WHERE idAnimais = '$idAnimal'";
        if (!mysqli_query($conn, $DELETE_URLS_QUERY)) {
            throw new Exception(mysqli_error($conn));
        }

        // Cria a query de exclusão do animal
        $DELETE_ANIMAL_QUERY = "DELETE FROM animais WHERE idAnimais = '$idAnimal'";
        if (!mysqli_query($conn, $DELETE_ANIMAL_QUERY)) {
            throw new Exception(mysqli_error($conn));
        }

        // Confirma a transação
        mysqli_commit($conn);
        echo json_encode(['status' => 'success']);
    } catch (Exception $e) {
        // Desfaz a transação em caso de erro
        mysqli_rollback($conn);
        echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'ID do animal não recebido']);
}

// Fecha a conexão
mysqli_close($conn);
?>