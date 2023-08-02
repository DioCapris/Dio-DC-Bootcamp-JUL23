-- criando banco de dados para cenario de ecommerce 
drop database ecommerce;
create database ecommerce;
use ecommerce;

create table clients(
		idClient int auto_increment primary key,
        Fname varchar(10),
        Minit char(3),
        Lname varchar(20),
        Address varchar(60),
        birthdate date not null
	);
    
alter table clients auto_increment=1;

create table client_type(
	idType int not null auto_increment,
    Ctype enum('CPF', 'CNPJ') default 'CPF',
    Cnum varchar(15) not null,
    primary key (idType),
    constraint unique_num_Ctype unique(Cnum),
    constraint fk_cliente_tipoCliente foreign key (idType) references clients(idClient)
);
alter table client_type auto_increment=1;



create table product(
	idProduct int auto_increment primary key,
    Pname varchar(15) not null,
    classification_kids  bool default false,
    category enum ('Eletrônico', 'Vestuário', 'Brinquedo', 'Alimentos', 'Móveis') not null,
    Pdescription varchar(255),
    Pprice float,
    avaliação float default 0,
	size varchar(15)
);

alter table product auto_increment=1;



create table payments(
	idPayment int auto_increment not null,
    typePayment enum('PIX', 'Boleto', 'Cartão', 'Dois cartões') default 'PIX',
    limitAvaiable float,
    -- limitAvailable é para quando se quiser implementar linha de crédito
    primary key(idPayment)
);
alter table payments auto_increment=1;

create table deliver(
	Deliver_id int not null auto_increment,
    Del_status enum('Enviando', 'Em processamento', 'Enviado', 'Entregue') default 'Em processamento',
    tracking_code char(10) not null,
    primary key (Deliver_id),
    constraint unique_trackingCod unique(tracking_code)
);
alter table deliver auto_increment=1;


create table orders(
	idOrder int auto_increment,
    idOrderClient int,
    idOrderPayment int,
    orderStatus enum('Cancelado', 'Enviado', 'Enviando', 'Entregue', 'Em processamento') default 'Em processamento',
    orderDescripition varchar(255),
    freight float default 10,
    primary key (idOrder, idOrderClient, idOrderPayment),
	constraint fk_order_payment foreign key (idOrderPayment) references payments(idPayment),
    constraint fk_order_deliver foreign key (idOrder) references deliver(Deliver_id),
    constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
);

alter table orders auto_increment=1;





create table productStorage(
	idProdStorage int auto_increment primary key,
    storageLocation varchar(225),
    quantity int default 0
);

alter table productStorage auto_increment=1;


create table supplier(
	idSupplier int auto_increment primary key,
    SocialName varchar(255) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
);

alter table supplier auto_increment=1;


create table seller(
	idSeller int auto_increment primary key,
    SocialName varchar(255) not null,
    AbstName varchar(255),
    CNPJ char(15),
    CPF char(11),
    location varchar(255),
    contact char(11) not null,
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);

alter table seller auto_increment=1;


create table productSeller(
	idPseller int,
    idProduct int,
    prodQuantity int default 1,
    primary key (idPseller, idProduct),
    constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
    constraint fk_product_product foreign key (idProduct) references product(idProduct)
);

create table productOrder(
	idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key (idPOproduct, idPOorder),
    constraint fk_productorder_seller foreign key (idPOproduct) references product(idProduct),
    constraint fk_productorder_product foreign key (idPOorder) references orders(idOrder)
);

create table storageLocation(
	idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
    constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage)
);


create table productSupplier(
	idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)
);

