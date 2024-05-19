-- Exercicio 2
create database Mauro;

use Mauro;

create table tbproduto(
	IdProp int primary key,
	NomeProd varchar(50) not null,
	Qtd int,
	DataValidade DATE not null,
	Valor decimal (10,2) not null
);

create table tbcliente(
	Codigo int primary key,
	NomeCli varchar(50) not null,
	DataNascimento DATE
);

describe tbcliente;
Show databases;

-- Exercicio 3
create database dbcomercio;

use dbcomercio;

create table tbCliente(
	id int primary key,
    NomeCli varchar(200) not null,
    NumEnd smallint not null,
    CompEnd varchar(50)
);

create table tbClientePF(
	CPF int(11) primary key,
    RG 	int(9),
    Rgdig char(1),
    nascimento date not null    
);


-- Exercicio 4
create database Terezinha;

use Terezinha;

create table tbProduto(
	idProp int primary key,
	NomeProd varchar(50) not null,
	Qtd int,
	DataValidade Date not null,
	Valor decimal(10,2) not null
);

show tables;

describe tbProduto;

alter table tbProduto add Peso decimal(3,2);

alter table tbProduto add Cor varchar(50);

alter table tbProduto add Marca varchar(50);


-- Exercicio 5
create database cleide;

use cleide;

create table tbvenda (
    nf int auto_increment primary key,
    datavalidade date not null
);

alter table tbvenda add column preco decimal(10,2) not null,
add column qtd smallint unsigned not null;

alter table tbvenda drop column datavalidade;

alter table tbvenda add column datavenda date;

create table produto (
    codigob bigint(13) not null,
    nomeprod varchar(50) not null,
    primary key (codigob)
);

alter table tbvenda add column codigob bigint(13) not null, 
add constraint fk_codigo_produto foreign key (codigob) references produto(codigob);


-- Exercicio 6
create database dbdesenvolvimento;
use dbdesenvolvimento;

create table tbproduto (
    idprop int primary key,
    nomeprod varchar(50) not null,
    qtd int,
    datavalidade date not null,
    preco decimal(10,2) not null
);

alter table tbproduto add column peso decimal(10,2),
add column cor varchar(50),
add column marca varchar(50) not null;

alter table tbproduto drop column cor;

alter table tbproduto modify column peso decimal(10,2) not null;

alter table tbproduto add column cor varchar(50);


-- Segundo banco de dados do exercicio 6
create database dblojagrande;
use dblojagrande;

-- nome pedido no exercicio foi dblojica.tbcliente, contudo utilizar o ponto causa erro por ser comando 
create table dblojicatbcliente (
    nomecli varchar(50) not null,
    codigocli int primary key,
    datacadastro date not null
);

create table dblojagrande.tbfuncionario (
    nomefunc varchar(50) not null,
    codigofunc int primary key,
    datacadastro datetime not null
);

drop database dblojagrande;

alter table dblojica.tbcliente add column cpf char(11) not null unique;


-- Exercicio 7
-- Kaique Vieira e Guilherme Leonardo
create database dbescola;

use dbescola;

create table tbcliente (
    id int primary key,
    nomeclid varchar(50) not null,
    numend smallint,
    datacadastro datetime default current_timestamp
);


alter table tbcliente add column cpf char(11) unique not null;

alter table tbcliente add column cep char(5);

-- Segundo banco de dados 
create database dbempresa;

use dbempresa;

create table tbendereco (
    cep char(5) primary key,
    logradouro varchar(250) not null,
    iduf tinyint
);

alter table tbendereco add constraint fk_cep_tbcliente foreign key (cep) references tbendereco (cep);

-- Perguntas para o professor o tinyText bigText são parecidos com o varchar ou char?  Quando criamos um check 
