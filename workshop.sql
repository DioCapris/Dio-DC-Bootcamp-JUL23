CREATE DATABASE workshop;
USE workshop;


CREATE TABLE  clients (
  idClient INT NOT NULL AUTO_INCREMENT,
  Cname VARCHAR(60) NOT NULL,
  NIF VARCHAR(15) NOT NULL,
  -- NIF (número de identificação fiscal) serve para CPF e CNPJ
  Cphone VARCHAR(12) NULL,
  Caddress VARCHAR(100) NULL,
  PRIMARY KEY (idClient),
  CONSTRAINT UNIQUE unique_NIF (NIF),
  CONSTRAINT UNIQUE unique_idClient (idClient)
  );
ALTER TABLE clients AUTO_INCREMENT = 1;



CREATE TABLE  vehicles (
  idVehicle INT NOT NULL AUTO_INCREMENT,
  Model VARCHAR(45) NOT NULL,
  Brand VARCHAR(45) NOT NULL,
  Plate VARCHAR(10) NOT NULL,
  SN VARCHAR(12) NOT NULL,
  ClientidClient INT NOT NULL,
  PRIMARY KEY (idVehicle, ClientidClient),
  CONSTRAINT UNIQUE unique_Plate (Plate),
  CONSTRAINT UNIQUE unique_SN (SN),
  CONSTRAINT fk_Vehicle_Client
    FOREIGN KEY (ClientidClient)
    REFERENCES clients (idClient)
    );
ALTER TABLE vehicles AUTO_INCREMENT = 1;



CREATE TABLE mechanics (
  idMechanic INT NOT NULL AUTO_INCREMENT,
  Mcode INT NOT NULL,
  Mname VARCHAR(60) NOT NULL,
  Maddress VARCHAR(100) NOT NULL,
  Mphone VARCHAR(12) NULL,
  PRIMARY KEY (idMechanic),
  CONSTRAINT UNIQUE unique_Mcode (Mcode)
  );
ALTER TABLE mechanics AUTO_INCREMENT = 1;



CREATE TABLE crews (
  idCrew INT NOT NULL AUTO_INCREMENT,
  Crew_name VARCHAR(45) NOT NULL,
  Crew_main_area VARCHAR(45) NOT NULL,
  PRIMARY KEY (idCrew)
  );
ALTER TABLE crews AUTO_INCREMENT = 1;



CREATE TABLE orders (
  idOrder INT NOT NULL AUTO_INCREMENT,
  Vehicle_idVehicle INT NOT NULL,
  Vehicle_Client_idClient INT NOT NULL,
  Crew_idCrew INT NOT NULL,
  Service_idService INT NOT NULL,
  PRIMARY KEY (idOrder, Vehicle_idVehicle, Vehicle_Client_idClient, Crew_idCrew, Service_idService),
  CONSTRAINT fk_Order_Vehicle
    FOREIGN KEY (Vehicle_idVehicle , Vehicle_Client_idClient)
    REFERENCES vehicles (idVehicle , ClientidClient),
  CONSTRAINT fk_Order_Crew
    FOREIGN KEY (Crew_idCrew)
    REFERENCES crews (idCrew)
    );
ALTER TABLE orders AUTO_INCREMENT = 1;



CREATE TABLE  parts (
  idPart INT NOT NULL AUTO_INCREMENT,
  Part_Name VARCHAR(45) NOT NULL,
  Part_Supplier VARCHAR(45) NOT NULL,
  Part_Cost FLOAT NOT NULL,
  PRIMARY KEY (idPart)
  );
ALTER TABLE parts AUTO_INCREMENT = 1;


CREATE TABLE  servicesLC (
  idService INT NOT NULL AUTO_INCREMENT,
  Service_Name VARCHAR(45) NOT NULL,
  Labor_cost FLOAT NOT NULL,
  PRIMARY KEY (idService)
  );
ALTER TABLE servicesLC AUTO_INCREMENT = 1;



CREATE TABLE serviceOrders (
  idServiceOrder INT NOT NULL AUTO_INCREMENT,
  SO_Num VARCHAR(45) NULL,
  Origin_date DATE NULL,
  SO_Status VARCHAR(45),
  Scheduled_deadline DATE NULL,
  Order_idOrder INT NOT NULL,
  PRIMARY KEY (idServiceOrder, Order_idOrder),
  CONSTRAINT UNIQUE unique_SONum (SO_Num),
  CONSTRAINT fk_SO_Order
    FOREIGN KEY (Order_idOrder)
    REFERENCES orders (idOrder)
    );
ALTER TABLE serviceOrders AUTO_INCREMENT = 1;



CREATE TABLE order_service (
  Order_idOrder INT NOT NULL,
  Service_idService INT NOT NULL,
  Quantity INT NULL,
  PRIMARY KEY (Order_idOrder, Service_idService),
  CONSTRAINT fk_order_has_SO
    FOREIGN KEY (Order_idOrder)
    REFERENCES orders (idOrder),
  CONSTRAINT fk_Order_has_Service_Service
    FOREIGN KEY (Service_idService)
    REFERENCES servicesLC (idService)
    );



CREATE TABLE parts_requests (
  Request_idRequest INT NOT NULL,
  Parts_idParts INT NOT NULL,
  Quantity INT NULL,
  PRIMARY KEY (Request_idRequest, Parts_idParts),
  CONSTRAINT fk_Order_has_Parts_Request
    FOREIGN KEY (Request_idRequest)
    REFERENCES orders (idOrder),
  CONSTRAINT fk_Request_has_Parts_Parts
    FOREIGN KEY (Parts_idParts)
    REFERENCES parts (idPart)
    );



CREATE TABLE mechanics_crew (
  Crew_idCrew INT NOT NULL,
  Mechanics_idMechanics INT NOT NULL,
  PRIMARY KEY (Crew_idCrew, Mechanics_idMechanics),
  CONSTRAINT fk_Crew_has_Mechanics_Crew
    FOREIGN KEY (Crew_idCrew)
    REFERENCES crews (idCrew),
  CONSTRAINT fk_Crew_has_Mechanics_Mechanics
    FOREIGN KEY (Mechanics_idMechanics)
    REFERENCES mechanics (idMechanic)
    );