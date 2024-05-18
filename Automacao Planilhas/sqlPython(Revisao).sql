create database bdPythonSQL;

use bdPythonSQL;

create table tbVendas(
	idVenda int primary key,
	cliente varchar(50),
	produto varchar(50),
	data_venda date,
	preco decimal(6,2),
	quantidade int,
);
INSERT INTO tbVendas (
    idVenda, cliente, produto, data_venda, preco, quantidade
) VALUES (
    1, 'Lira', 'PC', '2021-02-15', 800, 1
);