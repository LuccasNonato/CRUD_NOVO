--
-- Arquivo gerado com SQLiteStudio v3.4.10 em sex fev 7 03:46:38 2025
--
-- Codificação de texto usada: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Tabela: CIDADES
CREATE TABLE IF NOT EXISTS CIDADES (Codigo_Cidade INTEGER PRIMARY KEY AUTOINCREMENT, Nome TEXT (50) NOT NULL, Estado TEXT (20) NOT NULL CHECK (length(Estado) = 2), CepInicial TEXT (15) NOT NULL, CepFinal TEXT (15) NOT NULL);
INSERT INTO CIDADES (Codigo_Cidade, Nome, Estado, CepInicial, CepFinal) VALUES (1, 'MARILIA', 'SP', '17522-410', '17522-410');
INSERT INTO CIDADES (Codigo_Cidade, Nome, Estado, CepInicial, CepFinal) VALUES (2, 'TUPA', 'SP', '17522000', '17522000');
INSERT INTO CIDADES (Codigo_Cidade, Nome, Estado, CepInicial, CepFinal) VALUES (3, 'BAURU', 'SP', '1752301', '1752301');
INSERT INTO CIDADES (Codigo_Cidade, Nome, Estado, CepInicial, CepFinal) VALUES (4, 'SOBRADINHO', 'BA', '1652000', '1652000');
INSERT INTO CIDADES (Codigo_Cidade, Nome, Estado, CepInicial, CepFinal) VALUES (5, 'RIBEIRAO PRETO', 'SP', '18542300', '18542300');
INSERT INTO CIDADES (Codigo_Cidade, Nome, Estado, CepInicial, CepFinal) VALUES (6, 'BRASILIA', 'DF', '1423210', '1423210');
INSERT INTO CIDADES (Codigo_Cidade, Nome, Estado, CepInicial, CepFinal) VALUES (7, 'CABO FRIO', 'RJ', '1425130', '1425130');
INSERT INTO CIDADES (Codigo_Cidade, Nome, Estado, CepInicial, CepFinal) VALUES (8, 'MARICA', 'RJ', '12452301', '12452301');

-- Tabela: CLIENTES
CREATE TABLE IF NOT EXISTS CLIENTES (Codigo_Cliente INTEGER PRIMARY KEY AUTOINCREMENT, CGC_CPF_Cliente TEXT (50) NOT NULL, Nome TEXT (50) NOT NULL, Telefone TEXT (15), Endereco TEXT (30), Codigo_Cidade INTEGER (200) NOT NULL, Complemento TEXT (50), E_mail TEXT (20), Cep TEXT (20) NOT NULL, bairro TEXT (20), FOREIGN KEY (Codigo_Cidade) REFERENCES CIDADES (Codigo_Cidade) ON DELETE CASCADE);
INSERT INTO CLIENTES (Codigo_Cliente, CGC_CPF_Cliente, Nome, Telefone, Endereco, Codigo_Cidade, Complemento, E_mail, Cep, bairro) VALUES (1, '424.692.028-25', 'LUCCAS', '14997871996', 'RUA ANDRE LUIZ RIBEIRO', 1, 'X', 'LUCCAS@HOTMAIL.COM', '17522-410', 'CENTRO');
INSERT INTO CLIENTES (Codigo_Cliente, CGC_CPF_Cliente, Nome, Telefone, Endereco, Codigo_Cidade, Complemento, E_mail, Cep, bairro) VALUES (2, '424.692.028-25', 'JOAO', '3333-3333', 'RUA X', 2, 'X', 'JOAO@HOTMAIL.COM', '17523-651', 'CENTRO');
INSERT INTO CLIENTES (Codigo_Cliente, CGC_CPF_Cliente, Nome, Telefone, Endereco, Codigo_Cidade, Complemento, E_mail, Cep, bairro) VALUES (3, '424.692.028-25', 'CLEBER', '1111-1111', 'RUA Y', 3, 'COMP X', 'CLEBER@GMAIL.COM', '17542-213', 'BAIRRO Y');
INSERT INTO CLIENTES (Codigo_Cliente, CGC_CPF_Cliente, Nome, Telefone, Endereco, Codigo_Cidade, Complemento, E_mail, Cep, bairro) VALUES (4, '424.692.028-25', 'MATHEUS', '14997871996', 'RUA Z', 4, 'COMP Z', 'MATHEUS@GMAIL.COM', '17541-568', 'CENTRO');
INSERT INTO CLIENTES (Codigo_Cliente, CGC_CPF_Cliente, Nome, Telefone, Endereco, Codigo_Cidade, Complemento, E_mail, Cep, bairro) VALUES (5, '424.692.028-25', 'MARCOS', '8888-8888', 'RUA X', 1, 'COMPLEMENTO X', 'MARCOS@GMAIL.COM', '17576-896', 'CENTRO');
INSERT INTO CLIENTES (Codigo_Cliente, CGC_CPF_Cliente, Nome, Telefone, Endereco, Codigo_Cidade, Complemento, E_mail, Cep, bairro) VALUES (6, '424.692.028-25', 'LUCCAS', '14997871996', 'RUA X', 2, 'CENTRO', 'LUCCAS@GMAIL.COM', '14975-213', 'CENTRO');
INSERT INTO CLIENTES (Codigo_Cliente, CGC_CPF_Cliente, Nome, Telefone, Endereco, Codigo_Cidade, Complemento, E_mail, Cep, bairro) VALUES (7, '424.692.028-25', 'LUCCAS 2', '14997871996', 'RUA Z', 3, 'CENTRO', 'LUCCASX@GMAIL.COM', '14975-123', 'CENTRO');

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
