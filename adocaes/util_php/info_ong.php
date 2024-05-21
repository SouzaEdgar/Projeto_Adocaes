<?php
function buildInfo($conn, $username){
    try {
        $script_recupera_ong = 
        "SELECT idong, cnpj, senha, nomeOng, site
         FROM ongs 
         WHERE cnpj = '$username'";
        $result = mysqli_query($conn, $script_recupera_ong);
        if(mysqli_num_rows($result) == 0){
            throw new Exception("Email e/ou Senha incorreto!");
        } else {
            $row = mysqli_fetch_assoc($result);
            $idOng = $row['idong'];
            $nome = $row['nomeOng'];
            $site = $row['site'];
            $cnpj = $row['cnpj'];
            $telefone = retornaTelefoneOng($conn, $idOng);
            $info_Ong = array(
                'nome' => $nome,
                'site' => $site,
                'cnpj' => $cnpj,
                'telefone' => $telefone
            );
            $info_ong_json = json_encode($info_Ong);
            echo "<script>console.log('[SUCESSO] usuário encontrado: $idOng')</script>";
            echo "<script>localStorage.clear();</script>";
            echo "<script>localStorage.setItem('id_ong', $idOng);</script>";
            echo "<script>localStorage.setItem('info_ong', '$info_ong_json');</script>";
        }
    } catch (Exception $e) {
        header("Location: administracao.html?error=1");
        exit();
    }
}

function retornaTelefoneOng($conn, $idOng){
    $script_urls = 
    "SELECT idTelefone, numero
    FROM telefone 
    WHERE  idOng = '$idOng'";

    $result = mysqli_query($conn, $script_urls);
    
    if(mysqli_num_rows($result) == 0){ return null; }
    $row = mysqli_fetch_assoc($result);
    return $row['numero'];
}
?>
