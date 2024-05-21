<?php
include_once("../util_php/Conexao.php");

// Recebe o conteúdo do POST em formato JSON
$input = file_get_contents('php://input');
$data = json_decode($input, true);

// Verifica se os dados foram recebidos corretamente
if (empty($data)) {
    echo json_encode(['status' => 'error', 'message' => 'Dados ausentes']);
    exit; // Termina o script para evitar execução adicional
}

// Atribui os valores recebidos às variáveis
$idAnimais = $data['idAnimais'];
$nomeAnimal = $data['nome'];
$raca = $data['raça'];
$dataNascimento = $data['data de nascimento'];
$genero = $data['gênero'];
$porte = $data['porte'];
$cor = $data['cor'];
$castrado = $data['castrado'];
$vacinas = $data['vacinas'];
$observacao = $data['observação'];
$tipo = $data['tipo'];

// Cria a query de UPDATE
$UPDATE_QUERY = "
    UPDATE animais
    SET nomeAnimal = '$nomeAnimal', 
        raca = '$raca', 
        dataNascimento = '$dataNascimento', 
        genero = '$genero', 
        porte = '$porte', 
        cor = '$cor', 
        castrado = '$castrado', 
        vacinas = '$vacinas', 
        observacao = '$observacao',
        tipo = '$tipo'
    WHERE idAnimais = '$idAnimais'
";

// Executa a query
if (mysqli_query($conn, $UPDATE_QUERY)) {
    echo json_encode(['status' => 'success']);
} else {
    echo json_encode(['status' => 'error', 'message' => mysqli_error($conn)]);
}

// Fecha a conexão
mysqli_close($conn);
?>