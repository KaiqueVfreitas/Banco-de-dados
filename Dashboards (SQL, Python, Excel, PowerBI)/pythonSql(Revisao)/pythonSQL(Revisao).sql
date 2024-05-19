create database PythonSQL;
use PythonSQL;

CREATE TABLE Vendas(
    id_venda int,
    cliente varchar(50),
    produto varchar(50),
    data_venda date,
    preco decimal(6, 2),
    quantidade int,
)
INSERT INTO Vendas(
	id_venda, cliente, produto, data_venda, preco, quantidade
)VALUES(
	1, 'Lira', 'PC', '2021-02-15', 8000, 1
)
