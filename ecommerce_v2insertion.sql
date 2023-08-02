use ecommerce;


insert into clients (Fname, Minit, Lname, Address, birthdate) 
			  values ('Empresa' , ' ', 'Tabajara',  'rua Brasil, 1 - bairro 1 - Rio de Janeiro/RJ', '1990-04-15'),
					 ('Fábio', 'T', 'Carneiro', 'rua Argentina, 2 - bairro 2 - Rio de Janeiro/RJ', '1992-06-19'),
                     ('Rita', 'V', 'Carvalho',  'rua Chile, 3 - bairro 3 - Rio de Janeiro/RJ', '1964-12-05'),
                     ('Carlos', 'L', 'Borges',  'rua Uruguai, 4 - bairro 4 - Rio de Janeiro/RJ', '1968-05-07'),
                     ('Casas', ' ', 'Bahia',  'rua Colombia, 5 - bairro 5 - Rio de Janeiro/RJ', '2016-09-10'),
                     ('Compras', ' ', 'OnLine',  'rua Peru 6 - bairro 6 - Rio de Janeiro/RJ', '1988-09-09');

                   
select * from clients;

insert into client_Type (Ctype, Cnum) 
			  values ('CNPJ', '123456789102345'),
					 ('CPF', '12345678911'),
                     ('CPF', '12345678912'),
                     ('CPF', '12345678913'),
                     ('CNPJ', '123456789143333'),
                     ('CNPJ', '123456789154444');

select * from client_Type;




insert into product (Pname, classification_kids, category, Pdescription, Pprice, avaliação, size)
			  values ('TV LED', default, 'Eletrônico', 'Aparelho 42 polegadas Full HD', 1999.99, 6, '1x0.7x0.05'),
					 ('Barbie', true, 'Brinquedo', 'Loura - vestido rosa', 49.99, 7, null),
                     ('Moleton', default, 'Vestuário', 'Casaco HangLoose', 99.99, 8, null),
                     ('Barra Whey', default, 'Alimentos', 'pacote com 4', 29.99, 9, null),
                     ('Cadeira', default, 'Móveis', 'Cadeira Gamer', 529.68, 10, '.8x.6x1.5');

               
select * from product;

insert into payments (typePayment) 
			  values ('Cartão'), ('PIX'), ('Dois Cartões'), ('Boleto'), ('Cartão'),
                     ('PIX'), ('Cartão'), ('Dois Cartões'), ('Boleto'), ('PIX'),
                     ('PIX'), ('Cartão'), ('Boleto'), ('Dois Cartões'), ('PIX');
                     
select * from payments;

insert into deliver (Deliver_id, Del_status, tracking_code)
			  values (1,  default, 1111111111),
					 (2,  default, 1111111112),
                     (3,  default, 1111111113),
                     (4,  default, 1111111114),
                     (5,  default, 1111111115),
                     (6,  default, 1111111116),
                     (7,  default, 1111111117),
                     (8,  default, 1111111118),
                     (9,  default, 1111111119),
                     (10, default, 1111111120),
                     (11, default, 1111111121),
                     (12, default, 1111111122),
                     (13, default, 1234567812),
                     (14, default, 1234567813),
                     (15, default, 1234567814);

          
select * from deliver;


