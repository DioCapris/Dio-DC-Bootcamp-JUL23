USE workshop;

INSERT INTO clients (Cname, NIF, Cphone, Caddress) VALUES
('Tom Cruise', '11111111111', '2199999-9999', 'Rua Harrison Ford, 22, Rio de Janeiro, RJ'),
('Organizações Tabajara SA', '222222222222222', '2299999-9998', 'Rua Bussunda, 454, Rio de Jneiro, RJ'),
('Henry Cavill', '11111111112', '2199999-9997', 'Rua Brad Pitt, 3000, Rio de Janeiro, RJ'),
('ACME Incorporation', '222222222222223', '2199999-9996', 'Rua Papa Léguas, 33, Rio de Janeiro, RJ'),
('Sandra  Bullock', '11111111113', '2199999-9995', 'Rua Jennifer Lopez, 2323, Rio de Janeiro, RJ'),
('Pedra Filosofal Editora', '222222222222224', '2199999-9994', 'Rua Harry Potter, 99, Rio de Janeiro, RJ');


INSERT INTO vehicles (Model, Brand, Plate, SN, ClientidClient) VALUES
('Panamera', 'Porsche', 'XXX1111', 'XYZ444444444', 1),
('F500', 'Ford', 'XXX1112', 'XYZ444444445', 2),
('i7', 'BMW', 'XXX1113', 'XYZ444444446', 3),
('F250', 'Ford', 'XXX1114', 'XYZ444444447', 4),
('EQA', 'Mercedes', 'XXX1115', 'XYZ444444448', 5),
('Besta', 'Kia', 'XXX1116', 'XYZ444444449', 6);


INSERT INTO mechanics (Mcode, Mname, Maddress, Mphone) VALUES
(18, 'Vinicius Junior', 'Rua do Real, 88, Rio de Janeiro, RJ', '2196666-6666'),
(13, 'Roberto Carlos', 'Rua do Real, 89, Rio de Janeiro, RJ', '2196666-6665'),
(11,'Ronaldo Fenomeno', 'Rua da Real, 90, Rio de Janeiro, RJ', '2196666-6664'),
(8, 'Zedin Zidane', 'Rua do Real, 91, Rio de Janeiro, RJ', '2196666-6663'),
(7,  'Cristiano Ronado', 'Rua do Real, 92, Rio de Janeiro, RJ', '2196666-6662'),
(12,  'Karim Benzema', 'Rua do Real, 93, Rio de Janeiro, RJ', '2196666-6661');



INSERT INTO crews (Crew_name, Crew_main_area) VALUES
('VERDE', 'Geral'),
('AZUL', 'Elétrica'),
('VERMELHA', 'Mecânica');


INSERT INTO mechanics_crew (Crew_idCrew, Mechanics_idMechanics) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6);

INSERT INTO parts (idPart, Part_Name, Part_Supplier, Part_Cost) VALUES
(1, 'Bateria', 'AC Delco', 100.00),
(2, 'Anel de retenção', 'ZZZ', 101.00), 
(3, 'Filtro de óleo', 'ZTX', 102.00), 
(4, 'Motor de Arranque', 'Alumina', 103.00), 
(5, 'Óleo do motor', 'Castrol', 104.00), 
(6, 'Jogo de molas', 'Reinforced', 105.00), 
(7, 'Filtro de ar', 'Air Fryer',106.00), 
(8, 'Lampada  Farol',  'GE', 107.00), 
(9, 'Filtro de óleo',  'ZTX', 108.00),
(10, 'Óleo da caixa de marchas', 'Castrol', 109.00);



INSERT INTO servicesLC (Service_Name, Labor_cost) VALUES
('Revisão 10 mil quilômetros ', 100.00),
('Revisão 20 mil quilômetros ', 101.00),
('Troca de lâmpadas dos faróis', 102.00),
('Troca bateria', 103.00),
('Troca do motor de arranque', 104.00),
('Troca de óleo', 105.00);


INSERT INTO  orders (Vehicle_idVehicle, Vehicle_Client_idClient, Crew_idCrew, Service_idService) VALUES     
(1, 1, 1, 1),
(2, 2, 1, 2),
(3, 3, 2, 3),
(4, 4, 2, 4),
(5, 5, 3, 5),
(6, 6, 3, 6);


INSERT INTO parts_requests (Request_idRequest, Parts_idParts, Quantity) VALUES
(1, 1, 1),
(1, 2, 1),
(1, 3, 1),
(1, 4, 2),
(1, 5, 2),
(1, 6, 1),
(2, 7, 1),
(2, 8, 2),
(3, 9, 2),
(3, 10, 2),
(4, 1, 1),
(4, 8, 1),
(5, 3, 4);

INSERT INTO serviceOrders (SO_Num, Origin_date, SO_Status, Scheduled_deadline, Order_idOrder) VALUES 
('00001', '2023-08-02', 'Executando', '2023-08-15', 1),
('00002', '2023-07-04', 'Finalizada', '2023-07-12', 2),
('00003', '2023-06-14', 'Finalizada', '2023-06-30', 3),
('00004', curdate(), 'Aguardando peça', NULL, 4),
('00005', '2023-08-17', 'Executando', '2023-08-22', 5);




-- Consulta nome do cliente e veículo
SELECT Cname, Model, Brand, Plate
	FROM clients, vehicles
    WHERE idClient =  ClientidClient ORDER BY Cname ASC;
	
 -- Consulta clientes PJ e seus veículos   
SELECT Cname, NIF, Model, Brand, Plate
	FROM clients c , vehicles
    WHERE idClient =  ClientidClient AND length(NIF)>11 ORDER BY Cname ASC;
    
    
-- Consulta de mecânicos por equipe e área de especialização da equipe
SELECT m.Mname , m.Mcode, c.Crew_name, c.Crew_main_area
FROM mechanics as m
INNER JOIN mechanics_crew as mc ON m.idMechanic = mc.Mechanics_idMechanics
INNER JOIN crews as c ON Crew_idCrew = c.idCrew
ORDER BY c. Crew_name DESC;
   
-- Consulta das peças e seus preços por pedido
SELECT DISTINCT o.idOrder, p.Part_Name, p.Part_Cost, pr.Quantity
	FROM orders AS o
    INNER JOIN parts_requests AS pr ON o.idOrder = pr.Parts_idParts
    INNER JOIN parts AS p ON pr.Parts_idParts = p.idPart;


 
  
   



