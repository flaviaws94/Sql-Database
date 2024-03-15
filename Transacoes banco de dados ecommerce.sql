use ecommerce;
SET autocommit = 0;

START TRANSACTION;
#Transação de exclusão e atualização de estoque
BEGIN;
SELECT OP.Id_Produto, OP.QuantidadeProduto
FROM OrdemPedido OP
WHERE OP.Id_Pedido = 2 INTO @idProduto, @quantidade;
DELETE FROM Pedido WHERE id_Pedido = 2;

UPDATE ProdutoEstoque
SET Quantidade = Quantidade + 3
WHERE id_Produto = 3;
COMMIT;

START TRANSACTION;
#Transação de Inserção e Atualização de Estoque
BEGIN;
INSERT INTO Produto (Pnome, Categoria, Valor, Tamanho) VALUES ('Pendrive', 'Eletrônico', 39.90, null);
SET @novoIdProduto = LAST_INSERT_ID();

INSERT INTO ProdutoEstoque (Id_LocalEstoque, Id_Produto, Localização, Quantidade) VALUES (2, 6, 'São Paulo', 50);
COMMIT;

START TRANSACTION;
#Transação de Atualização
BEGIN;
UPDATE ProdutoEstoque
SET Quantidade = 120
WHERE id_Produto = 2;
COMMIT;

START TRANSACTION;
#Transação de consulta para Obter o valor total de pedidos confirmados de um cliente
BEGIN;
SELECT SUM(P.Valor) AS ValorTotal
FROM Pedido P
WHERE P.StatusPedido = 'Confirmado' AND P.id_Cliente = 1;
COMMIT;
select*from pedido;
DROP PROCEDURE IF EXISTS InserirClienteEFormaPagamento;

START TRANSACTION;
#Transação procedure com savepoint e rollback parcial
DELIMITER //
CREATE PROCEDURE InserirClienteEFormaPagamento(
    IN endereco_cliente VARCHAR(200),
    IN telefone_cliente VARCHAR(15),
    IN email_cliente VARCHAR(30),
    IN tipo_forma_pagamento ENUM('Cartão de Crédito', 'Boleto Bancário', 'Outro'),
    IN valor_pagamento FLOAT
)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
ROLLBACK TO my_savepoint;
	SELECT 'Erro durante a transação. As alterações foram desfeitas.' AS Mensagem;
END;

START TRANSACTION;
SAVEPOINT my_savepoint;
INSERT INTO Cliente (Endereço, telefone, email)
VALUES ( 'Rua Brasil, 350, Centro - Cidade das Flores', '44-12354-2668', 'JoaquimM@gmail.com'
);
SET @novoClienteId = LAST_INSERT_ID();
INSERT INTO FormaPagamento (TipoFormaPagamento, Valor, data_pagamento, status)
VALUES ('Cartão de Crédito', 21.00, CURDATE(), 'Pendente');
SET @novaFormaPagamentoId = LAST_INSERT_ID();
UPDATE Cliente SET id_FormaPagamento = @novaFormaPagamentoId WHERE Id_Cliente = @novoClienteId;
COMMIT;
    SELECT 'Cliente e forma de pagamento inseridos com sucesso!' AS Mensagem;
END //
DELIMITER ;

SHOW CREATE PROCEDURE InserirClienteEFormaPagamento;
CALL InserirClienteEFormaPagamento ('Rua Brasil, 350, Centro - Cidade das Flores', '44-12354-2668', 'JoaquimM@gmail.com','Cartão de Crédito', 21.00
); 



select* from pedido;
select* from Formapagamento;
select* from Cliente;
show databases;


 



