-- criação banco de dados para o cenáriode e-commerce

-- drop database oficina;
create database oficina;
use oficina;

-- criar tabela cliente
create table clients(
	idClient int auto_increment primary key,
    Nome varchar(10),
    Carro char(3),
    CPF char(11) not null,
    constraint unique_cpf_client unique (CPF)
);

-- criar tabela mecanico
	create table mechanical(
	idMecanico int auto_increment primary key,
    Registro char(15) not null,
    Nome varchar(10),
    Especialidade varchar(20),
    constraint unique_registro_mechanical unique (Registro)
);

-- criar tabela produto
create table service(
	idServico int auto_increment primary key,
    Conserto varchar(10),
    Revisão varchar(10),
    category enum('Conserto','Revisão') not null,
    avaliação float default 0
);

-- criar tabela custo
create table custo(
	peca int,
    Mao_de_obra int,
    limitAvailable float,
    primary key(peca, Mao_de_obra)
);

-- criar tabela ordem de pedido
create table orders(
	idOrdem int auto_increment primary key,
	Codigo int,
    Data_de_emissao date,
    valor_paymentCash bool default false,
	status enum('Inicio','Em andamento','Finalizado') default 'Em andamento',
    Data_de_emissao date,
	constraint fk_ordes_client foreign key (idOrdem) references clients(idClient)
		on update cascade
);

create table serviceClient(
	idPClient int,
    idPServico int,
    primary key (idClient, idServico),
    constraint fk_product_service foreign key (idPClient) references service(idClient),
    constraint fk_product_client foreign key (idPServico) references product(idClient)
);

create table cust_order(
	idPCusto int,
    idPOrder int,
    primary key (idPCusto, idPOrder),
    constraint fk_productorder_custo foreign key (idPCusto) references service(idCusto),
    constraint fk_productorder_orders foreign key (idPOrder) references product(idOrdem)
);

show databases;
use information_schema;
show tables;
desc referential_constraints;
select * from referential_constraints where constraint_schema = 'oficina';