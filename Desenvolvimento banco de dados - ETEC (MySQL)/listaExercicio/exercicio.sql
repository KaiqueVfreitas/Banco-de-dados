-- Exercicio 1
create database guilherme;
use guilherme;

create table tbUsuario(
IdUsuario int primary key,
NomeUsuario varchar(45),
DataNascimento date
);

create table tbEstado(
Id int primary key,
Uf varchar (2)
);

create table tbCliente(
CodigoCli smallint primary key,
Nome varchar(50),
Endereco varchar(60)
);
create table tbProduto(
Barras decimal (13,0),
Valor decimal (21,4),
Descricao varchar (500)
);

describe tbProduto;
show tables;
show DATABASES;
alter table tbCliente modify Nome varchar (58);
alter table tbProduto add Qtd int;
drop table tbEstado;
ALTER TABLE tbUsuario DROP COLUMN DataNascimento;

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
    RG 	int,
    Rgdig char(1),
    nascimento date not null    
);


-- Exercicio 4
create database dbTerezinha;

use dbTerezinha;

create table tbProduto(
	IdProp int primary key,
	NomeProd varchar(50) not null,
	Qtd int,
	DataValidade date not null,
	Valor decimal(10,2) not null
);

alter table tbProduto add Peso decimal(6,2);
alter table tbProduto add Cor varchar(50);
alter table tbProduto add Marca varchar(50) not null;

alter table tbProduto  drop column Cor;
alter table tbProduto modify column Peso decimal(6,2) not null;
alter table tbProduto drop column DataValidade;

-- Exercicio 5
create database Cleide;
use Cleide;

create table tbvenda (
    nf int auto_increment primary key,
    datavalidade date not null
);

alter table tbvenda add column preco decimal(10,2) not null,
add column qtd smallint unsigned not null;

alter table tbvenda drop column datavalidade;

alter table tbvenda add column datavenda date default (current_date);

create table produto (
    codigob bigint primary key,
    nomeprod varchar(50) not null
);

alter table tbvenda add column codigob bigint not null, 
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

/*
A coluna já foi dropada.
*/

-- Segundo banco de dados do exercicio 6
create database dblojagrande;

alter table tbproduto add cor varchar(50); 

create database dblojica;
use dblojica;

create table tbcliente(
    nomeCli varchar(50) not null,
    codigoCli int primary key,
    datacadastro datetime not null
);

