
//BOTÃO EDITAR PERFIL

window.onload = function() {
    var buttons = document.querySelectorAll('[id="stylus"]');

    buttons.forEach(function(button) {
        button.addEventListener('click', function() {
            // Seleciona todos os inputs e textareas dentro do elemento pai
            var inputsAndTextarea = this.parentElement.querySelectorAll('input, textarea');

            // Verifica se algum dos inputs ou textareas está readonly
            var readOnly = false;
            inputsAndTextarea.forEach(function(element) {
                if (element.hasAttribute('readonly')) {
                    readOnly = true;
                }
            });

            // Se os inputs ou textareas estiverem readonly, torna-os editáveis e muda o ícone para 'save'
            // Caso contrário, torna os inputs e textareas readonly novamente e muda o ícone para 'stylus'
            if (readOnly) {
                inputsAndTextarea.forEach(function(element) {
                    element.removeAttribute('readonly');
                    element.style.border = '1px solid #FF8743';
                });
                this.innerHTML = 'save';
            } else {
                inputsAndTextarea.forEach(function(element) {
                    element.setAttribute('readonly', 'readonly');
                    element.style.border = 'none';
                });
                this.innerHTML = 'stylus';
            }
        });
    });
};


//POP UP REDEFINIR SENHA

function openPopup() {
    var popup = document.getElementById('popup');
    var telaAdm = document.querySelector('.tela-adm');
    document.getElementById("popup").style.display = "block";
    document.querySelector(".close-button").style.pointerEvents = "none";
    document.body.classList.add('no-scroll');
    telaAdm.classList.add('bloqueada');
    
}

function closePopup() {
    var popup = document.getElementById('popup');
    var telaAdm = document.querySelector('.tela-adm');
    document.getElementById("popup").style.display = "none";
    document.querySelector(".close-button").style.pointerEvents = "auto";
    document.body.classList.remove('no-scroll');
    telaAdm.classList.remove('bloqueada');
}

function logout() {
    localStorage.clear(); 

    window.location.href = "/adocaes/home.php";
}

function recuperaAnimais() {
    console.log("Recuperando animais...");
    var idOng = localStorage.getItem('id_ong');

    //FRONT END PERGUNTA EM BINARIO ------> AJAX TRADUZ PARA O BACKEND EM LINGUAGEM NAO BURRA ---->  BACKEND ENTENDE TUDO E REPASSA de vota qualquer msg que queira
    if (idOng) {
        console.log("Request...");
        $.ajax({
            url: 'busca_animais.php',
            type: 'POST',
            data: {id_ong: idOng},
            success: function(response) {
                console.log("Response: ", response);
                if (response) {
                    var allAnimais = JSON.parse(response);
                    criarCard(allAnimais);
                    return allAnimais;
                }
                return;
            },
            error: function(xhr, status, error) {
                console.error('Erro ao recuperar animais: ', error);
            }
        });
    } else {
        console.error('ID_ONG não localizado.');
    }
}
recuperaAnimais();

