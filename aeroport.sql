
#Creare Tabel Airlines - stochează informațiile despre companiile aeriene.
CREATE TABLE Airlines (
    AirlineID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Country VARCHAR(50)
);

#Creare tabel Planes - stochează informațiile despre avioane
CREATE TABLE Planes (
    PlaneID INT PRIMARY KEY AUTO_INCREMENT,
    Model VARCHAR(100) NOT NULL,
    Capacity INT NOT NULL,
    AirlineID INT,
    FOREIGN KEY (AirlineID) REFERENCES Airlines(AirlineID)
);
#Creare tabel Passengers - stochează informațiile despre pasageri.
CREATE TABLE Passengers (
    PassengerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    PassportNumber VARCHAR(20) UNIQUE NOT NULL
);
#Creare Tabel Flights - stochează informațiile despre zboruri.
CREATE TABLE Flights (
    FlightID INT PRIMARY KEY AUTO_INCREMENT,
    FlightNumber VARCHAR(20) UNIQUE NOT NULL,
    PlaneID INT,
    DepartureAirport VARCHAR(100) NOT NULL,
    ArrivalAirport VARCHAR(100) NOT NULL,
    DepartureTime DATETIME,
    ArrivalTime DATETIME,
    FOREIGN KEY (PlaneID) REFERENCES Planes(PlaneID)
);

# Creare Tabel Tickets - stochează informațiile despre biletele de zbor.
CREATE TABLE Tickets (
    TicketID INT PRIMARY KEY AUTO_INCREMENT,
    FlightID INT,
    PassengerID INT,
    SeatNumber VARCHAR(10),
    BookingDate DATETIME,
    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID),
    FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID)
);

#Creare Tabel Employees - stochează informațiile despre angajați.
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Position VARCHAR(50),
    AirlineID INT,
    FOREIGN KEY (AirlineID) REFERENCES Airlines(AirlineID)
);

#iINSTRUCTIUNI DML
#Inserarea datelor
#Inserarea companiilor aeriene
INSERT INTO airlines (Name, Country) VALUES ('AIR FRANCE', 'FRANTA');
INSERT INTO airlines (Name, Country) VALUES ('LUFTHANSA', 'GERMANIA');
INSERT INTO airlines (Name, Country) VALUES ('BRITISH AIRLINES', 'UK');
INSERT INTO airlines (Name, Country) VALUES ('AMERICAN AIRLINES', 'USA');
INSERT INTO airlines (Name, Country) VALUES ('UNITED AIRLINES', 'USA');
INSERT INTO airlines (Name, Country) VALUES ('AIR CANADA', 'CANADA');
INSERT INTO airlines (Name, Country) VALUES ('QATAR AIRWAYS', 'QATAR');
INSERT INTO airlines (Name, Country) VALUES ('EMIRATES', 'EMIRATELE ARABE UNITE');
INSERT INTO airlines (Name, Country) VALUES ('WIZZAIR', 'UNGARIA');
INSERT INTO airlines (Name, Country) VALUES ('RYANAIR', 'IRLANDA');

#Inserarea avioanelor
INSERT INTO Planes (Model, Capacity, AirlineID) VALUES ('Airbus A380', 516, 1);
INSERT INTO Planes (Model, Capacity, AirlineID) VALUES ('Boeing 747-8', 364, 2);
INSERT INTO Planes (Model, Capacity, AirlineID) VALUES ('Boeing 777-300ER', 299, 3);
INSERT INTO Planes (Model, Capacity, AirlineID) VALUES ('Boeing 737-800', 160, 4);
INSERT INTO Planes (Model, Capacity, AirlineID) VALUES ('Airbus A350-900', 306, 5);
INSERT INTO Planes (Model, Capacity, AirlineID) VALUES ('Boeing 787-9', 252, 6);
INSERT INTO Planes (Model, Capacity, AirlineID) VALUES ('Boeing 787-9', 236, 7);
INSERT INTO Planes (Model, Capacity, AirlineID) VALUES ('Airbus A220-300', 137, 8);
INSERT INTO Planes (Model, Capacity, AirlineID) VALUES ('Airbus A380', 489, 9);
INSERT INTO Planes (Model, Capacity, AirlineID) VALUES ('Airbus A350-1000', 327, 10);

