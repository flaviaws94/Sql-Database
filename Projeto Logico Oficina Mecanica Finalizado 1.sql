Create database Oficina_Mecanica;
Use OFicina_Mecanica;
create table Cliente (
id_Cliente int primary key auto_increment,
NomeCompleto varchar(100) not null,
CPF char(11) not null,
RG char(10) not null,
DataNascimento DATE not null,
Endereco VARCHAR(200) not null,
Telefone VARCHAR (15) not null,
Email VARCHAR (30),
constraint unique_CPF_Cliente unique(CPF),
constraint unique_RG_Cliente unique(RG)
);
create table Veiculo (
Id_Veiculo int primary key auto_increment,
identificacao varchar(100) not null,
Placa char(7) not null,
Registro CHAR(11) not null,
Id_Cliente int,
constraint unique_Placa_Veiculo unique(Placa),
constraint unique_Registro_Veículo unique(Registro),
constraint fk_Veiculo_Cliente Foreign Key (id_Cliente) REFERENCES Cliente(id_Cliente)
);
create table Mecanico (
Id_Mecanico int primary key auto_increment,
NomeCompleto_Mecanico Varchar(100) not null,
Especialidade varchar(50) not null,
Codigo int not null
);
create table Estoque (
Id_Estoque int primary key auto_increment,
Local_Estoque varchar(25),
Quantidade_Estoque int default 0
);
create table Peca (
Id_Peca int primary key auto_increment,
Nome_Peca varchar(100),
Valor_Peca float default 0
);
create table PecaEstoque (
Id_Peca int,
Id_Estoque int,
primary key (id_Estoque, Id_Peca), 
constraint fk_PecaEstoque_Peca Foreign Key (id_Peca) REFERENCES Peca(id_Peca),
constraint fk_PecaEstoque_Estoque Foreign Key (id_Estoque) REFERENCES Estoque(id_Estoque)
);
create table MaoDeObra (
Id_MaoDeObra int primary key auto_increment,
Descriçao_MaoDeObra varchar(100) not null,
Valor_MaoDeObra Float default 0 not null
);
create table Orcamento (
Id_Orcamento int primary key auto_increment,
Data_Orcamento datetime not null,
Tipo_servico ENUM('Conserto','Revisão') not null,
Status_Orcamento ENUM('Aprovado', 'Aguardando Confirmação', 'Cancelado') not null,
Valor_Total float not null,
Id_Mecanico int,
Id_Cliente int,
Id_Veiculo int,
constraint fk_Orcamento_Mecanico Foreign Key (id_Mecanico) REFERENCES Mecanico(id_Mecanico),
constraint fk_Orcamento_Cliente Foreign Key (id_Cliente) REFERENCES Cliente(id_Cliente),
constraint fk_Orcamento_Veiculo Foreign Key (Id_Veiculo) REFERENCES Veiculo(Id_Veiculo)
);
create Table Peca_Orcamento (
Id_Peca int,
Id_Orcamento int, 
constraint fk_peca_Orcamento_Peça Foreign Key (id_Peca) REFERENCES Peca(id_Peca),
constraint fk_Peca_Orcamento_orcamento Foreign Key (id_Orcamento) REFERENCES Orcamento(Id_Orcamento)
);
create Table MaoDeObra_Orcamento (
Id_MaoDeObra int,
Id_Orcamento int, 
constraint fk_MaoeObra_Orcamento_MaoDeObra Foreign Key (id_MaoDeObra) REFERENCES MaoDeObra(id_MaoDeObra),
constraint fk_MaoDeObra_Orcamento_OrdemServico Foreign Key (id_Orcamento) REFERENCES Orcamento(Id_Orcamento)
);
create table FormaPagamento (
Id_FormaPagamento int primary key auto_increment,
Descrição ENUM('Cartão de Crédito','Cartão de Débito','Pix','Boleto bancário') not null
);
create table OrdemServico (
Id_OrdemServico int primary key auto_increment,
DataEmissao datetime not null,
DataConclusao datetime,
Id_Orcamento int,
Id_Mecanico int,
Id_FormaPagamento int,
Id_Cliente int,
Id_Veiculo int,
constraint fk_OrdemServico_Mecanico Foreign Key (id_Mecanico) REFERENCES Mecanico(id_Mecanico),
constraint fk_OrdemServico_Orcamento Foreign Key (id_Orcamento) REFERENCES Orcamento(id_orcamento),
constraint fk_OrdemServico_FormaPagamento Foreign Key (id_FormaPagamento) REFERENCES FormaPagamento(id_FormaPagamento),
constraint fk_OrdemServico_Cliente Foreign Key (id_Cliente) REFERENCES Cliente(id_Cliente),
constraint fk_OrdemServico_Veiculo Foreign Key (Id_Veiculo) REFERENCES Veiculo(Id_Veiculo)
);
create table Acompanhamento (
Id_Acompanhamento int primary key auto_increment,
Id_OrdemServico int,
Status_OrdemServico ENUM('Em processo de concerto','Em processo de revisão','Finalizado')not null,
constraint fk_Acompanhamento_OrdemServico Foreign Key (id_OrdemServico) REFERENCES OrdemServico(id_OrdemServico)
);
insert into cliente values 
(null,'Rodrigo dos Santos', 65896547789, 1265891153, '1998-09-15', 'Rua dos Papagaios 235, Cidade das Flores', '44-12354-2214',null),
(null,'Rose M. Souza','65412398712','1265474415','1985-05-15','Rua Brasil, 136, Centro - Cidade das Flores', '44-12354-2145','Rose@gmail.com'),
(null,'Sidnei da Silva','12362355477','1457856587','1961-08-20','Rua dos Passaros, 1550, Centro - Cidade das Flores', '44-11233-1125','sidineids@gmail.com'),
(null,'Jurandir Fonseca','98745365214','1235465887','1959-03-24','Rua Valente, 569, Centro - Cidade das Flores', '44-33225-3256',null)
;
insert into veiculo values
(null, 'Chevrolet Onix (ano 2010) - Vermelho', 'MKJ3E55', '32569887778', 2),
(null, 'Ford Ka (ano 2019) - Prata', 'ATP6J88', '11336588999', 3),
(null, 'Fiat Uno (ano 2005) - Preto', 'OPU35O5', '66449985311', 1),
(null, ' Volkswagen Polo (ano 2020) - Branco', 'AVM98P6', '32659977445', 4)
;
insert into FormaPagamento (descrição) values
('Cartão de Crédito'),
('Cartão de Débito'),
('Pix'),
('Pix'),
('Boleto Bancário')
;
insert into Mecanico (NomeCompleto_Mecanico, Especialidade, Codigo) values
('Marcos dos Santos', 'Eletricista', 9784),
('Jefferson Nascimento', 'Mecânico Geral', 9874),
('Antônio Moraes', 'Suspensão', 9589),
('Diego Martins', 'Mecânico Geral', 9658)
;
insert into Estoque (Local_Estoque, Quantidade_Estoque) values
('Rio de janiro', 150),
('Rio de janiro', 400),
('São Paulo', 360),
('São Paulo', 80),
('Goiás', 95)
; 
select *From estoque;
insert into Peca (Nome_Peca, Valor_Peca) values
('Amortecedor', 200.00),
('Coxim Dianteiro Motor', 800.00),
('Suporte De Motor Automotivo', 300.00),
('Terminal de Direção', 221.00),
('Kit de Suspensão a Rosca Slim', 1200.00)
;
insert into PecaEstoque values 
(1, 2),
(2, 4),
(3, 1),
(4, 5),
(5, 3)
;
insert into MaoDeObra (Descriçao_MaoDeObra, Valor_MaoDeObra) values
('Concerto de Motor', 1500.00),
('Revisão Completa', 500.00),
('Concerto da Suspensão', 399.00),
('Concerto da Direção', 150.00),
('Concerto dos Amortecedores', 750.00)
;
select *From Orcamento;
select *From mecanico;
UPDATE Orcamento
SET Status_orcamento = 'Aprovado'
WHERE id_orcamento = 6;
Insert into Orcamento (Data_Orcamento, Tipo_servico, Status_Orcamento, Valor_Total, Id_Mecanico, Id_Cliente, Id_Veiculo) Values
('2023-11-30 07:30:05', 'Revisão', 'Aprovado', 500.00, 2, 1, 3),
('2023-12-02 10:00:15', 'Conserto','Aguardando Confirmação', 1300, 3, 4, 1),
('2023-12-05 13:20:30', 'Conserto','Cancelado', 1300.00, 4, 3, 4),
('2023-12-19 10:15:10', 'Revisão','Aguardando Confirmação', 800.00, 4, 2, 2)
;
insert into MaoDeObra (Descriçao_MaoDeObra, Valor_MaoDeObra) values
('Concerto de Motor', 1500.00),
('Revisão Completa', 500.00),
('Concerto da Suspensão', 399.00),
('Concerto da Direção', 150.00),
('Concerto dos Amortecedores', 750.00);
;
select *From MaodeObra;
select *From ordemServico;
Insert into Peca_Orcamento (Id_Peca, Id_Orcamento) Values 
(null, 5),
(5, 6),
(2, 7),
(null, 8 );
Insert into maodeobra_Orcamento (Id_MaoDeObra, Id_Orcamento) Values 
(2, 5),
(3, 6),
(1, 7),
(2, 8);
DELETE FROM FormaPagamento WHERE Id_FormaPagamento=9;
Insert into ordemServico (DataEmissao, DataConclusao, Id_Orcamento, Id_Mecanico, Id_Cliente, Id_Veiculo, ID_FormaPagamento) Values 
('2023-11-30 07:55:05', '2023-12-02 14:15:05', 5, 2, 1, 3, 6),
('2023-12-02 10:30:00', '2023-12-03 17:30:00', 6, 3, 4, 1, 8)
;
Insert into Acompanhamento (Id_OrdemServico, Status_ordemServico) values
(1, 'Finalizado'),
(2,'Finalizado');

