CREATE DATABASE latihan_store_procedure;
use latihan_store_procedure;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    ContactName VARCHAR(100),
    Address VARCHAR(255),
    City VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(50)
);

INSERT INTO Customers (CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country) VALUES
(1, 'Alfreds Futterkiste', 'Maria Anders', 'Obere Str. 57', 'Berlin', '12209', 'Germany'),
(2, 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Avda. de la Constitución 2222', 'México D.F.', '05021', 'Mexico'),
(3, 'Antonio Moreno Taquería', 'Antonio Moreno', 'Mataderos 2312', 'México D.F.', '05023', 'Mexico'),
(4, 'Around the Horn', 'Thomas Hardy', '120 Hanover Sq.', 'London', 'WA1 1DP', 'UK'),
(5, 'Berglunds snabbköp', 'Christina Berglund', 'Berguvsvägen 8', 'Luleå', 'S-958 22', 'Sweden');

DELIMITER //
CREATE PROCEDURE GetCustomersByCountry(IN countryName VARCHAR(50))
BEGIN
    SELECT * FROM Customers
    WHERE Country = countryName;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetCustomersByCity(IN cityName VARCHAR(100))
BEGIN
    SELECT * FROM Customers
    WHERE City = cityName;
END //
DELIMITER ;


CALL GetCustomersByCountry('Mexico');
CALL GetCustomersByCity('Berlin');

