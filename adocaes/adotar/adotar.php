<?php
include_once("../util_php/animais.php");
header('Content-Type: text/html; charset=UTF-8');
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"/>
    <link rel="stylesheet" href="adotar.css">

    <title>Adotar</title>
</head>
<body>
    <header id="siteHeader">
        <nav id="mainMenu">
            <a href="../home.php"><img src="../imagens\logo.png" class="logo"></a>
            <a href="../home.php">Página Inicial</a>
            <a href="adotar.php">Adotar</a>
            <a href="../home.php#como-adotar">Como Adotar</a>
            <a href="../home.php#porque-adotar">Porque Adotar</a>
            <a href="../ong/view/ongs.html">ONGs Parceiras</a>
            <div class="profile-nav">
                <div class="navbar-cadastro">
                    <a href="/adocaes/adotante/cadastro_usuario.html">Cadastre-se</a>
                </div>
                <div class="navbar-adm">
                    <a href="/adocaes/administracao/administracao.html" ><span id ='person' class="material-symbols-outlined">assignment</span> Administração</a>
                </div>
                <div class="navbar-perfil">
                    <a onclick="toggleProfile()"><span id ='person' class="material-symbols-outlined"> person</span>Perfil</a>
                </div>
            </div>
        </nav>
    </header>

    <div class="overlay" id="overlay" onclick="closeProfile()" style="display:none;"></div>
        <div class="profile-sidebar" id="profileSidebar" style="right: -100%;">
            <form action="../edit_form.php" method="post" id="updateForm">
                <div class="close-button" onclick="closeProfile()">X</div>
                    <div class="profile-content-top">
                        <div class="profile-picture-container">
                            <input type="file" id="uploadFile" style="display: none;" accept="image/*" onchange="mostrarImagemSelecionada()">
                            <img id="profilePicture" alt="Imagem do Animal">
                        </div>
                        <div class ="perfil-text">
                            <label for="nome"><span class = "nome" id="nome" name="nome"></span></label>
                            <br>
                            <h3>Adotante</h3>
                            <label for="uploadFile" class="alterar-foto">Alterar Foto</label>
                        </div>
                    </div>
                    <input type="hidden" id="idAdotante" name="idAdotante">
                <div class="topicos-perfil">
                        <label for="email">E-mail</label>
                        <div class="input-botao">
                            <input type="email" id="email" name="email" readonly>
                            <span id = 'stylus' class="material-symbols-outlined">stylus</span>
                        </div>
                        <label for="telefone">Telefone</label>
                        <div class="input-botao">
                            <input type="telefone" id="telefone" name="telefone" readonly>
                            <span id = 'stylus' class="material-symbols-outlined" type="submit" >stylus</span>
                        </div>
                        <label for="cpf">CPF</label>
                        <div class="input-botao">
                            <input type="cpf" id="cpf" name="cpf" >
                        </div>

                    </br>
                    </br>
                    </br>

                    <button name= "update" id = "update" type="submit">update</button>
                </div>
            </form>

            <div class="botoes-perfil">
                <button onclick="openPopup()" class="botao-alterar-senha">Alterar Senha</button>
                <a ><button class="botao-sair" onclick="logout()">Sair</button></a>
            </div>
        </div>

    <main>
        <section id="animais-section">
            <div class="animais-top">
                <h1 id="titulo">Conheça Nossos Animais <span class="material-symbols-outlined">pets</span></h1>
                <div class="filtro-container">
                    <input type="text" id="barra-pesquisa" placeholder="Pesquisar por gênero, raça, cor, cidade..." class="barra-pesquisa" onkeydown="handleEnterKey(event)">
                    <div class="filtro-lista" onmouseover="mostrarFiltro()" onmouseout="esconderFiltro()">
                        <p><span class="material-symbols-outlined" id="filtrinho">filter_alt</span>Filtrar</p>
                        <ul class="filtro-opcoes">
                            <li>
                                <input type="checkbox" id="filtro-gato" name="filtro-gato" onchange="aplicarFiltro()">
                                <label for="filtro-gato">Gato</label>
                            </li>
                            <li>
                                <input type="checkbox" id="filtro-cachorro" name="filtro-cachorro" onchange="aplicarFiltro()">
                                <label for="filtro-cachorro">Cachorro</label>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class ="todos-animais">
                <?php
                foreach ($animais as $animal) {
                    echo '<div class="animal-card corresponde-pesquisa">';
                    echo '<img src="'.(($animal['url'] !== "") ? $animal['url'] : (($animal['tipo'] === 'C') ? '../Imagens/cachorro1.jpeg' : '../Imagens/gato1.jpeg')).
                    '" alt="'.(($animal['tipo'] === 'C') ? 'Cachorro' : 'Gato').'">';
                    echo '<p class="nome-animal">'. $animal['nome'] .'</p>';
                    echo '<p>Gênero: '.(($animal['genero'] === 'F') ? 'Femea' : 'Macho').'</p>';
                    echo '<p>Cidade: '. $animal['cidade'] .' - '. $animal['estado'] .'</p>';
                    echo '<div class="botao-mais-detalhes">';
                    echo '<button onclick="mostrarDetalhes('.'\'popup'. $animal["id_Animal"] . '\')">Mais Detalhes</button>';
                    echo '</div>'; // Fechou .botao-mais-detalhes
                    echo '</div>'; // Fechou animal-carrossel
                    //echo '</div>'; // Fechando o carrossel antes dos popup
                }
                ?>
            </div>
            <?php
            foreach ($animais as $animal) {
                echo '<div id="popup'.$animal["id_Animal"] .'" class="popup">';
                echo '<div class="popup-content">';
                echo '<span class="fechar" onclick="fecharDetalhes('.'\'popup'. $animal["id_Animal"] . '\')">&times;</span>';
                echo '<div class="info_popup">';
                echo '<div class="imagem-animal">';
                echo '<img src="'.(($animal['url'] !== "") ? $animal['url'] : (($animal['tipo'] === 'C') ? '../Imagens/cachorro1.jpeg' : '../Imagens/gato1.jpeg')).
                '" alt="'.(($animal['tipo'] === 'C') ? 'Cachorro' : 'Gato').'">';
                echo '</div>'; // Fechou .imagem-animal
                echo '<div class="text-princ">';
                echo '<h1>'. $animal['nome'] .'</h1>';
                echo '<p>Raça '. $animal['raca'] .'</p>';
                echo '<p>'.(($animal['genero'] === 'F') ? 'Femea' : 'Macho').'</p>';
                echo '</div>'; // Fechou .text-princ
                echo '</div>'; // Fechou .info_popup

                echo '<h3>Mais Detalhes</h3>';
                echo '<div class="info">';

                echo '<div class="info-item">';
                echo '<p>Data de nascimento:</p>';
                echo '<span>'. $animal['nascimento'] . '</span>';
                echo '</div>'; // Fechou .info-item

                echo '<div class="info-item">';
                echo '<p>Porte:</p>';
                echo '<span>'. (($animal['porte'] === 'P') ? 'Pequeno' : (($animal['porte'] === 'M') ? 'Médio' : 'Grande')).'</span>';
                echo '</div>';// Fechou .info-item

                echo '<div class="info-item">';
                echo '<p>Cor:</p>';
                echo '<span>'. $animal['cor'] .'</span>';
                echo '</div>';// Fechou .info-item
                
                echo '<div class="info-item">';
                echo '<p>Castrado:</p>';
                echo '<span>'.(($animal['castrado'] === '1') ? 'Sim' : 'Não').'</span>';
                echo '</div>';// Fechou .info-item

                echo '<div class="info-item">';
                echo '<p>Vacinas:</p>';
                echo '<span>'. $animal['vacinas'] .'</span>';
                echo '</div>';// Fechou .info-item

                echo '<div class="info-item">';
                echo '<p>Observação:</p>';
                echo '<span>'. $animal['obs'] .'</span>';
                echo '</div>';// Fechou .info-item

                echo '<div class="info-item">';
                echo '<p>ONG:</p>';
                echo '<span>'. $animal['ong'] .'</span>';
                echo '</div>';// Fechou .info-item

                echo '<div class="info-item">';
                echo '<p>Cidade:</p>';
                echo '<span>'. $animal['cidade'] .'</span>';
                echo '</div>';// Fechou .info-item

                echo '<div class="info-item">';
                echo '<p>Estado:<p>';
                echo '<span>'. $animal['estado'] .'</span>';
                echo '</div>';// Fechou .info-item

                echo '<div class="info-item">';
                echo '<p>Telefone:</p>';
                echo '<span>'. $animal['telefone'] .'</span>';
                echo '</div>';// Fechou .info-item

                echo '</div>'; // Fechou .info
                echo '</div>'; // fechou .popup-content
                echo '</div>'; // fechou #popup-ID .popup
            }
            ?>
        </section>
    </main>
    <footer>
        <p>&copy; 2024 Adocães - Todos os direitos reservados</p>
    </footer>
    <script src="scriptadotar.js"></script>
    <script src="../local_storage.js"></script>
</body>
</html>