#Inserarea pasagerilor
INSERT INTO Passengers (Name, PassportNumber) VALUES ('Ion Popescu', 'C12345678');
INSERT INTO Passengers (Name, PassportNumber) VALUES ('Maria Ionescu', 'D98765432');
INSERT INTO Passengers (Name, PassportNumber) VALUES ('Mihai Vasile', 'E12345678');
INSERT INTO Passengers (Name, PassportNumber) VALUES ('Elena Dumitrescu', 'F98765432');
INSERT INTO Passengers (Name, PassportNumber) VALUES ('Alexandru Marin', 'G12345678');
INSERT INTO Passengers (Name, PassportNumber) VALUES ('Adriana Stoica', 'H98765432');
INSERT INTO Passengers (Name, PassportNumber) VALUES ('Constantin Radu', 'I12345678');
INSERT INTO Passengers (Name, PassportNumber) VALUES ('Simona Florescu', 'J98765432');
INSERT INTO Passengers (Name, PassportNumber) VALUES ('George Iliescu', 'K12345678');
INSERT INTO Passengers (Name, PassportNumber) VALUES ('Anca Grigorescu', 'L98765432');

#Inserarea zborurilor
INSERT INTO Flights (FlightNumber, PlaneID, DepartureAirport, ArrivalAirport, DepartureTime, ArrivalTime) 
VALUES ('AA100', 1, 'JFK', 'LHR', '2024-07-01 08:00:00', '2024-07-01 20:00:00');
INSERT INTO Flights (FlightNumber, PlaneID, DepartureAirport, ArrivalAirport, DepartureTime, ArrivalTime) 
VALUES ('BA200', 2, 'LHR', 'JFK', '2024-07-02 09:00:00', '2024-07-02 21:00:00');
INSERT INTO Flights (FlightNumber, PlaneID, DepartureAirport, ArrivalAirport, DepartureTime, ArrivalTime) 
VALUES ('UA300', 3, 'LAX', 'SFO', '2024-07-03 10:00:00', '2024-07-03 11:30:00');
INSERT INTO Flights (FlightNumber, PlaneID, DepartureAirport, ArrivalAirport, DepartureTime, ArrivalTime) 
VALUES ('DL400', 4, 'ATL', 'MIA', '2024-07-04 12:00:00', '2024-07-04 14:00:00');
INSERT INTO Flights (FlightNumber, PlaneID, DepartureAirport, ArrivalAirport, DepartureTime, ArrivalTime) 
VALUES ('AA500', 5, 'ORD', 'DFW', '2024-07-05 13:00:00', '2024-07-05 15:30:00');
INSERT INTO Flights (FlightNumber, PlaneID, DepartureAirport, ArrivalAirport, DepartureTime, ArrivalTime) 
VALUES ('UA600', 6, 'DEN', 'SEA', '2024-07-06 14:00:00', '2024-07-06 16:00:00');
INSERT INTO Flights (FlightNumber, PlaneID, DepartureAirport, ArrivalAirport, DepartureTime, ArrivalTime) 
VALUES ('BA700', 7, 'LHR', 'CDG', '2024-07-07 15:00:00', '2024-07-07 16:30:00');
INSERT INTO Flights (FlightNumber, PlaneID, DepartureAirport, ArrivalAirport, DepartureTime, ArrivalTime) 
VALUES ('DL800', 8, 'MSP', 'ORD', '2024-07-08 16:00:00', '2024-07-08 17:30:00');
INSERT INTO Flights (FlightNumber, PlaneID, DepartureAirport, ArrivalAirport, DepartureTime, ArrivalTime) 
VALUES ('AA900', 9, 'DFW', 'LAX', '2024-07-09 17:00:00', '2024-07-09 19:00:00');
INSERT INTO Flights (FlightNumber, PlaneID, DepartureAirport, ArrivalAirport, DepartureTime, ArrivalTime) 
VALUES ('UA1000', 10, 'SFO', 'JFK', '2024-07-10 18:00:00', '2024-07-10 23:00:00');

#Inserarea biletelor
INSERT INTO Tickets (FlightID, PassengerID, SeatNumber, BookingDate) VALUES (1, 1, '12A', '2024-06-15 10:00:00');
INSERT INTO Tickets (FlightID, PassengerID, SeatNumber, BookingDate) VALUES (2, 2, '15B', '2024-06-16 11:00:00');
INSERT INTO Tickets (FlightID, PassengerID, SeatNumber, BookingDate) VALUES (3, 3, '20C', '2024-06-17 12:30:00');
INSERT INTO Tickets (FlightID, PassengerID, SeatNumber, BookingDate) VALUES (4, 4, '5D', '2024-06-18 13:45:00');
INSERT INTO Tickets (FlightID, PassengerID, SeatNumber, BookingDate) VALUES (5, 5, '10E', '2024-06-19 14:15:00');
INSERT INTO Tickets (FlightID, PassengerID, SeatNumber, BookingDate) VALUES (6, 6, '8F', '2024-06-20 15:00:00');
INSERT INTO Tickets (FlightID, PassengerID, SeatNumber, BookingDate) VALUES (7, 7, '3G', '2024-06-21 16:20:00');
INSERT INTO Tickets (FlightID, PassengerID, SeatNumber, BookingDate) VALUES (8, 8, '18H', '2024-06-22 17:30:00');
INSERT INTO Tickets (FlightID, PassengerID, SeatNumber, BookingDate) VALUES (9, 9, '1A', '2024-06-23 18:45:00');
INSERT INTO Tickets (FlightID, PassengerID, SeatNumber, BookingDate) VALUES (10, 10, '7B', '2024-06-24 19:00:00');

