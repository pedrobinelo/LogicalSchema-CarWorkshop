-- Creating database 'Car Workshop'
CREATE DATABASE car_workshop;
USE car_workshop;

-- Creating table Clients CREATED DATA INSERTED 
CREATE TABLE Clients(
	idClient INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    ClientName VARCHAR(50) NOT NULL,
    AddressCEP CHAR(8) NOT NULL,
    AddressNumber VARCHAR(3) NOT NULL,
    Email VARCHAR(256) NOT NULL,
    Phone CHAR(11) NOT NULL,
    CONSTRAINT unique_email_phone UNIQUE (Email, Phone)
);

-- Creating table Vehicle CREATED DATA INSERTED
CREATE TABLE Vehicle(
	idVehicle INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    idOwner int NOT NULL,
    Plate CHAR(7) NOT NULL UNIQUE,
    Model VARCHAR(20) NOT NULL,
    VehicleYear YEAR NOT NULL,
    CONSTRAINT fk_vehicle_owner FOREIGN KEY (idOwner) REFERENCES Clients(idClient)
);

-- Creating table Team CREATED DATA INSERTED
CREATE TABLE Team(
	idTeam INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    TeamName VARCHAR(15) NOT NULL UNIQUE
);

-- Creating table Mechanic CREATED DATA INSERTED
CREATE TABLE Mechanic(
	idMechanic INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    idMechanicTeam INT NOT NULL,
    MechanicName VARCHAR(50) NOT NULL,
    AddressCEP CHAR(8) NOT NULL,
    AddressNumber VARCHAR(3) NOT NULL,
    Specialty VARCHAR(30) NOT NULL,
    CONSTRAINT fk_mechanic_team FOREIGN KEY (idMechanicTeam) REFERENCES Team(idTeam)
);

-- Creating table ServiceOrder CREATED DATA INSERTED
CREATE TABLE ServiceOrder(
	idServiceOrder INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    idVehicle int NOT NULL,
    idVehicleOwner int NOT NULL,
    idTeam int NOT NULL,
    IssueDate DATE NOT NULL,
    TotalValue FLOAT NOT NULL,
    SOStatus ENUM('Completed', 'In Progress', 'Canceled') DEFAULT 'In Progress',
    CompletionDate DATE NOT NULL,
    CONSTRAINT fk_SO_Vehicle FOREIGN KEY (idVehicle) REFERENCES Vehicle(idVehicle),
    CONSTRAINT fk_SO_Client FOREIGN KEY (idVehicleOwner) REFERENCES Clients(idClient),
    CONSTRAINT fk_SO_Team FOREIGN KEY (idTeam) REFERENCES Team(idTeam)
);

-- Creating table Service CREATED DATA INSERTED
CREATE TABLE Service(
	idService INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    idSO int NOT NULL,
    ServiceDescription VARCHAR(100) NOT NULL,
    Price FLOAT NOT NULL,
    CONSTRAINT fk_service_SO FOREIGN KEY (idSO) REFERENCES ServiceOrder(idServiceOrder) 
);

-- Creating table Part CREATED DATA INSERTED
CREATE TABLE Part(
	idPart INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    idService INT NOT NULL,
    PartDescription VARCHAR(50) NOT NULL,
    Price FLOAT NOT NULL,
    CONSTRAINT fk_Part_Service FOREIGN KEY (idService) REFERENCES Service(idService)
);

ALTER TABLE Clients auto_increment = 1;
ALTER TABLE Vehicle auto_increment = 1;
ALTER TABLE Mechanic auto_increment = 1;
ALTER TABLE Service auto_increment = 1;
ALTER TABLE ServiceOrder auto_increment = 1;
ALTER TABLE Team auto_increment = 1;
ALTER TABLE Part auto_increment = 1;

-- Inserting data into Clients
INSERT INTO Clients (ClientName, AddressCEP, AddressNumber, Email, Phone)
VALUES 
	('João Silva', '12345678', '123', 'joao.silva@email.com', '11987654321'),
	('Maria Souza', '98765432', '456', 'maria.souza@email.com', '11998765432'),
	('Pedro Oliveira', '11111111', '789', 'pedro.oliveira@email.com', '11911111111'),
	('Ana Costa', '22222222', '101', 'ana.costa@email.com', '11922222222'),
	('Luiz Santos', '33333333', '202', 'luiz.santos@email.com', '11933333333');

-- SELECT * FROM Clients;

-- Inserting data into Vehicle
INSERT INTO Vehicle (idOwner, Plate, Model, VehicleYear)
VALUES 
	(1, 'ABC1234', 'Gol', 2015),
	(1, 'DEF5678', 'Fox', 2018),
	(2, 'GHI9012', 'Civic', 2012),
	(3, 'JKL3456', 'Corolla', 2016),
	(4, 'MNO7890', 'Focus', 2014),
	(5, 'PQR2345', 'Astra', 2017);

-- SELECT * FROM Vehicle;

-- Inserting data into Team
INSERT INTO Team (TeamName)
VALUES 
	('United'),
	('Gold'),
	('Diamond'),
	('GOATS'),
	('Elite');

-- SELECT * FROM Team;

