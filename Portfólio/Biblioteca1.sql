--Exercício Biblioteca
--data 20/05/2025

--criação da base de dados
create database biblioteca_maio25
-- abrir a base de dados
use biblioteca_maio25 
go 

--criação das tabelas
create table Codpostals (
codpost1 int primary key,
cospost2 int,
localidade nvarchar(39));

create table Autores  (ida int primary key, 
nome nvarchar(40), 
morada nvarchar(40), 
codpost int foreign key references Codpostals(codpost1), 
datanasc nvarchar(10));

create table Editoras (ide int primary key,
nome nvarchar(40), 
morada nvarchar(30),
codpost int foreign key references Codpostals(codpost1),
telefone int);

create table livros (
idl int primary key, 
ida int foreign key references autores(ida), 
de int foreign key references editoras(ide), 
título nvarchar(45), 
num_páginas int, 
ano int);


create table Sócios (
ids int primary key, 
nome nvarchar (40), 
morada nvarchar (40), 
codpost1 int foreign key references codpostals(codpost1), 
datanasc nvarchar(10), 
telefone int)

create table Requisições (
idl int foreign key references livros(idl), 
ids int foreign key references Sócios(ids), 
data1 nvarchar(10));

insert into codpostals values(4100, 001, 'Lisboa'),
(4400, 096, 'V.N.Gaia'),
(4000, 034, 'Porto'),


insert into Autores values(100, 'António Manuel','Rua aeiou', 4100, '2010-04-15'),
(120, 'Joaquim Gomes','Rua xyz', 4400, '2010-04-14'),
(123, 'Maria Joaquina','Rua abc', 4000, '2010-04-13'),
(125, 'Beatriz Alves','Rua wyz', 4100, '2010-04-12'),
(130, 'Joana Afonso','Rua aaa', 4400, '2010-03-12')

insert into Editoras values
(1, 'Isla Gaia', 'Rua aa', 4100, 223775566),
(2, 'Porto Gaia', 'Rua bb', 4400 , 223775567),
(3, 'Porto Lisboa', 'Rua cc', 4000, 223775568)

insert into Livros values
(10, 100, 1, 'Os Maias', 200, 2005),
(20, 123, 2, 'Lusiadas', 350, 2000),
(30, 125, 1, 'Crime do Padre Amaro', 100, 2005),
(40, 123, 2, 'O Eclipse', 500, 2009)

insert into Sócios values
(1000, 'Maria João Sousa', 'Rua x', 4100, '2000-06-30', 223777755),
(2000, 'Maria Manuela Sousa', 'Rua zz', 4400, '2003-10-10', 223334455),
(3000, 'Adolfo', 'Rua abcd', 4100, '1965-11-08', 223747755),
(4000, 'Tomás', 'Rua aaab', 4400, '1975-11-08', 223335567)

insert into Requisições values
(10, 1000, '2005-04-01'),
(20, 2000, '2005-07-03'),
(10, 3000, '2009-10-10'),
(40, 3000, '2010-03-09')

--Listar o nome de todos os sócios.
select nome from sócios
-- Listar o nome de todos os livros com mais de 100 páginas.
select título from livros where num_páginas > 100
-- Listar, sem repetições, a localidade dos códigos postais superiores a 4000.
select distinct localidade from Codpostals where codpost1 > 4000 
-- Listar o número total de livros.
select count(*) from livros
-- Listar todos os livros editados em 2005 com titulo começado por O.
select * from livros
where título like 'O%' and ano=2005
-- Listar todos os livros que contém a palavra SQL  no titulo.
select * from livros where título like '%as%'
-- Número de requisições feitas em 2005.
select count(*) from Requisições where data1 like '2005%'
-- Nomes de sócios residentes em Lisboa.
select nome from Sócios where codpost1 like '4100%' 
--O) Nomes de autores que editam livros de mais do que uma editora.
select autores.nome, título,Editoras.nome
on autores.ida=livros.ida
inner join editoras
on livro.ide=editoras.ide

select autores.nome, COUNT(*)
from autores inner join livros
on autores.ida=livros.ida
inner join editoras
on livros.ide=editoras.ide
group by autores.nome
having count(*)>1

--P) Lista de todas as requisições efectuadas em 2005 ordenadas pelo número de sócio e incluindo as datas e os títulos dos livros requisitados.
select ids,Requisições.idl,data1,título
from livros inner join Requisições
on Requisições.idl=livros.idl
where data1 like '%2005%'
order by ids

select Requisições.idl, título, Requisições.idl,título, Requisições.data1,ids
from livros inner join Requisições
on Requisições.idl=livros.idl
where data1 like '%2005%'
order by ids desc






