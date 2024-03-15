use ecommerce;
#View para Clientes verificarem informações básicas sobre produtos, preços, e status de pedidos.
CREATE VIEW Cliente_view AS
SELECT Pnome AS NomeProduto, Categoria, Valor
FROM Produto;

#View para informações de Vendedores como o nome completo, endereço e o total de produtos que cada vendedor possui em estoque.
CREATE VIEW InfoVendedor_view AS
SELECT
    Vendedor.Id_Vendedor,
    CONCAT(PessoaFisica.Nome, ' ', PessoaFisica.Sobrenome) AS NomeVendedor,
    Vendedor.Endereço AS EnderecoVendedor,
    COUNT(ProdutoVendedor.Id_Produto) AS TotalProdutosEmEstoque
FROM Vendedor
JOIN PessoaFisica ON Vendedor.Id_Vendedor = PessoaFisica.Id_Vendedor
LEFT JOIN ProdutoVendedor ON Vendedor.Id_Vendedor = ProdutoVendedor.Id_Vendedor
GROUP BY Vendedor.Id_Vendedor;

#View para Administradores terem acesso a uma visão mais abrangente, incluindo detalhes sobre clientes, vendas e status de pagamentos.
CREATE VIEW Administrador_view AS
SELECT C.Id_Cliente, C.Endereço, C.Telefone, C.Email, P.Id_Pedido, P.StatusPedido, FP.TipoFormaPagamento
FROM Cliente C
JOIN Pedido P ON C.Id_Cliente = P.Id_Cliente
JOIN FormaPagamento FP ON P.Id_FormaPagamento = FP.Id_FormaPagamento;

#View para Estoque para os gerentes de estoque verificarem informações sobre os produtos no estoque e suas quantidades.
CREATE VIEW Estoque_View AS
SELECT PE.Id_LocalEstoque, PE.Localização, P.Pnome AS NomeProduto, PE.Quantidade
FROM ProdutoEstoque PE
JOIN Produto P ON PE.Id_Produto = P.Id_Produto;

#View para Pedidos Pendentes usada para os responsáveis pelo processamento de pedidos, mostrando detalhes sobre pedidos pendentes.
CREATE VIEW PedidosPendentes_view AS
SELECT P.Id_Pedido, C.Id_Cliente, C.Endereço, P.DescriçãoPedido, P.Valor, P.Frete, FP.TipoFormaPagamento
FROM Pedido P
JOIN Cliente C ON P.Id_Cliente = C.Id_Cliente
JOIN FormaPagamento FP ON P.Id_FormaPagamento = FP.Id_FormaPagamento
WHERE P.StatusPedido = 'Em Processamento';

Create table tabela_user (
nome_tabela varchar (100),
id int primary key
);

CREATE USER 'cliente_user'@'localhost' IDENTIFIED BY 'senha_cliente';
GRANT SELECT ON ecommerce.Cliente_view TO 'cliente_user'@'localhost';
CREATE USER 'vendedor_user'@'localhost' IDENTIFIED BY 'senha_vendedor';
GRANT SELECT ON ecommerce.vendedor TO 'vendedor_user'@'localhost';
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY '1265658';
GRANT ALL PRIVILEGES ON ecommerce.Administrador_view TO 'admin_user'@'localhost';

# Trigger para deletar clientes
Delimiter //
CREATE TRIGGER Before_Delete_Cliente
BEFORE DELETE ON Cliente
FOR EACH ROW
BEGIN
    INSERT INTO ClienteRemovido (Id_Cliente, Endereco, Telefone, Email, MotivoRemocao)
    VALUES (OLD.Id_Cliente, OLD.Endereço, OLD.Telefone, OLD.Email, 'Removido por solicitação do usuário');
END //
delimiter ;

# Trigger para atualização de preço de produtos
Delimiter //
CREATE TRIGGER Before_Update_Produto_Preco
BEFORE UPDATE ON Produto
FOR EACH ROW
BEGIN
    IF NEW.Categoria = 'Eletrônico' THEN
        SET NEW.Valor = NEW.Valor * 1.1; -- Aumento de 10% para produtos eletrônicos
    ELSE
        SET NEW.Valor = NEW.Valor * 1.05; -- Aumento de 5% para outras categorias
    END IF;
END;
delimiter ;

show tables;