insert into orders (idOrderClient, orderStatus, orderDescripition, freightValue, paymentCash)
			 values (1, 'Cancelado', 'Cliente desistiu', 20, default),
					(1, 'Em processamento', 'Aguardando o pagamento', 30, default),
                    (1, 'Enviado', 'Objeto em trânsito para o cliente', 40, default),
                    (1, 'Entregue', 'Objeto entregue para o cliente', 50, default),
                    (2, 'Enviando', 'Foi entregue na trasnportadora', 20, default),
                    (2, 'Entregue', 'Objeto entregue para o cliente', 50, default),
                    (3, 'Enviando', 'Foi entregue na trasnportadora', 20, default),
                    (3, 'Enviado', 'Objeto em trânsito para o cliente', 40, default),
                    (3, 'Entregue', 'Objeto entregue para o cliente', 50, default),
                    (4, 'Em processamento', 'Aguardando o pagamento', 30, default),
                    (5, 'Enviado', 'Objeto em trânsito para o cliente', 40, default),
                    (6, 'Entregue', 'Objeto entregue para o cliente', 50, default);
                    
 insert into orders (idOrderClient, idOrderPayment, orderStatus, orderDescripition,  freight)
			 values (2,1,default, 'app', default),
					(2,2,default, 'website', 30),
                    (3,3,default, 'website', 40),
                    (3, 4, default,'app promo black friday', default),
                    (3, 5, default, 'website cartão fidelidade', 20),
                    (4, 6, default, 'website', 30),
                    (4, 7, default, 'app', 40),
                    (5, 8, default, 'website com cupom de desconto', default),
                    (6, 9, default, 'app', 20),
                    (3, 10, default, 'website com vale presente', 40),
                    (1, 11, default, 'app', default),
                    (2, 12, default, 'website', 30),
                    (5, 13, default, 'website', default),
                    (4, 14, default, 'website', 40),
                    (6, 15, default, 'app', 50);                   

             
select * from orders;



insert into productStorage (storagelocation, quantity)
			values ('Cabo Frio', 4), 
				   ('Teresopolis', 3), 
                   ('Macaé', 3), 
                   ('Nova Friburgo', 2), 
                   ('Volta Redonda', 6);

            
select * from productStorage;

insert into supplier (SocialName, CNPJ, contact)
			values ('Estrela', '111111111111111',  '11911111111'),
				   ('Whey Protein', '222222222222222', '11922222222'),
                   ('Toque a Campainha', '333333333333333', '11933333333'),
                   ('BlackBerry', '444444444444444', '11944444444'),
                   ('Alamoana', '555555555555555', '11955555555');

        
select * from supplier;


insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) 
			values ('Vende Brinquedos','Brinquedos Happy', '123456789123456', '98765432191','São Paulo', '11999999999'),
				   ('Vende Suplementos','Suplementos Emagrecer','123456789123457', '98765432193','Minas Gerais','31988888888'),
                   ('Vende Móveis', 'Móveis Clássicos','123456789123458', '98767832193', 'Bahia', '51977777777'),
                   ('Vende Eletrônicos', 'Eletrônicos D+','123456789123459', '98764983194', 'Rio Grande do Sul', '61966666666'),
                   ('Vende Moda','Moda Linda','123456789123450', '98765432195', 'Rio de Janeiro', '21955555555');

             
select * from seller;


insert into productSeller (idPseller, idProduct, prodQuantity)
			values (1, 2, 10),				
                   (2, 4, 7),
                   (3, 5, 2),
                   (4, 1, 6),
                   (5, 3, 10);

         
select * from productSeller;


insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus)
			values (1, 1, 1, default),
				   (1, 4, 1, default),
                   (2, 5, 1, 'Sem estoque'),
                   (3, 10, 1, default),
                   (4, 3, 1, 'Sem estoque'),
                   (5, 7, 1, default); 

             
select * from productOrder;


insert into storageLocation (idLproduct, idLstorage, location)
			values (1, 2, 'São Paulo'),				
                   (2, 4, 'Minas Gerais'),
                   (3, 5, 'Bahia'),
                   (4, 1, 'Rio Grande do Sul'),
                   (5, 3, 'Rio de Janeiro');

          
select * from storageLocation;                    


insert into productSupplier (idPsSupplier, idPsProduct, quantity)
			values (1, 4, 10),				
                   (2, 1, 7),
                   (3, 5, 2),
                   (4, 2, 6),
                   (5, 3, 10),
                   (5, 2, 10);

            
select * from productSupplier;  
                  