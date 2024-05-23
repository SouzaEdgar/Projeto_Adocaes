-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23/05/2024 às 00:40
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
(1, 'João Silva', '123.456.789-01', 'joao@example.com', 'senha123'),
(2, 'Maria Oliveira', '234.567.890-12', 'maria@example.com', 'senha456'),
(3, 'Carlos Santos', '345.678.901-23', 'carlos@example.com', 'senha789'),
(4, 'Ana Souza', '456.789.012-34', 'ana@example.com', 'senhaABC'),
(5, 'Lucas Pereira', '567.890.123-45', 'lucas@example.com', 'senhaDEF'),
(6, 'Fernanda Lima', '678.901.234-56', 'fernanda@example.com', 'senhaGHI');

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
(1, 'Bella', 'SRD', '2019-08-15', 'F', 'P', 'Branco e Marrom', '1', 'V8, Antirrábica', 'Adora brincar de buscar a bolinha', 'C', 1),
(2, 'Coco', 'SRD', '2020-11-25', 'M', 'M', 'Preto', '0', 'V8, Antirrábica', 'Fica feliz ao ar livre', 'C', 2),
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
(26, 'Milo', 'SRD', '2019-01-22', 'M', 'P', 'Cinza', '1', 'V4, Antirrábica', 'Gosta de dormir no sol', 'G', 1),
(27, 'Salem', 'SRD', '2019-05-15', 'M', 'G', 'Preto', '0', 'V4, Antirrábica', 'Misterioso e independente', 'G', 2),
(28, 'Luna', 'SRD', '2021-08-20', 'F', 'M', 'Branco e Cinza', '0', 'V4, Antirrábica', 'Adora brincar com bolinhas de lã', 'G', 3),
(29, 'Oreo', 'SRD', '2017-11-05', 'M', 'P', 'Branco e Preto', '1', 'V4, Antirrábica', 'Gosta de pular para lugares altos', 'G', 4),
(30, 'Bella', 'SRD', '2022-03-10', 'F', 'G', 'Tricolor', '0', 'V4, Antirrábica', 'Afetuosa e brincalhona', 'C', 5);

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
(5, 'Zona Oeste', '1122', 'Estrada E', 'Curitiba', 'PR', '80080-080', NULL, 5),
(45, 'Centro', '28', 'Rua Doutor Amelio', 'Diadema', 'SP', '09938150', 41, NULL);

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
(1, 'Amor pelos Patinhas', '12345678900001', 'http://www.amorpelospatinhas.org', '123'),
(2, 'Protetores do Bichano', '23456789000012', 'http://www.protetoresdobichano.org', ''),
(3, 'Anjos de Quatro Patas', '34567890000123', 'http://www.anjosdequatropatas.org', ''),
(4, 'Vira-Latas Unidos', '45678901234567', 'http://www.viralatasunidos.org', ''),
(5, 'Adote um Amigo', '56789012345678', 'http://www.adoteumamigo.org', ''),
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
(1, '111111111', NULL, 1),
(2, '222222222', NULL, 2),
(3, '333333333', NULL, 3),
(4, '444444444', NULL, 4),
(5, '555555555555', NULL, 5),
(6, '313131341414', NULL, 6),
(7, '313131341414', NULL, 7),
(45, '11970231258', 41, NULL);

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
(139, 'https://www.zooplus.pt/magazine/wp-content/uploads/2021/11/tricolores_2.jpeg', 'Bella', NULL, NULL, 1),
(141, 'https://www.petz.com.br/blog/wp-content/uploads/2021/03/raca-de-cachorro-preto.jpg', 'Coco', NULL, NULL, 2),
(142, 'https://blog-static.petlove.com.br/wp-content/uploads/2023/09/25143323/como-cuidar-de-um-vira-lata-caramelo-petlove.jpg', 'Teddy', NULL, NULL, 3),
(143, 'https://blog-static.petlove.com.br/wp-content/uploads/2024/02/17030436/Chartreux-Petlove.jpg', 'Lola', NULL, NULL, 4),
(144, 'https://segredosdomundo.r7.com/wp-content/uploads/2022/01/30-racas-de-cachorro-marrom-mais-populares-do-mundo-1.jpg', 'Milo', NULL, NULL, 5),
(145, 'https://static.ndmais.com.br/2021/10/spitz-branco-800x533.png', 'Zoe', NULL, NULL, 6),
(146, 'https://cloudfront-us-east-1.images.arcpublishing.com/estadao/2P2JVDV5UNKNRPQWJVUZES4YNE.jpg', 'Oscar', NULL, NULL, 7),
(147, 'https://www.adoropets.com.br/wp-content/uploads/2021/03/galgo-italiano-cinza.jpg', 'Mia', NULL, NULL, 8),
(148, 'https://blog.cobasi.com.br/wp-content/webpc-passthru.php?src=https://blog.cobasi.com.br/wp-content/uploads/2021/06/dog-847048_960_720.png&nocache=1', 'Maximus', NULL, NULL, 9),
(149, 'https://st4.depositphotos.com/22263232/25152/i/450/depositphotos_251521960-stock-photo-portrait-british-short-hair-brown.jpg', 'Canela', NULL, NULL, 10),
(150, 'https://blog-static.petlove.com.br/wp-content/uploads/2021/07/Filhote-labrador-5.jpg', 'Dexter', NULL, NULL, 11),
(151, 'https://fotos.amomeupet.org/uploads/fotos/1690854366_64c863de836c9_hd.jpg', 'Lily', NULL, NULL, 12),
(152, 'https://blog-static.petlove.com.br/wp-content/uploads/2020/10/grey-tabby-petlove.jpg', 'Bento', NULL, NULL, 13),
(153, 'https://blog.colombo.com.br/wp-content/uploads/2021/09/Bombain.jpg', 'Pretinha', NULL, NULL, 14),
(154, 'https://t1.ea.ltmcdn.com/pt/posts/5/5/3/braco_alemao_de_pelo_curto_24355_7_600.jpg', 'Thor', NULL, NULL, 15),
(155, 'https://blog-static.petlove.com.br/wp-content/uploads/2024/02/17024144/racas-de-gato-cinza-Petlove.jpg', 'Whiskers', NULL, NULL, 16),
(156, 'https://img.myloview.com.br/fotomurais/cachorro-branco-e-preto-700-184847502.jpg', 'Mittens', NULL, NULL, 17),
(157, 'https://gestoranimal.com.br/wp-content/uploads/2021/07/gato-de-pelo-curto-ingles-cinza-dietado.jpg', 'Oliver', NULL, NULL, 18),
(158, 'https://porakaa.com.br/wp-content/uploads/2022/04/kulli-kittus-dCCMkInwKew-unsplash.jpg', 'Chloe', NULL, NULL, 19),
(159, 'https://www.infoescola.com/wp-content/uploads/2013/05/Schipperke_707169673.jpg', 'Max', NULL, NULL, 20),
(160, 'https://www.patasdacasa.com.br/sites/default/files/styles/article_detail_desktop/public/noticias/2020/06/racas-de-gatos-brancos-descubra-as-mais-comuns.jpg.webp?itok=PxsQu5D9', 'Lily', NULL, NULL, 21),
(161, 'https://www.eusemfronteiras.com.br/wp-content/uploads/2023/03/Imagens-ESF-1-16.png', 'Leo', NULL, NULL, 22),
(162, 'https://img.freepik.com/fotos-premium/gato-fofo-listrado-cinza-parado-ao-ar-livre-olhando-para-a-camera-em-uma-rua-de-verao_127089-12171.jpg', 'Mia', NULL, NULL, 23),
(163, 'https://www.pedigree.com.br/sites/g/files/fnmzdf2401/files/2023-07/quantos-anos-vive-um-cachorro-01.jpg', 'Simba', NULL, NULL, 24),
(164, 'https://st5.depositphotos.com/1913515/65893/i/450/depositphotos_658937880-stock-photo-tricolor-border-collie-puppy-lying.jpg', 'Nala', NULL, NULL, 25),
(165, 'https://img.freepik.com/fotos-premium/lindo-gato-cinza-bonito-com-olhos-verdes-o-animal-de-estimacao-esta-na-cama_101881-517.jpg', 'Milo', NULL, NULL, 26),
(166, 'https://blog-static.petlove.com.br/wp-content/uploads/2022/05/gato-preto-deitado-Petlove.jpg', 'Salem', NULL, NULL, 27),
(167, 'https://img.freepik.com/fotos-premium/um-gato-cinza-e-branco-deitado-no-braco-de-um-sofa-conceito-de-bem-estar_543278-227.jpg', 'Luna', NULL, NULL, 28),
(168, 'https://www.patasdacasa.com.br/sites/default/files/2023-10/gato-frajola1_0.jpg', 'Oreo', NULL, NULL, 29),
(169, 'https://cdn.adtechpanda.com/fd3a12df-a179-4752-b0ba-d561c497fa54/-/format/jpeg/-/quality/lightest/', 'Bella', NULL, NULL, 30);

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
  MODIFY `idAnimais` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `idEndereco` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de tabela `ongs`
--
ALTER TABLE `ongs`
  MODIFY `idONG` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `telefone`
--
ALTER TABLE `telefone`
  MODIFY `idTelefone` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de tabela `urls`
--
ALTER TABLE `urls`
  MODIFY `idURL` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

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
