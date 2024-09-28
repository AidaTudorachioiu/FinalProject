<h1>Database Project for **Airport**</h1>

The scope of this project is to use all the SQL knowledge gained throught the Software Testing course and apply them in practice.

**Application implemented**: Airport database

**Tools used**: MySQL Workbench

**Database description**: _Descriere_baza de date


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

_#Creare Tabel Airlines - stochează informațiile despre companiile aeriene._
```
CREATE TABLE Airlines (
    AirlineID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Country VARCHAR(50)
);
```
  After the database and the tables have been created, a few ALTER instructions were written in order to update the structure of the database, as described below:

  **Inserati aici toate instructiunile de ALTER pe care le-ati scris. Incercati sa includeti instructiuni cat mai variate cum ar fi:**
 **- schimbare nume tabela**
 **- adaugare sau stergere coloana**
 **- redenumire coloana**
 **- adaugare proprietati coloana (ex: adaugare auto-increment)**
 **- modificare proprietati coloana (ex: modificare tip de data, modificare pozitie coloana etc)**
 **- adaugare cheie primara sau secundara (daca nu a fost deja adaugata la crearea tabelei)**
 
  
### DML (Data Manipulation Language)

  In order to be able to use the database I populated the tables with various data necessary in order to perform queries and manipulate the data. 
  In the testing process, this necessary data is identified in the Test Design phase and created in the Test Implementation phase. 

  Below you can find all the insert instructions that were created in the scope of this project:

After the testing process, I deleted the data that was no longer relevant in order to preserve the database clean: 

  **Inserati aici toate instructiunile de INSERT pe care le-ati scris. Incercati sa folositi atat insert pe toate coloanele (fara sa precizati pe ce coloane se face insert) cat si insert pe cateva coloane (care necesita mentionarea explicita a coloanelor pe care se face insert). De asemenea, incercati sa acoperiti situatia in care inserati mai multe randuri in acelasi timp**

  After the insert, in order to prepare the data to be better suited for the testing process, I updated some data in the following way:

  **Inserati aici toate instructiunile de UPDATE pe care le-ati scris folosind filtrarile necesare astfel incat sa actualizati doar datele de care aveti nevoie**
After the testing process, I deleted the data that was no longer relevant in order to preserve the database clean: 
**Inserati aici toate instructiunile de DELETE pe care le-ati scris folosind filtrarile necesare astfel incat sa stergeti doar datele de care aveti nevoie**
  ### DQL (Data Query Language)





In order to simulate various scenarios that might happen in real life I created the following queries that would cover multiple potential real-life situations:

**Inserati aici toate instructiunile de SELECT pe care le-ati scris folosind filtrarile necesare astfel incat sa extrageti doar datele de care aveti nevoie**
**Incercati sa acoperiti urmatoarele:**<br>
**- where**<br>
**- AND**<br>
**- OR**<br>
**- NOT**<br>
**- like**<br>
**- inner join**<br>
**- left join**<br>
**- OPTIONAL: right join**<br>
**- OPTIONAL: cross join**<br>
**- functii agregate**<br>
**- group by**<br>
**- having**<br>
**- OPTIONAL DAR RECOMANDAT: Subqueries - nu au fost in scopul cursului. Puteti sa consultati tutorialul [asta](https://www.techonthenet.com/mysql/subqueries.php) si daca nu intelegeti ceva contactati fie trainerul, fie coordonatorul de grupa**<br>



## Conclusions

Inserati aici o concluzie cu privire la ceea ce ati lucrat, gen lucrurile pe care le-ati invatat, lessons learned, un rezumat asupra a ceea ce ati facut si orice alta informatie care vi se pare relevanta pentru o concluzie finala asupra a ceea ce ati lucrat


