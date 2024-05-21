<?php
include_once("../util_php/Conexao.php");
$id_ong = $_POST['id_ong'];

retornaListaAnimais($conn, $id_ong);

function retornaListaAnimais($conn, $id_ong){
    // $SELECT_ALL = 
    // "   SELECT nomeAnimal, raca, dataNascimento, genero, porte, cor, castrado, vacinas, observacao, tipo 
    //     FROM animais
    //     WHERE ONGs_idONG = $id_ong
    // ";
    $SELECT_ALL = 
    "   SELECT A.idAnimais, A.nomeAnimal, A.raca, A.dataNascimento, A.genero, A.porte, A.cor, A.castrado, A.vacinas, A.observacao, A.tipo, U.url
        FROM animais A
        LEFT JOIN urls U ON A.idAnimais = U.idAnimais
        WHERE ONGs_idONG = $id_ong
    ";

    $result = mysqli_query($conn, $SELECT_ALL);
    if(mysqli_num_rows($result) == 0){
        return;
    }
    
    $all_list = array();
    while($row = $result->fetch_assoc()) {
        $animais[] = $row;
    }
    
    $response = json_encode($animais);
    echo $response;
}
?>