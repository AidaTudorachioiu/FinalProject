<h1>Database Project for **Airport**</h1>

The scope of this project is to use all the SQL knowledge gained throught the Software Testing course and apply them in practice.

**Application implemented**: Airport database


**Tools used**: MySQL Workbench


**Database description**: The database is designed for an airline company and manages information about airlines, planes, passengers, flights, tickets and employees, facilitating the efficient operation of the company and ensuring a good experience for passengers.


## Database Schema 


You can find below the database schema that was generated through Reverse Engineer and which contains all the tables and the relationships between them.

![image](https://github.com/user-attachments/assets/05b305c8-258a-46e7-a638-329d8f66864b)

The tables are connected in the following way:


- **airlines**  is connected with **planes** through a **1** relationship which was implemented through **airlines.AirlineID** as a primary key and **planes.AirlineID** as a foreign key
  
- **planes**  is connected with **flights** through a **1** relationship which was implemented through **plane.PlaneID** as a primary key and **flight.PlaneID** as a foreign key
  
- **flights**  is connected with **tickets** through a **1** relationship which was implemented through **flights.FlightID** as a primary key and **tickets.FlightID** as a foreign key
  
- **passengers**  is connected with **tickets** through a **1** relationship which was implemented through **passengers.PassengerID** as a primary key and **tickets.PassengerID** as a foreign key


## Database Queries


### DDL (Data Definition Language)


  The following instructions were written in the scope of CREATING the structure of the database (CREATE INSTRUCTIONS)

_#Create Airlines Table - stores information about airlines._
```
CREATE TABLE Airlines (
    AirlineID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Country VARCHAR(50)
);
```

_#Create Planes Table - stores information about planes_
```
CREATE TABLE Planes (
    PlaneID INT PRIMARY KEY AUTO_INCREMENT,
    Model VARCHAR(100) NOT NULL,
    Capacity INT NOT NULL,
    AirlineID INT,
    FOREIGN KEY (AirlineID) REFERENCES Airlines(AirlineID)
);
```

_#Create Passengers Table - store information about passengers._
```
CREATE TABLE Passengers (
    PassengerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    PassportNumber VARCHAR(20) UNIQUE NOT NULL
);
```

_#Create Flights Tabel  - store information about flights._
```
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
```

_#Create Tickets Tabel - store information about tickets._
```
CREATE TABLE Tickets (
    TicketID INT PRIMARY KEY AUTO_INCREMENT,
    FlightID INT,
    PassengerID INT,
    SeatNumber VARCHAR(10),
    BookingDate DATETIME,
    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID),
    FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID)
);
```

_#Create Employees Tabel - store information about employees._
```
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Position VARCHAR(50),
    AirlineID INT,
    FOREIGN KEY (AirlineID) REFERENCES Airlines(AirlineID)
);
```

  After the database and the tables have been created, a few **ALTER** instructions were written in order to update the structure of the database, as described below:

_#Rename a table_
```
RENAME TABLE Airlines TO AirlineCompanies;
```

_#Renaming the column Passengers_
```
 ALTER TABLE Passengers CHANGE Name PassengerName VARCHAR(100);
```
 
  
### DML (Data Manipulation Language)


  In order to be able to use the database I populated the tables with various data necessary in order to perform queries and manipulate the data. 
  In the testing process, this necessary data is identified in the Test Design phase and created in the Test Implementation phase. 

  Below you can find all the insert instructions that were created in the scope of this project:

After the testing process, I deleted the data that was no longer relevant in order to preserve the database clean: 

_#Insert airlines_
```
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
```

_#Insert planes_
```
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
```

_#Insert passengers_
```
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
```

_#Insert flights_
```
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
```

_#Insert tickets_
```
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
```

_#Insert employees_
```
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
```

  After the insert, in order to prepare the data to be better suited for the testing process, I updated some data in the following way:

  _#Updating an employee's position_
 ```
UPDATE Employees SET Position = 'Senior Pilot' WHERE EmployeeID = 1;
```

After the testing process, I deleted the data that was no longer relevant in order to preserve the database clean: 

 _#Delete data from a table_
 ```
DELETE FROM Planes WHERE PlaneID = 2;
```

  ### DQL (Data Query Language)


In order to simulate various scenarios that might happen in real life I created the following queries that would cover multiple potential real-life situations:

_#Select all flights_
```
SELECT * FROM Flights;
```

_#Select the name and passport number of all passengers_
```
SELECT Name, PassportNumber FROM Passengers;
```

_#Select the flights departing from a specific airport_
```
SELECT * FROM Flights WHERE DepartureAirport = 'JFK';
```

_#Select the passengers whose names start with 'G'_
```
SELECT * FROM Passengers WHERE Name LIKE 'G%';
```

_#Select the flights operated by a specific airline_
```
SELECT Flights.* FROM Flights
JOIN Planes ON Flights.PlaneID = Planes.PlaneID
JOIN Airlines ON Planes.AirlineID = Airlines.AirlineID
WHERE Airlines.Name = 'Airline A';
```

_#Calculate the total number of passengers on a specific flight_
```
SELECT FlightID, COUNT(*) AS TotalPassengers FROM Tickets
GROUP BY FlightID;
```

_#Select the airplanes belonging to an airline that owns more than one airplane_
```
SELECT AirlineID, COUNT(*) AS NumberOfPlanes FROM Planes
GROUP BY AirlineID HAVING COUNT(*) > 1;
```

_#Inner Join between flights and planes_
```
SELECT Flights.FlightNumber, Planes.Model FROM Flights
INNER JOIN Planes ON Flights.PlaneID = Planes.PlaneID;
```

_#Left Join between tickets and passengers_
```
SELECT Tickets.TicketID, Passengers.Name, Passengers.PassportNumber FROM Tickets
LEFT JOIN Passengers ON Tickets.PassengerID = Passengers.PassengerID;
```

_#Right Join between employees and airlines_
```
SELECT Employees.Name, Airlines.Name AS Airline FROM Employees
RIGHT JOIN Airlines ON Employees.AirlineID = Airlines.AirlineID;
```

_#Cross Join between flights and passengers_
```
SELECT Flights.FlightNumber, Passengers.Name FROM Flights
CROSS JOIN Passengers;
```

_#Select the first 5 flights by departure time_
```
SELECT * FROM Flights ORDER BY DepartureTime ASC LIMIT 5;
```

_#Select the tickets ordered by booking date_
```
SELECT * FROM Tickets ORDER BY BookingDate DESC;
```


## Conclusions

This project provided me with a deep understanding of how to build and manage a complex database. I learned how to plan and implement test data, write and execute efficient SQL queries, and ensure data integrity and accuracy. These skills and knowledge are fundamental for the development and maintenance of robust and reliable database systems


