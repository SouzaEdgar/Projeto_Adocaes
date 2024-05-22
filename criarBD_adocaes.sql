-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22/05/2024 às 16:01
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `adocaes`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `adotantes`
--

CREATE TABLE `adotantes` (
  `idAdotantes` int(10) NOT NULL,
  `nomeAdotante` varchar(45) NOT NULL,
  `CPF` varchar(14) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `adotantes`
--

INSERT INTO `adotantes` (`idAdotantes`, `nomeAdotante`, `CPF`, `email`, `senha`) VALUES
(1, 'João Silva', '123.456.789-01', 'joao@123.com', 'senha123'),
(2, 'Maria Oliveira', '234.567.890-12', 'maria@example.com', 'senha456'),
(3, 'Carlos Santos', '345.678.901-23', 'carlos@example.com', 'senha789'),
(4, 'Ana Souza', '456.789.012-34', 'ana@example.com', 'senhaABC'),
(5, 'Lucas Pereira', '567.890.123-45', 'lucas@example.com', 'senhaDEF'),
(6, 'Fernanda Lima', '678.901.234-56', 'fernanda@example.com', 'senhaGHI'),
(7, 'Rodrigo Oliveira', '789.012.345-67', 'rodrigo@example.com', 'senhaJKL');

-- --------------------------------------------------------

--
-- Estrutura para tabela `animais`
--

CREATE TABLE `animais` (
  `idAnimais` int(10) NOT NULL,
  `nomeAnimal` varchar(55) NOT NULL,
  `raca` varchar(30) NOT NULL,
  `dataNascimento` date NOT NULL,
  `genero` char(1) NOT NULL,
  `porte` char(1) NOT NULL,
  `cor` varchar(25) NOT NULL,
  `castrado` char(1) NOT NULL,
  `vacinas` text NOT NULL,
  `observacao` text NOT NULL,
  `tipo` char(1) NOT NULL,
  `ONGs_idONG` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `animais`
--

INSERT INTO `animais` (`idAnimais`, `nomeAnimal`, `raca`, `dataNascimento`, `genero`, `porte`, `cor`, `castrado`, `vacinas`, `observacao`, `tipo`, `ONGs_idONG`) VALUES
(1, 'Bella', 'SRD', '2024-05-15', 'j', 'M', 'Preto', 'S', 'Todas', 'Gosta de passear, muito fofa', 'C', 2),
(3, 'Teddy', 'SRD', '2017-06-10', 'M', 'G', 'Caramelo', '1', 'V8, Antirrábica', 'Sempre pronto para uma corrida', 'C', 3),
(4, 'Lola', 'SRD', '2022-02-18', 'F', 'P', 'Cinza', '0', 'V8, Antirrábica', 'Apaixonada por brinquedos de pelúcia', 'G', 4),
(5, 'Milo', 'SRD', '2018-09-05', 'M', 'M', 'Marrom Escuro', '1', 'V8, Antirrábica', 'Adora fazer truques', 'C', 5),
(6, 'Zoe', 'SRD', '2021-04-30', 'F', 'P', 'Branco', '0', 'V8, Antirrábica', 'Dorminhoca e fofa', 'C', 1),
(7, 'Oscar', 'SRD', '2019-12-12', 'M', 'G', 'Preto e Branco', '1', 'V8, Antirrábica', 'Inteligente e brincalhão', 'C', 2),
(8, 'Mia', 'SRD', '2017-03-25', 'F', 'P', 'Cinza Listrado', '0', 'V8, Antirrábica', 'Gosta de receber carinho', 'C', 3),
(9, 'Maximus', 'SRD', '2020-07-08', 'M', 'G', 'Marrom', '1', 'V8, Antirrábica', 'Leal e protetor', 'C', 4),
(10, 'Canela', 'SRD', '2018-10-01', 'F', 'M', 'Canela', '0', 'V8, Antirrábica', 'Gosta de explorar o quintal', 'G', 5),
(11, 'Dexter', 'SRD', '2021-01-22', 'M', 'P', 'Preto', '1', 'V8, Antirrábica', 'Sempre animado para passeios', 'C', 1),
(12, 'Lily', 'SRD', '2019-05-15', 'F', 'G', 'Branco e Preto', '0', 'V8, Antirrábica', 'Dócil e adora crianças', 'G', 2),
(13, 'Bento', 'SRD', '2017-08-20', 'M', 'M', 'Cinza', '1', 'V8, Antirrábica', 'Amigável com outros animais', 'G', 3),
(14, 'Pretinha', 'SRD', '2022-03-10', 'F', 'P', 'Preto', '0', 'V8, Antirrábica', 'Apaixonada por brinquedos de corda', 'G', 4),
(15, 'Thor', 'SRD', '2018-12-05', 'M', 'G', 'Marrom Escuro', '1', 'V8, Antirrábica', 'Forte e brincalhão', 'C', 5),
(16, 'Whiskers', 'SRD', '2019-08-15', 'M', 'P', 'Cinza', '1', 'V4, Antirrábica', 'Gato tranquilo e carinhoso', 'G', 1),
(17, 'Mittens', 'SRD', '2020-11-25', 'F', 'M', 'Branco e Preto', '0', 'V4, Antirrábica', 'Adora brincar com bolinhas', 'C', 2),
(18, 'Oliver', 'SRD', '2017-06-10', 'M', 'P', 'Cinza', '1', 'V4, Antirrábica', 'Gosta de explorar', 'G', 3),
(19, 'Chloe', 'SRD', '2022-02-18', 'F', 'G', 'Amarelo', '0', 'V4, Antirrábica', 'Ama carinho na barriga', 'C', 4),
(20, 'Max', 'SRD', '2018-09-05', 'M', 'M', 'Preto', '1', 'V4, Antirrábica', 'Curioso e brincalhão', 'C', 5),
(21, 'Lily', 'SRD', '2021-04-30', 'F', 'P', 'Branco', '0', 'V4, Antirrábica', 'Gatinha meiga e sociável', 'G', 1),
(22, 'Leo', 'SRD', '2019-12-12', 'M', 'M', 'Amarelo e Branco', '1', 'V4, Antirrábica', 'Adora pular e correr', 'G', 2),
(23, 'Mia', 'SRD', '2017-03-25', 'F', 'G', 'Cinza Listrado', '0', 'V4, Antirrábica', 'Gatinha esperta e brincalhona', 'G', 3),
(24, 'Simba', 'SRD', '2020-07-08', 'M', 'P', 'Laranja', '1', 'V4, Antirrábica', 'Rei da casa', 'C', 4),
(25, 'Nala', 'SRD', '2018-10-01', 'F', 'M', 'Tricolor', '0', 'V4, Antirrábica', 'Doce e carinhosa', 'C', 5),
(27, 'Salem', 'SRD', '2019-05-15', 'M', 'G', 'Preto', '0', 'V4, Antirrábica', 'Misterioso e independente', 'G', 2),
(28, 'Luna', 'SRD', '2021-08-20', 'F', 'M', 'Branco e Cinza', '0', 'V4, Antirrábica', 'Adora brincar com bolinhas de lã', 'G', 3),
(29, 'Oreo', 'SRD', '2017-11-05', 'M', 'P', 'Branco e Preto', '1', 'V4, Antirrábica', 'Gosta de pular para lugares altos', 'G', 4),
(30, 'Bella', 'SRD', '2022-03-10', 'F', 'G', 'Tricolor', '0', 'V4, Antirrábica', 'Afetuosa e brincalhona', 'C', 5),
(58, 'Doutor Teste', 'SRD', '2019-05-21', 'M', 'P', 'Branco com manchas preto ', '1', 'V8, Antirrábica', 'Muito curioso e carinhoso, ama passear e brincar', 'C', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `endereco`
--

CREATE TABLE `endereco` (
  `idEndereco` int(10) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `numero` varchar(6) NOT NULL,
  `rua` varchar(120) NOT NULL,
  `cidade` varchar(40) NOT NULL,
  `estado` char(2) NOT NULL,
  `cep` varchar(9) NOT NULL,
  `idAdotantes` int(11) DEFAULT NULL,
  `idONG` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `endereco`
--

INSERT INTO `endereco` (`idEndereco`, `bairro`, `numero`, `rua`, `cidade`, `estado`, `cep`, `idAdotantes`, `idONG`) VALUES
(1, 'Centro', '123', 'Rua A', 'São Paulo', 'SP', '01010-010', NULL, 1),
(2, 'Bairro Sul', '456', 'Avenida B', 'Rio de Janeiro', 'RJ', '20020-020', NULL, 2),
(3, 'Vila Norte', '789', 'Travessa C', 'Belo Horizonte', 'MG', '30030-030', NULL, 3),
(4, 'Área Leste', '101', 'Praça D', 'Salvador', 'BA', '40040-040', NULL, 4),
(5, 'Zona Oeste', '1122', 'Estrada E', 'Curitiba', 'PR', '80080-080', NULL, 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `ongs`
--

CREATE TABLE `ongs` (
  `idONG` int(10) NOT NULL,
  `nomeOng` varchar(120) NOT NULL,
  `CNPJ` varchar(18) NOT NULL,
  `site` varchar(100) NOT NULL,
  `senha` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `ongs`
--

INSERT INTO `ongs` (`idONG`, `nomeOng`, `CNPJ`, `site`, `senha`) VALUES
(1, 'Amor pelos Patinhas', '00000001', 'http://www.amorpelospatinhas.org', '12345'),
(2, 'Protetores do Bichano', '23456789000012', 'http://www.protetoresdobichano.org', '1'),
(3, 'Anjos de Quatro Patas', '34567890000123', 'http://www.anjosdequatropatas.org', '2'),
(4, 'Vira-Latas Unidos', '45678901234567', 'http://www.viralatasunidos.org', '3'),
(5, 'Adote um Amigo', '56789012345678', 'http://www.adoteumamigo.org', '4'),
(6, 'Animais fofos', '39558467000197', 'www.animaisfofos.com', '123'),
(7, 'Dogs legais', '84564888000185', 'www.caeszinhos.com', '123456');

-- --------------------------------------------------------

--
-- Estrutura para tabela `telefone`
--

CREATE TABLE `telefone` (
  `idTelefone` int(10) NOT NULL,
  `numero` varchar(12) NOT NULL,
  `idAdotantes` int(11) DEFAULT NULL,
  `idONG` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `telefone`
--

INSERT INTO `telefone` (`idTelefone`, `numero`, `idAdotantes`, `idONG`) VALUES
(1, '1122334455', NULL, 1),
(2, '222222222', NULL, 2),
(3, '333333333', NULL, 3),
(4, '444444444', NULL, 4),
(5, '555555555', NULL, 5),
(6, '313131341414', 1, NULL),
(7, '313131341414', 2, NULL),
(8, '11321312321', 3, NULL),
(9, '11321312321', 4, NULL),
(10, '12131231312', 5, NULL),
(11, '12131231312', 6, NULL),
(12, '12131231312', 7, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `urls`
--

CREATE TABLE `urls` (
  `idURL` int(10) NOT NULL,
  `url` text NOT NULL,
  `nome` char(25) DEFAULT NULL,
  `idONG` int(11) DEFAULT NULL,
  `idAdotantes` int(11) DEFAULT NULL,
  `idAnimais` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `urls`
--

INSERT INTO `urls` (`idURL`, `url`, `nome`, `idONG`, `idAdotantes`, `idAnimais`) VALUES
(56, 'data:image/jpeg;base64,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', NULL, NULL, NULL, 58);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `adotantes`
--
ALTER TABLE `adotantes`
  ADD PRIMARY KEY (`idAdotantes`);

--
-- Índices de tabela `animais`
--
ALTER TABLE `animais`
  ADD PRIMARY KEY (`idAnimais`),
  ADD KEY `fk_Animais_idONG` (`ONGs_idONG`);

--
-- Índices de tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`idEndereco`),
  ADD KEY `fk_adotantes_x_order` (`idAdotantes`),
  ADD KEY `fk_ongs_x_endereco` (`idONG`);

--
-- Índices de tabela `ongs`
--
ALTER TABLE `ongs`
  ADD PRIMARY KEY (`idONG`);

--
-- Índices de tabela `telefone`
--
ALTER TABLE `telefone`
  ADD PRIMARY KEY (`idTelefone`),
  ADD KEY `fk_id_adotantes_x_order` (`idAdotantes`),
  ADD KEY `fk_ongs_x_order` (`idONG`);

--
-- Índices de tabela `urls`
--
ALTER TABLE `urls`
  ADD PRIMARY KEY (`idURL`),
  ADD KEY `fk_urls_x_ongs` (`idONG`),
  ADD KEY `fk_urls_x_adotantes` (`idAdotantes`),
  ADD KEY `fk_urls_x_animais` (`idAnimais`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `adotantes`
--
ALTER TABLE `adotantes`
  MODIFY `idAdotantes` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de tabela `animais`
--
ALTER TABLE `animais`
  MODIFY `idAnimais` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `idEndereco` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de tabela `ongs`
--
ALTER TABLE `ongs`
  MODIFY `idONG` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `telefone`
--
ALTER TABLE `telefone`
  MODIFY `idTelefone` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de tabela `urls`
--
ALTER TABLE `urls`
  MODIFY `idURL` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `animais`
--
ALTER TABLE `animais`
  ADD CONSTRAINT `fk_Animais_idONG` FOREIGN KEY (`ONGs_idONG`) REFERENCES `ongs` (`idONG`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `endereco`
--
ALTER TABLE `endereco`
  ADD CONSTRAINT `fk_adotantes_x_order` FOREIGN KEY (`idAdotantes`) REFERENCES `adotantes` (`idAdotantes`),
  ADD CONSTRAINT `fk_ongs_x_endereco` FOREIGN KEY (`idONG`) REFERENCES `ongs` (`idONG`);

--
-- Restrições para tabelas `telefone`
--
ALTER TABLE `telefone`
  ADD CONSTRAINT `fk_id_adotantes_x_order` FOREIGN KEY (`idAdotantes`) REFERENCES `adotantes` (`idAdotantes`),
  ADD CONSTRAINT `fk_ongs_x_order` FOREIGN KEY (`idONG`) REFERENCES `ongs` (`idONG`);

--
-- Restrições para tabelas `urls`
--
ALTER TABLE `urls`
  ADD CONSTRAINT `fk_urls_x_adotantes` FOREIGN KEY (`idAdotantes`) REFERENCES `adotantes` (`idAdotantes`),
  ADD CONSTRAINT `fk_urls_x_animais` FOREIGN KEY (`idAnimais`) REFERENCES `animais` (`idAnimais`),
  ADD CONSTRAINT `fk_urls_x_ongs` FOREIGN KEY (`idONG`) REFERENCES `ongs` (`idONG`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
