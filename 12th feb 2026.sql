IT3223 ADBMS
2021/ICT/30

Date : 2026.02.12
==================================================

a)

MariaDB [(none)]> CREATE DATABASE Project_Supply;
Query OK, 1 row affected (0.003 sec)

MariaDB [(none)]> USE Project_Supply;
Database changed


CREATE TABLE Suppliers (
    SID VARCHAR(5) PRIMARY KEY,
    SName VARCHAR(20),
    Status INT,
    SCity VARCHAR(20)
);

CREATE TABLE Parts (
    PID VARCHAR(5) PRIMARY KEY,
    PName VARCHAR(20),
    Colour VARCHAR(15),
    Weight INT,
    PCity VARCHAR(20)
);

CREATE TABLE Projects (
    PrID VARCHAR(5) PRIMARY KEY,
    PrName VARCHAR(20),
    PrCity VARCHAR(20)
);

CREATE TABLE Shipments (
    SID VARCHAR(5),
    PID VARCHAR(5),
    PrID VARCHAR(5),
    Quantity INT,
    PRIMARY KEY (SID, PID, PrID),
    FOREIGN KEY (SID) REFERENCES Suppliers(SID),
    FOREIGN KEY (PID) REFERENCES Parts(PID),
    FOREIGN KEY (PrID) REFERENCES Projects(PrID)
);

-------------------------------------------------

b)
MariaDB [Project_Supply]> DESC Suppliers;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| SID    | varchar(5)  | NO   | PRI | NULL    |       |
| SName  | varchar(20) | YES  |     | NULL    |       |
| Status | int(11)     | YES  |     | NULL    |       |
| SCity  | varchar(20) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
4 rows in set (0.011 sec)


MariaDB [Project_Supply]> DESC Parts;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| PID    | varchar(5)  | NO   | PRI | NULL    |       |
| PName  | varchar(20) | YES  |     | NULL    |       |
| Colour | varchar(15) | YES  |     | NULL    |       |
| Weight | int(11)     | YES  |     | NULL    |       |
| PCity  | varchar(20) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
5 rows in set (0.006 sec)


MariaDB [Project_Supply]> DESC Projects;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| PrID   | varchar(5)  | NO   | PRI | NULL    |       |
| PrName | varchar(20) | YES  |     | NULL    |       |
| PrCity | varchar(20) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
3 rows in set (0.006 sec)

DESC Shipments;
MariaDB [Project_Supply]> DESC Shipments;
+----------+------------+------+-----+---------+-------+
| Field    | Type       | Null | Key | Default | Extra |
+----------+------------+------+-----+---------+-------+
| SID      | varchar(5) | NO   | PRI | NULL    |       |
| PID      | varchar(5) | NO   | PRI | NULL    |       |
| PrID     | varchar(5) | NO   | PRI | NULL    |       |
| Quantity | int(11)    | YES  |     | NULL    |       |
+----------+------------+------+-----+---------+-------+
4 rows in set (0.006 sec)


-------------------------------------------------

c)
INSERT INTO Suppliers VALUES
('S1','Smith',20,'London'),
('S2','Jones',10,'Paris'),
('S3','Black',30,'Paris'),
('S4','Clark',20,'London'),
('S5','Adams',30,'Athens');

INSERT INTO Parts VALUES
('P1','Nut','Red',12,'London'),
('P2','Bolt','Green',17,'Paris'),
('P3','Screw','Blue',17,'Rome'),
('P4','Screw','Red',14,'London'),
('P5','Cam','Blue',12,'Paris'),
('P6','Cog','Red',19,'London');

INSERT INTO Projects VALUES
('J1','Sorter','Paris'),
('J2','Punch','Rome'),
('J3','Reader','Athens'),
('J4','Console','Athens'),
('J5','Collator','London'),
('J6','Terminal','Oslo'),
('J7','Tape','London');

INSERT INTO Shipments VALUES
('S1','P1','J1',200),
('S1','P1','J4',700),

('S2','P2','J1',400),
('S2','P3','J2',200),
('S2','P3','J3',200),
('S2','P3','J4',500),
('S2','P3','J5',600),
('S2','P3','J6',400),
('S2','P3','J7',800),
('S2','P5','J2',100),

('S3','P3','J1',200),
('S3','P4','J2',500),

('S4','P6','J3',300),
('S4','P6','J7',300),

('S5','P2','J2',200),
('S5','P2','J4',100),
('S5','P5','J5',500),
('S5','P5','J7',100),
('S5','P6','J2',200),
('S5','P1','J4',100),
('S5','P3','J4',200),
('S5','P4','J4',800),
('S5','P5','J4',400),
('S5','P6','J4',500);


MariaDB [Project_Supply]> SELECT * FROM Suppliers;
+-----+-------+--------+--------+
| SID | SName | Status | SCity  |
+-----+-------+--------+--------+
| S1  | Smith |     20 | London |
| S2  | Jones |     10 | Paris  |
| S3  | Black |     30 | Paris  |
| S4  | Clark |     20 | London |
| S5  | Adams |     30 | Athens |
+-----+-------+--------+--------+
5 rows in set (0.002 sec)