function criarCard(animais) {
    const todosAnimaisDiv = document.querySelector('.todos-animais');

    animais.forEach(animal => {
        const animalCardDiv = document.createElement('div');
        animalCardDiv.classList.add('animal-card');

        const imagem = document.createElement('img');
        imagem.src = ((animal.url !== null) ? animal.url : ((animal.tipo === 'C') ? '../Imagens/cachorro1.jpeg' : '../Imagens/gato4.jpeg'));
        imagem.alt = animal.tipo === 'C' ? 'Cachorro' : 'Gato';

        const nomeAnimal = document.createElement('p');
        nomeAnimal.classList.add('nome-animal');
        nomeAnimal.textContent = animal.nomeAnimal;

        const genero = document.createElement('p');
        genero.textContent = 'Gênero: ' + (animal.genero === 'F' ? 'Fêmea' : 'Macho');

        // Botao Editar
        const botaoEditar = document.createElement('button');
        botaoEditar.classList.add('btn-edit-animal');
        botaoEditar.textContent = 'Editar';
        botaoEditar.addEventListener('click', function() {
            mostrarDetalhes('popup' + animal.idAnimais);
        });
        
        // Botão Excluir
        const botaoExcluir = document.createElement('button');
        botaoExcluir.classList.add('btn-del-animal');
        botaoExcluir.textContent = 'Excluir';
        botaoExcluir.addEventListener('click', function() {
            excluirAnimal(animal.idAnimais);
        });

        // Div para os botões Editar e Excluir
        const botaoDiv = document.createElement('div');
        botaoDiv.classList.add('botao-card');
        botaoDiv.appendChild(botaoEditar);
        botaoDiv.appendChild(botaoExcluir); 

        // Adicionando os campos na Div Principal (animal-card)
        animalCardDiv.appendChild(imagem);
        animalCardDiv.appendChild(nomeAnimal);
        animalCardDiv.appendChild(genero);
        animalCardDiv.appendChild(botaoDiv);

        todosAnimaisDiv.appendChild(animalCardDiv);
        ///// Inicio PopUp /////
        const popupDiv = document.createElement('div');
        popupDiv.id = 'popup' + animal.idAnimais;
        popupDiv.classList.add('popup');

        const popupContentDiv = document.createElement('div');
        popupContentDiv.classList.add('popup-content');

        // Criar Span para Fechar Item
        // const fecharSpan = document.createElement('span');
        // fecharSpan.classList.add('fechar');
        // fecharSpan.textContent = '×';
        // fecharSpan.onclick = function() {
        //     fecharDetalhes('popup' + animal.idAnimais);
        // };
        // popupContentDiv.appendChild(fecharSpan);

        // popUp-content Imagem
        const imagemDiv = document.createElement('div');
        imagemDiv.classList = 'imagem-animal-edit';
        const imagemAnimal = document.createElement('img');
        //imagemAnimal.classList.add('imagem-animal-edit');
        imagemAnimal.src = ((animal.url !== null) ? animal.url : ((animal.tipo === 'C') ? '../Imagens/cachorro1.jpeg' : '../Imagens/gato4.jpeg'));
        imagemAnimal.alt = animal.tipo === 'C' ? 'Cachorro' : 'Gato';

        imagemDiv.appendChild(imagemAnimal);
        popupContentDiv.appendChild(imagemDiv);

        // Informações PopUp
        const infoEditDIV = document.createElement('div');
        infoEditDIV.classList.add('info-edit');
        
        styleCard('Nome :', animal.nomeAnimal, infoEditDIV);
        styleCard('Raça :', animal.raca, infoEditDIV);
        //styleCard('Data de Nascimento :', animal.dataNascimento, infoEditDIV);
        const dataDiv = document.createElement('div');
        dataDiv.classList.add('styleCard');
        const dataTitulo = document.createElement('p');
        dataTitulo.textContent = 'Data de Nascimento :';
        const dataInput = document.createElement('input');
        dataInput.type = 'date';
        dataInput.value = animal.dataNascimento;
        dataDiv.appendChild(dataTitulo);
        dataDiv.appendChild(dataInput);
        infoEditDIV.appendChild(dataDiv);
        styleSelect('Gênero', animal.genero, infoEditDIV, [{value: 'F', text: 'Fêmea'}, {value: 'M', text: 'Macho'}]);
        styleSelect('Porte', animal.porte, infoEditDIV, [{value: 'P', text: 'Pequeno'}, {value: 'M', text: 'Médio'}, {value: 'G', text: 'Grande'}]);
        styleCard('Cor :', animal.cor, infoEditDIV);
        
        const castradoOpcoes = [
            {value: '1', text: 'Sim'},
            {value: '0', text: 'Não'}
        ];
        styleSelect('Castrado', animal.castrado, infoEditDIV, castradoOpcoes);

        styleCard('Vacinas :', animal.vacinas, infoEditDIV);
        styleCard('Observação :', animal.observacao, infoEditDIV);

        const tipoOpcoes = [
            {value: 'C', text: 'Cachorro'},
            {value: 'G', text: 'Gato'}
        ];
        styleSelect('Tipo', animal.tipo, infoEditDIV, tipoOpcoes);
        popupContentDiv.appendChild(infoEditDIV);

        const botaoSalvar = document.createElement('div');
        botaoSalvar.id = 'botao-save-edit';
        const btnSalvar = document.createElement('button');
        btnSalvar.classList.add('btn-save-animal');
        btnSalvar.textContent = 'Salvar';
        btnSalvar.addEventListener('click', function() {
            salvarDetalhes(animal.idAnimais);
        });
        botaoSalvar.appendChild(btnSalvar);
        popupContentDiv.appendChild(botaoSalvar);

        // Adicionar tudo as div's necessarias
        popupDiv.appendChild(popupContentDiv);
        todosAnimaisDiv.appendChild(popupDiv);
    });
}

