create database PythonSQL;
use PythonSQL;


CREATE TABLE Vendas (
    id_venda int primary key IDENTITY(3,1),
    cliente varchar(50) not null,
    produto varchar(50) not null,
    data_venda date not null,
    preco decimal(6, 2) not null,
    quantidade int not null
);