MariaDB [Project_Supply]> SELECT * FROM Parts;
+-----+-------+--------+--------+--------+
| PID | PName | Colour | Weight | PCity  |
+-----+-------+--------+--------+--------+
| P1  | Nut   | Red    |     12 | London |
| P2  | Bolt  | Green  |     17 | Paris  |
| P3  | Screw | Blue   |     17 | Rome   |
| P4  | Screw | Red    |     14 | London |
| P5  | Cam   | Blue   |     12 | Paris  |
| P6  | Cog   | Red    |     19 | London |
+-----+-------+--------+--------+--------+
6 rows in set (0.001 sec)

MariaDB [Project_Supply]> SELECT * FROM Projects;
+------+----------+--------+
| PrID | PrName   | PrCity |
+------+----------+--------+
| J1   | Sorter   | Paris  |
| J2   | Punch    | Rome   |
| J3   | Reader   | Athens |
| J4   | Console  | Athens |
| J5   | Collator | London |
| J6   | Terminal | Oslo   |
| J7   | Tape     | London |
+------+----------+--------+
7 rows in set (0.001 sec)

MariaDB [Project_Supply]> SELECT * FROM Shipments;
+-----+-----+------+----------+
| SID | PID | PrID | Quantity |
+-----+-----+------+----------+
| S1  | P1  | J1   |      200 |
| S1  | P1  | J4   |      700 |
| S2  | P2  | J1   |      400 |
| S2  | P3  | J2   |      200 |
| S2  | P3  | J3   |      200 |
| S2  | P3  | J4   |      500 |
| S2  | P3  | J5   |      600 |
| S2  | P3  | J6   |      400 |
| S2  | P3  | J7   |      800 |
| S2  | P5  | J2   |      100 |
| S3  | P3  | J1   |      200 |
| S3  | P4  | J2   |      500 |
| S4  | P6  | J3   |      300 |
| S4  | P6  | J7   |      300 |
| S5  | P1  | J4   |      100 |
| S5  | P2  | J2   |      200 |
| S5  | P2  | J4   |      100 |
| S5  | P3  | J4   |      200 |
| S5  | P4  | J4   |      800 |
| S5  | P5  | J4   |      400 |
| S5  | P5  | J5   |      500 |
| S5  | P5  | J7   |      100 |
| S5  | P6  | J2   |      200 |
| S5  | P6  | J4   |      500 |
+-----+-----+------+----------+
24 rows in set (0.001 sec)

-------------------------------------------------

d)

i)
SELECT * FROM Projects WHERE PrCity='London';
+------+----------+--------+
| PrID | PrName   | PrCity |
+------+----------+--------+
| J5   | Collator | London |
| J7   | Tape     | London |
+------+----------+--------+
2 rows in set (0.009 sec)


ii)
SELECT * FROM Shipments
WHERE Quantity BETWEEN 300 AND 750;
+-----+-----+------+----------+
| SID | PID | PrID | Quantity |
+-----+-----+------+----------+
| S1  | P1  | J4   |      700 |
| S2  | P2  | J1   |      400 |
| S2  | P3  | J4   |      500 |
| S2  | P3  | J5   |      600 |
| S2  | P3  | J6   |      400 |
| S3  | P4  | J2   |      500 |
| S4  | P6  | J3   |      300 |
| S4  | P6  | J7   |      300 |
| S5  | P5  | J4   |      400 |
| S5  | P5  | J5   |      500 |
| S5  | P6  | J4   |      500 |
+-----+-----+------+----------+
11 rows in set (0.004 sec)


iii)
SELECT SID FROM Suppliers
WHERE SCity='Paris' AND Status>20;
+-----+
| SID |
+-----+
| S3  |
+-----+
1 row in set (0.004 sec)


iv)
SELECT DISTINCT SID FROM Shipments
WHERE PrID='J1'
ORDER BY SID;
+-----+
| SID |
+-----+
| S1  |
| S2  |
| S3  |
+-----+
3 rows in set (0.011 sec)


v)
SELECT DISTINCT SName
FROM Suppliers S
JOIN Shipments Sh ON S.SID=Sh.SID
WHERE Sh.PID='P2';
+-------+
| SName |
+-------+
| Jones |
| Adams |
+-------+
2 rows in set (0.008 sec)


vi)
SELECT SName FROM Suppliers
WHERE SCity IN (
    SELECT SCity FROM Suppliers
    GROUP BY SCity HAVING COUNT(*)>1
);
+-------+
| SName |
+-------+
| Smith |
| Jones |
| Black |
| Clark |
+-------+
4 rows in set (0.006 sec)


vii)
SELECT SName FROM Suppliers
WHERE SID NOT IN (
    SELECT SID FROM Shipments WHERE PID='P2'
);
+-------+
| SName |
+-------+
| Smith |
| Black |
| Clark |
+-------+
3 rows in set (0.004 sec)