#Inserarea angajaților
INSERT INTO Employees (Name, Position, AirlineID) VALUES ('Maria Popescu', 'Engineer', 1);
INSERT INTO Employees (Name, Position, AirlineID) VALUES ('Andrei Ionescu', 'Technician', 2);
INSERT INTO Employees (Name, Position, AirlineID) VALUES ('Ana Mihai', 'Customer Service Representative', 3);
INSERT INTO Employees (Name, Position, AirlineID) VALUES ('Ion Stoica', 'Operations Manager', 4);
INSERT INTO Employees (Name, Position, AirlineID) VALUES ('Elena Dumitrescu', 'Cabin Crew Manager', 5);
INSERT INTO Employees (Name, Position, AirlineID) VALUES ('Alexandru Marinescu', 'Ground Staff', 6);
INSERT INTO Employees (Name, Position, AirlineID) VALUES ('Cristina Radu', 'Sales Representative', 7);
INSERT INTO Employees (Name, Position, AirlineID) VALUES ('Adrian Georgescu', 'Security Officer', 8);
INSERT INTO Employees (Name, Position, AirlineID) VALUES ('Larisa Vasilescu', 'Training Coordinator', 9);
INSERT INTO Employees (Name, Position, AirlineID) VALUES ('Gabriel Cojocaru', 'Quality Assurance', 10);

#Ștergerea și actualizarea datelor

#Stergerea unui avion
#DELETE FROM Planes WHERE PlaneID = 2;

#Actualizarea poziției unui angajat
UPDATE Employees SET Position = 'Senior Pilot' WHERE EmployeeID = 1;

#Instructiuni DQL

#Selectarea tuturor zborurilor
SELECT * FROM Flights;

#Selectarea numelui și pasaportului tuturor pasagerilor
SELECT Name, PassportNumber FROM Passengers;

#Selectarea zborurilor care pleacă de pe un anumit aeroport
SELECT * FROM Flights WHERE DepartureAirport = 'JFK';

#Selectarea pasagerilor ale căror nume încep cu 'G'
SELECT * FROM Passengers WHERE Name LIKE 'G%';

#Selectarea zborurilor operate de o anumită companie aeriană
SELECT Flights.* FROM Flights
JOIN Planes ON Flights.PlaneID = Planes.PlaneID
JOIN Airlines ON Planes.AirlineID = Airlines.AirlineID
WHERE Airlines.Name = 'Airline A';

#Calcularea numărului total de pasageri pe un anumit zbor
SELECT FlightID, COUNT(*) AS TotalPassengers FROM Tickets
GROUP BY FlightID;

#Selectarea avioanelor care aparțin unei companii aeriene care are mai mult de un avion
SELECT AirlineID, COUNT(*) AS NumberOfPlanes FROM Planes
GROUP BY AirlineID HAVING COUNT(*) > 1;

#Inner Join între zboruri și avioane
SELECT Flights.FlightNumber, Planes.Model FROM Flights
INNER JOIN Planes ON Flights.PlaneID = Planes.PlaneID;

#Left Join între bilete și pasageri
SELECT Tickets.TicketID, Passengers.Name, Passengers.PassportNumber FROM Tickets
LEFT JOIN Passengers ON Tickets.PassengerID = Passengers.PassengerID;

#Right Join între angajați și companii aeriene
SELECT Employees.Name, Airlines.Name AS Airline FROM Employees
RIGHT JOIN Airlines ON Employees.AirlineID = Airlines.AirlineID;

#Cross Join între zboruri și pasageri
SELECT Flights.FlightNumber, Passengers.Name FROM Flights
CROSS JOIN Passengers;

#Selectarea primelor 5 zboruri după ora de plecare
SELECT * FROM Flights ORDER BY DepartureTime ASC LIMIT 5;

#Selectarea biletelor ordonate după data rezervării
SELECT * FROM Tickets ORDER BY BookingDate DESC;








