-- Quantos pedidos foram feitos por cada cliente?
use ecommerce;
select concat(c.Fname, ' ', c.Minit, '. ', c.Lname) as Nome_Cliente, count(*) as NoPedidos
from clients c
join orders o on c.idClient = o.idOrderClient
group by c.idClient;



-- Algum vendedor também é fornecedor?
select s.SocialName, s.CNPJ
from supplier s, seller se
where s.CNPJ = se.CNPJ;

-- Relação de produtos fornecedores e estoques;
select s.SocialName, p.Pname, pS.quantity, pS.storageLocation, sL.location
from supplier s
join productSupplier pSu on s.idSupplier = pSu.idPsSupplier        
join product p on p.idProduct = pSu.idPsProduct
join storageLocation sL on sL.idLproduct = p.idProduct
join productStorage pS on sL.idLstorage = pS.idProdStorage
order by pS.quantity;


-- Relação de nomes dos fornecedores e nomes dos produtos;
select s.SocialName as Fornecedor, p.Pname as product
from supplier s
join productSupplier ps on s.idSupplier = ps.idPsSupplier
join product p on p.idProduct = ps.idPsProduct;