SELECT * FROM Cliente; 

SELECT * FROM Acompanhamento
WHERE Status_OrdemServico = 'Finalizado';

SELECT NomeCompleto_Mecanico, Especialidade FROM Mecanico;

SELECT Id_OrdemServico, Status_OrdemServico FROM Acompanhamento;

SELECT c.NomeCompleto AS Cliente,
       v.identificacao AS Veiculo
FROM Cliente c
LEFT JOIN Veiculo v ON c.id_Cliente = v.Id_Cliente;
SELECT Id_Orcamento,
    (SELECT GROUP_CONCAT(Descriçao_MaoDeObra) FROM MaoDeObra_Orcamento WHERE Id_Orcamento = o.Id_Orcamento) AS MaoDeObra,
    (SELECT GROUP_CONCAT(Nome_Peca) FROM Peca_Orcamento po JOIN Peca p ON po.Id_Peca = p.Id_Peca WHERE po.Id_Orcamento = o.Id_Orcamento) AS Pecas
FROM Orcamento o;

SELECT *
FROM OrdemServico os
WHERE (
    SELECT SUM(Valor_MaoDeObra + Valor_Peca)
    FROM Orcamento o
    WHERE o.Id_Orcamento = os.Id_Orcamento
) > 500;

UPDATE Orcamento o
SET Valor_Total = (
    SELECT COALESCE(SUM(m.Valor_MaoDeObra), 0) + COALESCE(SUM(p.Valor_Peca), 0)
    FROM MaoDeObra_Orcamento mo
    LEFT JOIN MaoDeObra m ON mo.Id_MaoDeObra = m.Id_MaoDeObra
    LEFT JOIN Peca_Orcamento po ON o.Id_Orcamento = po.Id_Orcamento
    LEFT JOIN Peca p ON po.Id_Peca = p.Id_Peca
    WHERE o.Id_Orcamento = mo.Id_Orcamento
)
WHERE o.Id_Orcamento = 4;