-- Inserting data into Mechanic
INSERT INTO Mechanic (idMechanicTeam, MechanicName, AddressCEP, AddressNumber, Specialty)
VALUES 
	(1, 'Pedro Costa', '22222222', '101', 'Suspensão'),
	(1, 'Luiz Santos', '33333333', '202', 'Sistema de combustível'),
	(2, 'Carlos Oliveira', '44444444', '303', 'Veículos manuais'),
	(2, 'Sandro Silva', '55555555', '404', 'Veículos automáticos'),
	(3, 'Marcos Souza', '66666666', '505', 'Freios ABS'),
	(3, 'Gabriel Santos', '77777777', '606', 'Direção');

-- SELECT * FROM Mechanic;

-- Inserting data into ServiceOrder
INSERT INTO ServiceOrder (idVehicle, idVehicleOwner, idTeam, IssueDate, TotalValue, SOStatus, CompletionDate)
VALUES 
	(1, 1, 1, '2022-01-01', 500.00, 'Completed', '2022-01-05'),
	(2, 2, 2, '2022-01-15', 800.00, 'In Progress', '2022-02-01'),
	(3, 3, 3, '2022-02-01', 300.00, 'Canceled', '2022-02-05'),
	(4, 4, 1, '2022-03-01', 1000.00, 'In Progress', '2022-03-15'),
	(5, 5, 2, '2022-04-01', 600.00, 'Completed', '2022-04-10');

-- SELECT * FROM ServiceOrder;

-- Inserting data into Service
INSERT INTO Service (idSO, ServiceDescription, Price)
VALUES 
	(1, 'Troca de óleo', 100.00),
	(2, 'Revisão de freios', 200.00),
	(3, 'Troca de pneus', 300.00);

-- SELECT * FROM Service;

-- Inserting data into Part
INSERT INTO Part (idService, PartDescription, Price)
VALUES 
	(1, 'Óleo sintético', 50.00),
	(3, 'Pneu radial', 150.00),
	(2, 'Kit de freios', 200.00);

-- SELECT * FROM Part;

-- 1. Simple queries using SELECT Statement
SELECT * FROM Clients;
SELECT ClientName, Email, Phone FROM Clients;
SELECT Plate, Model, VehicleYear FROM Vehicle;
SELECT MechanicName, Specialty FROM Mechanic;
SELECT TeamName FROM Team;

-- 2. Filters with WHERE Statement
SELECT * FROM Clients WHERE AddressCEP = '79000000';
SELECT * FROM Vehicle WHERE VehicleYear > 2015;
SELECT * FROM Mechanic WHERE Specialty = 'Eletricista';
SELECT * FROM ServiceOrder WHERE SOStatus = 'In Progress';
SELECT * FROM Service WHERE Price > 150.00;

-- 3. Expressions for generating derived attributes
SELECT idServiceOrder, TotalValue, ROUND(TotalValue * 1.10, 2) AS TotalWithTaxes
FROM ServiceOrder;  

SELECT idService, Price, ROUND(Price * 0.90, 2) AS PriceWithDiscount
FROM Service;  -- Aplica 10% de desconto nos serviços

-- 4. Using ORDER BY 
SELECT * FROM Clients ORDER BY ClientName ASC;
SELECT * FROM Vehicle ORDER BY VehicleYear DESC;
SELECT * FROM Mechanic ORDER BY Specialty ASC, MechanicName ASC;
SELECT * FROM ServiceOrder ORDER BY IssueDate DESC;
SELECT * FROM Service ORDER BY Price DESC;

-- 5. HAVING Statement
SELECT idVehicleOwner, COUNT(*) AS TotalSOs
FROM ServiceOrder
GROUP BY idVehicleOwner
HAVING COUNT(*) >= 1;  --  Show only clients that have at least 1 SO

SELECT idTeam, AVG(TotalValue) AS AverageAmount
FROM ServiceOrder
GROUP BY idTeam
HAVING AVG(TotalValue) > 500.00;  -- Show teams with average > 500

SELECT idService, SUM(Price) AS PartsCost
FROM Part
GROUP BY idService
HAVING SUM(Price) > 100.00;  -- Services where the cost of parts is greater than 100

-- 6. Joins between tables to provide a more complex perspective of the data
-- View details of vehicles and their respective owners
SELECT v.Plate, v.Model, v.VehicleYear, c.ClientName, c.Phone
FROM Vehicle v
JOIN Clients c ON v.idOwner = c.idClient;

-- View service order details including customer and vehicle
SELECT so.idServiceOrder, c.ClientName, v.Plate, so.TotalValue, so.SOStatus
FROM ServiceOrder so
JOIN Clients c ON so.idVehicleOwner = c.idClient
JOIN Vehicle v ON so.idVehicle = v.idVehicle;

-- List the mechanics and the teams they belong to
SELECT m.MechanicName, m.Specialty, t.TeamName
FROM Mechanic m
JOIN Team t ON m.idMechanicTeam = t.idTeam;

-- List services and corresponding service orders
SELECT s.idService, s.ServiceDescription, so.idServiceOrder, so.SOStatus
FROM Service s
JOIN ServiceOrder so ON s.idSO = so.idServiceOrder;

-- List parts used in each service
SELECT p.PartDescription, p.Price, s.ServiceDescription
FROM Part p
JOIN Service s ON p.idService = s.idService;