// styleInput
function styleCard(key, value, body) {
    const div = document.createElement('div');
    div.classList.add('styleCard');

    const chave = document.createElement('p');
    chave.textContent = key;

    const valor = document.createElement('input');
    valor.value = value;

    div.appendChild(chave);
    div.appendChild(valor);
    body.appendChild(div);
}

// styleSelect
function styleSelect(key, value, body, opcoes) {
    const div = document.createElement('div');
    div.classList.add('styleCard');

    const chave = document.createElement('label');
    chave.setAttribute('for', key);
    chave.textContent = key + ' :';

    const select = document.createElement('select');
    select.name = key;
    select.id = key;
    select.required = true;

    const defaultOption = document.createElement('option');
    defaultOption.value = "";
    defaultOption.selected = true;
    defaultOption.disabled = true;
    defaultOption.textContent = 'Selecione a opção';
    select.appendChild(defaultOption);

    opcoes.forEach(opcao => {
        const option = document.createElement('option');
        option.value = opcao.value;
        option.textContent = opcao.text;
        if (opcao.value === value) {
            option.selected = true;
        }
        select.appendChild(option);
    });

    div.appendChild(chave);
    div.appendChild(select);
    body.appendChild(div);
} 

function salvarDetalhes(idAnimais) {
    const popupDiv = document.getElementById('popup' + idAnimais);
    const inputs = popupDiv.querySelectorAll('input, select');
    const data = {};
    

    inputs.forEach(input => {
        const key = input.previousElementSibling.textContent.replace(' :', '').toLowerCase();
        data[key] = input.value;
        console.log(key, input.value);
    });

    data.idAnimais = idAnimais;

    fetch('update_animais.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
    .then(response => response.json())
    .then(data => {
        console.log('Success:', data);
        window.location.reload();
    })
    .catch((error) => {
        console.error('Error:', error);
    });
}

// function excluirAnimal(idAnimal) {
//     if (confirm("Tem certeza que deseja excluir este animal?")) {
//         console.log(idAnimal);
//         fetch('excluir_animal.php', {
//             method: 'POST',
//             headers: {
//                 'Content-Type': 'application/json'
//             },
//             body: JSON.stringify({ idAnimal: idAnimal })
//         })
//         .then(response => response.json())
//         .then(data => {
//             console.log('Sucesso:', data);
//             // Recarrega a página para atualizar a lista de animais
//             //window.location.reload();
//         })
//         .catch(error => {
//             console.error('Erro:', error);
//             alert("Ocorreu um erro ao excluir o animal.");
//         });
//     }
// }
function excluirAnimal(idAnimal) {
    if (confirm("Tem certeza que deseja excluir este animal?")) {
        console.log(idAnimal);
        fetch('excluir_animal.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: new URLSearchParams({ idAnimal: idAnimal })
        })
        .then(response => response.json())
        .then(data => {
            console.log('Sucesso:', data);
            if (data.status === 'success') {
                // Recarrega a página para atualizar a lista de animais
                window.location.reload();
            } else {
                alert("Ocorreu um erro ao excluir o animal: " + data.message);
            }
        })
        .catch(error => {
            console.error('Erro:', error);
            alert("Ocorreu um erro ao excluir o animal.");
        });
    }
}

function mostrarDetalhes(idPopup) {
    const popup = document.getElementById(idPopup);

    popup.style.display = "block";
    document.body.classList.add('popup-aberto'); // Fecha o overflow do Body quando abrir o popup
    popup.addEventListener('click', function(event) {
        // Verifique se ocorreu clique dentro do PopUp ou fora
        if (!event.target.closest('.popup-content')) {
            fecharDetalhes(idPopup);
        }
    });
    console.log("mostrarDetalhes - LIGOU\nOverFlow - Desligado");
}

// Função para fechar o popup de detalhes
function fecharDetalhes(idPopup) {
    const popup = document.getElementById(idPopup);
    
    popup.style.display = "none";
    document.body.classList.remove('popup-aberto'); // Remova a classe que fecha o overflow do Body quando fechar o popup
}

updateGetById()

function updateGetById(){
    document.getElementById('updateAdm').addEventListener('submit', function() {
        var idOng = localStorage.getItem('id_ong');
        //console.log('ID_ADOTANTE: ', idAdotante)
        document.getElementById('idOng').value = idOng;
    });
}
