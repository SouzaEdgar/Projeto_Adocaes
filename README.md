# Projeto_Adocaes
## ADOCÃES: SOFTWARE PARA DIVULGAÇÃO DE ANIMAIS EM SITUAÇÃO DE ADOÇÃO

### **Como usar:**
Sendo uma página realizada de forma local, é necessário seguir alguns critérios para o seu funcionamento.  
-> Possuir um LocalHost para a comunicação da página com o Banco de Dados relacional (SQL).  

Existe um software que possibilita isso tudo de forma prática e rápida.
O XAMPP se trata de um pacote com os principais servidores de código aberto, que incluem o MySQL e o Apache. Ele foi criado para ser muito fácil seu uso, assim como sua instalação.
Visto que a página utiliza PHP e um BD, o XAMPP possibilita e facilita a execução da página em modo local.
![Painel de Controle do XAMPP, imagem do site techtudo com materia sobre o XAMPP](https://s2-techtudo.glbimg.com/qfo1o2-x0Pruc9XimjZdH_rJ_n4=/0x0:753x476/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2021/h/x/eURLy6SSynAY7B33vmxg/2012-02-27-xampp-control.png)

---
### **Como instalar o XAMPP:**
**->** Pesquise por XAMPP em seu navegador  
   ou entre no link: https://www.apachefriends.org/pt_br/index.html  
**->** Clique na opção de download referente ao seu Sistema Operacional  
**->** Será aberta uma nova guia da SourceForge que possibilitara o download escolhido  
**->** O Download tem um peso semelhante a 150MB em sua atual versão: 8.2.12 (PHP 8.2.12)  
**->** Após ser realizado o download, inicie a instalação  
**->** Clique Next  
**->** Selecione todos componentes que deseja fazer a instalação (normalmente é recomendado deixar da forma que esta)  
   e clique Next  
**->** Selecione o local onde deseja instalar (para facilitar, crie uma pasta vazia onde deseja instalar)  
   e clique Next  
**->** Selecione a linguagem e clique Next  
**->** Agora com tudo configurado, clique Next para iniciar a instalação  
**->** Após ser finalizada a instalação, você pode escoher já iniciar o XAMPP ou não  
**->** Agora com o XAMPP instalado, vá dentro do local de destino selecionado para o arquivo  
**->** Entre na pasta htdocs e coloque a pasta adocaes extraida do download deste projeto.  

---
### **Banco de Dados - Adocães**
Para criar o Banco de Dados com uma massa de dados (para testes) nós preparamos um query SQL
Onde a mesma se encontra neste projeto, com o nome de **criarBD_adocaes.sql**  

**->** Abra o Painel de Controle do XAMPP  
**->** Inicie o PHPMyAdmin e então clique em ADMIN  
   uma aba no seu navegador padrão ira ser aberta, essa aba permite você visualizar seus BDs  
**->** Clique em +Novo, localizado no lado esquerdo da tela  
**->** Coloque como nome "**adocaes**" (sem acento mesmo) e clique em Criar  
**->** No lado esquerdo sera criado o banco de dados adocaes, clique nele  
**->** Vá para a opção SQL, localizada na parte de cima  
**->** Copie e cole todo texto presente no arquivo criarBD_adocaes.sql (você pode abrir o arquivo com o bloco de notas para facilitar)  
**->** Para facilitar, desmarque a opção "Habilitar verificação de chaves estrangeiras", localizada na mesma linha do botão Executar  
**->** Execute a query  
**->** Pronto você já tem o banco de dados Adocaes montado e preenchido.  

---
### **Utilizando a página**
Agora com tudo pronto, volte ao painel do XAMPP e inicie o Apache (após iniciado clique em Admin, para facilitar)  

**->** Com o localhost aberto, altere a URL do navegador para **localhost/adocaes/home.php**  
  
**Pronto!** Você já esta utilizando o site em seu servidor local, dessa forma poderá criar perfis e visualizar a visão de um Adotante 
ou até mesmo criar um login como ONG, e ter a visão de Administrador dos animais presentes.  

