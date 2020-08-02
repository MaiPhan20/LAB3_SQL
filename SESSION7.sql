USE AdventureWorks2014
GO
SELECT * FROM PERSON.BusinessEntityContact
SELECT Title, FirstName, MiddleName, LastName, EmailAddress FROM Person.
BusinessEntityContact
SELECT Title + ‘. ’+FirstName+‘ ’+LastName AS ‘Person Name’ FROM Person.
Contact
--
SELECT * FROM PERSON.Address
SELECT DISTINCT (City) from Person.Address
SELECT TOP 10 * FROM Person.Address
SELECT TOP 25 PERCENT * FROM Person.Address
SELECT AVG(RATE) FROM HumanResources.EmployeePayHistory
SELECT COUNT(EMPLOYEEID) AS TITLECOUNT FROM HumanResources.Employee