SELECT
    c.NomeCompleto AS Cliente,
    v.identificacao AS Veiculo,
    v.Placa
FROM Cliente c
LEFT JOIN Veiculo v ON c.id_Cliente = v.Id_Cliente;

SELECT
    e.Local_Estoque,
    e.Quantidade_Estoque,
    p.Nome_Peca,
    p.Valor_Peca
FROM Estoque e
INNER JOIN PecaEstoque pe ON e.Id_Estoque = pe.Id_Estoque
INNER JOIN Peca p ON pe.Id_Peca = p.Id_Peca;

SELECT fp.Descrição AS Forma_Pagamento,
    COUNT(os.Id_OrdemServico) AS Numero_Ordens
FROM FormaPagamento fp
LEFT JOIN OrdemServico os ON fp.Id_FormaPagamento = os.Id_FormaPagamento
GROUP BY fp.Descrição;

SELECT * FROM MaoDeObra_Orcamento;

SELECT
    os.Id_OrdemServico,
    os.DataEmissao,
    os.DataConclusao,
    c.NomeCompleto AS Cliente,
    v.identificacao AS Veiculo,
    m.NomeCompleto_Mecanico,
    fp.Descrição AS FormaPagamento,
    o.Tipo_servico,
    o.Status_Orcamento,
    o.Valor_Total
FROM OrdemServico os
INNER JOIN Cliente c ON os.Id_Cliente = c.id_Cliente
INNER JOIN Veiculo v ON os.Id_Veiculo = v.Id_Veiculo
INNER JOIN Mecanico m ON os.Id_Mecanico = m.Id_Mecanico
INNER JOIN FormaPagamento fp ON os.Id_FormaPagamento = fp.Id_FormaPagamento
INNER JOIN Orcamento o ON os.Id_Orcamento = o.Id_Orcamento;

SELECT
    Id_OrdemServico,
    DataEmissao,
    DataConclusao
FROM OrdemServico
WHERE Id_Cliente = 1;

SELECT
    Id_OrdemServico,
    DataEmissao,
    DataConclusao,
    o.Valor_Total
FROM OrdemServico os
INNER JOIN Orcamento o ON os.Id_Orcamento = o.Id_Orcamento
WHERE o.Valor_Total > 1000;

SELECT  p.Nome_Peca,
        p.Valor_Peca
FROM Peca_Orcamento po
INNER JOIN Peca p ON po.Id_Peca = p.Id_Peca
WHERE po.Id_Orcamento = '6';

SELECT
    m.Descriçao_MaoDeObra,
    m.Valor_MaoDeObra
FROM MaoDeObra_Orcamento mo
INNER JOIN MaoDeObra m ON mo.Id_MaoDeObra = m.Id_MaoDeObra
WHERE mo.Id_Orcamento = '6';