viii)
SELECT Sh.SID, Sh.PID, Sh.PrID
FROM Shipments Sh
JOIN Suppliers S ON Sh.SID=S.SID
JOIN Parts P ON Sh.PID=P.PID
JOIN Projects J ON Sh.PrID=J.PrID
WHERE NOT (S.SCity=P.PCity AND P.PCity=J.PrCity);
+-----+-----+------+
| SID | PID | PrID |
+-----+-----+------+
| S1  | P1  | J1   |
| S1  | P1  | J4   |
| S2  | P3  | J2   |
| S2  | P5  | J2   |
| S2  | P3  | J3   |
| S2  | P3  | J4   |
| S2  | P3  | J5   |
| S2  | P3  | J6   |
| S2  | P3  | J7   |
| S3  | P3  | J1   |
| S3  | P4  | J2   |
| S4  | P6  | J3   |
| S5  | P2  | J2   |
| S5  | P6  | J2   |
| S5  | P1  | J4   |
| S5  | P2  | J4   |
| S5  | P3  | J4   |
| S5  | P4  | J4   |
| S5  | P5  | J4   |
| S5  | P6  | J4   |
| S5  | P5  | J5   |
| S5  | P5  | J7   |
+-----+-----+------+
22 rows in set (0.004 sec)


ix)
SELECT COUNT(DISTINCT PrID)
FROM Shipments
WHERE SID='S1';
+----------------------+
| COUNT(DISTINCT PrID) |
+----------------------+
|                    2 |
+----------------------+
1 row in set (0.002 sec)


x)
SELECT SUM(Quantity)
FROM Shipments
WHERE SID='S5';
+---------------+
| SUM(Quantity) |
+---------------+
|          3100 |
+---------------+
1 row in set (0.002 sec)


xi)
SELECT PID
FROM Shipments
GROUP BY PID
HAVING AVG(Quantity) > 320;
+-----+
| PID |
+-----+
| P1  |
| P3  |
| P4  |
| P6  |
+-----+
4 rows in set (0.001 sec)


xii)
SELECT PrID, PrCity
FROM Projects
WHERE PrCity LIKE '_o%';
+------+--------+
| PrID | PrCity |
+------+--------+
| J2   | Rome   |
| J5   | London |
| J7   | London |
+------+--------+
3 rows in set (0.001 sec)



xiii)
SELECT DISTINCT PrName
FROM Projects P
JOIN Shipments S ON P.PrID=S.PrID
WHERE S.SID='S4';
+--------+
| PrName |
+--------+
| Reader |
| Tape   |
+--------+
2 rows in set (0.001 sec)



xiv)
SELECT DISTINCT PID
FROM Shipments
WHERE PrID IN (
    SELECT PrID FROM Projects WHERE PrCity='London'
);
+-----+
| PID |
+-----+
| P3  |
| P5  |
| P6  |
+-----+
3 rows in set (0.001 sec)


xv)
SELECT SID
FROM Suppliers
WHERE Status < (
    SELECT Status FROM Suppliers WHERE SID='S1'
);
+-----+
| SID |
+-----+
| S2  |
+-----+
1 row in set (0.001 sec)



xvi)
SELECT SCity FROM Suppliers
UNION
SELECT PCity FROM Parts
UNION
SELECT PrCity FROM Projects;
+--------+
| SCity  |
+--------+
| London |
| Paris  |
| Athens |
| Rome   |
| Oslo   |
+--------+
5 rows in set (0.002 sec)



xvii)
UPDATE Parts
SET Colour='Orange'
WHERE Colour='Red';

Query OK, 3 rows affected (0.006 sec)
Rows matched: 3  Changed: 3  Warnings: 0

SELECT * FROM parts;
+-----+-------+--------+--------+--------+
| PID | PName | Colour | Weight | PCity  |
+-----+-------+--------+--------+--------+
| P1  | Nut   | Orange |     12 | London |
| P2  | Bolt  | Green  |     17 | Paris  |
| P3  | Screw | Blue   |     17 | Rome   |
| P4  | Screw | Orange |     14 | London |
| P5  | Cam   | Blue   |     12 | Paris  |
| P6  | Cog   | Orange |     19 | London |
+-----+-------+--------+--------+--------+

xviii)
DELETE FROM Projects
WHERE PrID NOT IN (
    SELECT DISTINCT PrID FROM Shipments
);


xix)
INSERT INTO Suppliers (SID,SName,Status,SCity)
VALUES ('S10','Smith',NULL,'New York');

SELECT * FROM suppliers;
+-----+-------+--------+----------+
| SID | SName | Status | SCity    |
+-----+-------+--------+----------+
| S1  | Smith |     20 | London   |
| S10 | Smith |   NULL | New York |
| S2  | Jones |     10 | Paris    |
| S3  | Black |     30 | Paris    |
| S4  | Clark |     20 | London   |
| S5  | Adams |     30 | Athens   |
+-----+-------+--------+----------+


xx)
CREATE TABLE LondonParts AS
SELECT DISTINCT PID
FROM Shipments
WHERE SID IN (
    SELECT SID FROM Suppliers WHERE SCity='London'
)
OR PrID IN (
    SELECT PrID FROM Projects WHERE PrCity='London'
);

SELECT * FROM LondonParts;
+-----+
| PID |
+-----+
| P1  |
| P3  |
| P5  |
| P6  |
+-----+
4 rows in set (0.001 sec)