use dblojagrande;
create table tbfuncionario(
	NomeFunc varchar(50) not null,
    CodigoFunc int primary key,
    DataCadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

drop database dblojagrande;

use dblojica;
alter table tbcliente add column cpf char(11) not null unique;


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

use dbescola;
create table tbendereco (
    cep char(5) primary key,
    logradouro varchar(250) not null,
    iduf tinyint
);

alter table tbcliente add 
	constraint fk_cep_tbcliente foreign key (cep) 
		references tbendereco (cep);

/* Perguntas para o professor o Kaique Vieira:
 1-tinyText bigText são parecidos com o varchar ou char?  
 2-Quando criamos um check?  
 3-Diferença entre DDL's, EXCEL e PowerBI?
 
 Dificuldades Guilherme Leonardo:
  1°Dificuldade até o momento: Nomenclatura, posso alterar o nome para ficar condizente, por exemplo ao invés de preço com ç e ter que escrever preco, posso escrever valor?
  2°Dificuldade, por estar vendo outras linguagens de programação, as vezes me perco na nomenclatura, aqui no SQL, Existem nomenclaturas de comandos que possuem espaço, como por exemplo: Primary Key, as vezes eu erro pensando que é junto.
  3° Vejo alguns profissionais digitando em maisculo os comandos e código, isso é considerado boa prática?
*/

show databases;
drop database dbempresa;


-- Exercicio 8
use dbescola;

create table tbest(
IdUf tinyint primary key,
NomeUFS VARCHAR(2) not null,
NomeEstado varchar(40) not null
);

alter table tbEndereco add constraint 
	Fk_IdUF_TbEndereco Foreign Key (IdUf) 
		references tbest (IdUf);

alter table tbest drop column NomeEstado;

rename table tbest to tbEstado;

-- https://www.bosontreinamentos.com.br/mysql/como-renomear-colunas-usando-comandos-sql-no-mysql/
ALTER TABLE tbEstado CHANGE COLUMN NomeUFS NomeUf varchar(2);

describe tbEstado; -- Fui ver se funcionou msm

alter table tbendereco add column IdCid mediumint ;

use dbescola;

create table tbcidade(
IdCid mediumint primary key,
NomeCidade varchar(50) not null
);

alter table tbcidade modify column NomeCidade varchar(250);

alter table tbEndereco 
	add constraint Fk_IdCid_TbEndereco 
		foreign key (IdCid) references tbcidade (IdCid);
-- Exercicio 9
create database dbBANCO;
use dbBANCO;

create table tbBanco(
	codigo int,
    nome varchar(50) not null
);

create table tbAgencia(
	numAgencia int,
    codBanco int,
    endereco varchar(50) not null
);

create table tbCliente(
	cpf bigint,
    nome varchar(50) not null,
    sexo char(1) not null,
    endereco varchar(50) not null
);

create table tbConta(
	numConta int,
    saldo decimal(7,2),
    tipoConta smallint,
    numAgencia int not null
);
create table tbHistorico(
	cpf bigint,
    numConta int,
    dataInicio date
);
create table tbTelefone_Cliente(
	cpf bigint,
    telefone int
);
-- Pratica de alteração das tabelas, preferi declarar desta forma a PK e FK
-- Chaves primárias
alter table tbBanco
	add primary key (codigo);
alter table tbAgencia
	add primary key (numAgencia);
alter table tbCliente 
	add primary key(cpf);
alter table tbConta 
	add primary key (numConta);
alter table tbHistorico 
	add primary key(cpf, numConta);
alter table tbTelefone_Cliente
	add primary key(cpf, telefone);
-- Chaves estrangeiras
alter table tbAgencia 
	add constraint fk_codBanco
		foreign key (codBanco) references tbBanco(codigo);
alter table tbConta 
	add constraint fk_numAgencia 
		foreign key(numAgencia) references tbAgencia (numAgencia);
alter table tbHistorico 
	add constraint fk_historico_cpf
		foreign key(cpf) references tbCliente(cpf);
alter table tbHistorico
	add constraint fk_historico_numConta
		foreign key(numConta) references tbConta(numConta);
alter table tbTelefone_Cliente
	add constraint fk_telefone_cliente_cpf
		foreign key(cpf) references tbCliente(cpf);
-- Adicionando registros
insert into tbBanco (codigo, nome) values 
	(1, 'banco do brasil'), 
    (104, 'caixa economica federal'), 
    (801, 'banco escola');
insert into tbAgencia (codBanco, numAgencia, endereco) values
	(1, 123, 'Av Paulista, 78'),
    (104, 159, 'Rua Liberdade, 124'),
    (801, 401, 'Rua vinte tres, 23'),
    (801, 485, 'Av Marechal, 68');
insert into tbCliente(cpf, nome, sexo, endereco) values 
	(12345678910, 'Enildo', 'M', 'Rua Grande,75'),
    (12345678911, 'Astrogildo','M','Rua Pequena,789'),
    (12345678912,'Monica','F','Av Larga,148'),
    (12345678913, 'Cascão','M','Av Principal,369');
    describe tbConta;
insert into tbConta(numConta, saldo, tipoConta, numAgencia) values 
	(9876, 456.05, 1, 123),
    (9877, 321.00, 1, 123),
    (9878, 100, 2, 485),
    (9879, 5589.48, 1, 401);
    describe tbHistorico;
insert into tbHistorico(cpf, numConta, dataInicio) values 
	(12345678910, 9876, '2001-04-15'),
    (12345678911, 9877, '2011-03-10'),
    (12345678912, 9878, '2021-03-11'),
    (12345678913, 9879, '2000-07-05');    
insert into tbTelefone_Cliente(cpf, telefone) values 
	(12345678910, 912345678),
    (12345678911, 912345678),
    (12345678912, 912345678),
    (12345678913, 912345678);  
alter table tbCliente add column email varchar(50);
-- Busca dos dados
select cpf, endereco from tbCliente where nome = 'Monica';
select cpf, nome, sexo, endereco, email from tbCliente where sexo = 'M'; 
/* 
	Exercicio 10, fazer alterações nas tabelas do 
    banco de dados desenvolvido no exercicio 9
*/ 
select * from tbCliente;
SELECT saldo FROM tbConta WHERE numConta = '9876';

describe tbConta;
delete from tbTelefone_Cliente where cpf = 12345678911;
update tbConta set tipoConta = 2  where numConta = 9879;
update tbCliente set email = 'Astro@Escola.com' where nome = 'Monica';
-- O codigo correto seria: SELECT saldo FROM tbConta WHERE numConta = '9876'; contudo o worbench nao deixou fazer, portanto calculei manualmente
update tbConta set saldo = '6148.42' where numConta = '9876';
select nome, email, endereco from tbCliente where nome = 'Monica';
update tbCliente set email = 'enildo@escola.com' where  nome = 'Enildo';
update tbConta set saldo = saldo - 30;
-- Para conseguir fazer o delete da conta 9878 deve se retirar ela como chave estrangeira na tbHistorico
delete from tbHistorico where numConta = 9878;
delete from tbConta where numConta = 9878;






