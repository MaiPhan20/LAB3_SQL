DECLARE @firstname varchar(25)
SET @firstname = 'harry'
--
--Variable declaration of type int
DECLARE @age int = 40
--Variable declaration of type decimal
DECLARE @taxPercent decimal = 0.75
--Variable declaration of type money
DECLARE @amount money = 50000
DECLARE @bonus money = @amount*.10
--Variable declaration of type date
DECLARE @userDate date = '09-30-2009'
DECLARE @currentDate date = GETDATE()
SELECT @age, @taxPercent, @amount, @bonus, @userDate, @currentDate
--
DECLARE @admissionDate date = '09-08-2009';
SELECT @admissionDate;
--
DECLARE @admissionDate date = GETDATE()
SELECT @admissionDate
--
DECLARE @admissionDate date = '09-08-2009 10:30:25';
SELECT @admissionDate;
--
DECLARE @startTime time = '10:10:30.1234567';
DECLARE @startTime1 time(0) = '10:10:30.1234567';
DECLARE @startTime2 time(1) = '10:10:30.1234567';
DECLARE @startTime3 time(2) = '10:10:30.1234567';
DECLARE @startTime4 time(3) = '10:10:30.1234567';
DECLARE @startTime5 time(4) = '10:10:30.1234567';
DECLARE @startTime6 time(5) = '10:10:30.1234567';
DECLARE @startTime7 time(6) = '10:10:30.1234567';
DECLARE @startTime8 time(7) = '10:10:30.1234567';
SELECT @startTime;
SELECT @startTime1;
SELECT @startTime2;
SELECT @startTime3;
SELECT @startTime4;
SELECT @startTime5;
SELECT @startTime6;
SELECT @startTime7;
SELECT @startTime8;
--
DECLARE @bookingTime datetime2 = '2009-09-08 11:59:11.1234567';
DECLARE @bookingTime1 datetime2(0) = '2009-09-08 11:59:11.1234567';
DECLARE @bookingTime2 datetime2(1) = '2009-09-08 11:59:11.1234567';
DECLARE @bookingTime3 datetime2(2) = '2009-09-08 11:59:11.1234567';
DECLARE @bookingTime4 datetime2(3) = '2009-09-08 11:59:11.1234567';
DECLARE @bookingTime5 datetime2(4) = '2009-09-08 11:59:11.1234567';
DECLARE @bookingTime6 datetime2(5) = '2009-09-08 11:59:11.1234567';
DECLARE @bookingTime7 datetime2(6) = '2009-09-08 11:59:11.1234567';
DECLARE @bookingTime8 datetime2(7) = '2009-09-08 11:59:11.1234567';
SELECT @bookingTime;
SELECT @bookingTime1;
SELECT @bookingTime2;
SELECT @bookingTime3;
SELECT @bookingTime4;
SELECT @bookingTime5;
SELECT @bookingTime6;
SELECT @bookingTime7;
SELECT @bookingTime8
--
DECLARE @location1 datetimeoffset(0)
SET @location1 = '2009-11-9 23:50:55 -1:00'
DECLARE @location2 datetimeoffset(0)
SET @location2 = '2009-11-9 22:50:55 +5:00'
SELECT DATEDIFF(HH, @location1, @location2)
--
CREATE TABLE Customers
(
FirstName varchar(25) NOT NULL,
LastName varchar(25) NOT NULL,
ContactNumber varchar(15) SPARSE NULL,
Salary money NOT NULL,
Comments varchar(1000) SPARSE NULL
AllSparseColumns xml COLUMN_SET FOR ALL_SPARSE_COLUMNS
)
--
DECLARE @spoint geometry;
SET @spoint = geometry::Parse('POINT(2 5)');
SELECT @spoint
--
DECLARE @line geometry;
SET @line = geometry::Parse('LINESTRING(1 1, 4 5, 10 13, 19 25)');
SELECT @line
--
DECLARE @multiline geometry;
SET @multiline = geometry::Parse('MULTILINESTRING((0 2, 1 1), (1 2, 2 1, 2
2))');
SELECT @multiline
--
DECLARE @multipoly geometry
SET @multipoly = geometry::Parse('MultiPolygon (((0 0, 0 2, 2 3, 3 0, 0 0),
(1 1, 1 2, 2 1, 1 1)))');
SELECT @multipoly
--
DECLARE @geomcollection geometry;
SET @geomcollection = geometry::Parse('GEOMETRYCOLLECTION(POINT(4 4),
LINESTRING(3 3, 8 3), POLYGON((0 2, 13 3, 4 5, 0 2)))');
SELECT @geomcollection
--
SELECT TOP 5 spatial_reference_id, unit_of_measure FROM
sys.spatial_reference_systems
--
DECLARE @shapepoly geometry
SET @shapepoly = geometry::STGeomFromText('POLYGON((0 2, 10 3, 3 4, 0 2))',
4326);
SELECT @shapepoly
--
CREATE TABLE OrgHierarchy(
[DeptHID] [hierarchyid] Primary Key,
[DeptID] [int] NULL,
[DeptName] [varchar](50) NULL,
[HeadOfDept] [varchar](25) NULL)
--
CREATE PROCEDURE InsertDeptDetail(@OrgId as Int, @DeptId AS INT,
@DeptName VARCHAR(50), @HeadOfDept VARCHAR(25)) AS
BEGIN
DECLARE @OrgHID AS hierarchyid
DECLARE @LastOrgID AS hierarchyid
SELECT @OrgHID = DeptHID FROM OrgHierarchy WHERE DeptId = @OrgId
SELECT @LastOrgId = Max(DeptHID) FROM OrgHierarchy
WHERE DeptHID.GetAncestor(1) = @OrgHID
--
INSERT INTO OrgHierarchy VALUES
(@OrgHID.GetDescendant(@LastOrgID,Null), @DeptId, @DeptName,
@HeadOfDept)
RETURN @@RowCount
END
--
EXEC InsertDeptDetail 1,2,'Software Development','Martin Smith'
EXEC InsertDeptDetail 2,5,'External Projects','William Defoe'
EXEC InsertDeptDetail 2,6,'Internal Projects','Bob Richards'
EXEC InsertDeptDetail 1,3,'Hardware and Networking','Michael OReilly'
EXEC InsertDeptDetail 3,7,'Support','Roger Jennings'
EXEC InsertDeptDetail 1,4,'Operations','Julia Cameron'
--
SELECT CONVERT(varbinary(6),'aptech')
SELECT CONVERT(varchar(18), 0x617074656368, 0) AS 'Style 0'
SELECT CONVERT(varchar(18), 0x617074656368, 1) AS 'Style 1'
SELECT CONVERT(varchar(18), 0x617074656368, 2) AS 'Style 2'
--
SELECT DATEPART(YEAR, '2007-06-01 12:10:30.1234567');
SELECT DATEPART(QUARTER, '2007-06-01 12:10:30.1234567');
SELECT DATEPART(MONTH, '2007-06-01 12:10:30.1234567');
SELECT DATEPART(DAYOFYEAR, '2007-06-01 12:10:30.1234567');
SELECT DATEPART(DAY, '2007-06-01 12:10:30.1234567');
SELECT DATEPART(WEEK, '2007-06-01 12:10:30.1234567');
--
DECLARE @x XML
SELECT @x = '<Product name=�Computer�/>'
SELECT x.value('@name','VARCHAR(20)') AS Name,
x.value('fn:upper-case(@name)','VARCHAR(20)') AS InUpperCase,
x.value('fn:lower-case(@name)','VARCHAR(20)') AS InLowerCase
FROM @x.nodes('/Product') e(x)
--
SET operand1 += operand2;
SET operand1 -= operand2;
SET operand1 *= operand2;
SET operand1 /= operand2;
SET operand1 %= operand2;
--
DECLARE @value AS MONEY = 10.00;
SET @value += 2.00;
SELECT @value;
SET @value -= 2.00;
SELECT @value;
SET @value *= 2.00;
SELECT @value;
SET @value /= 2.00;
SELECT @value;
SET @value %= 2.00;
SELECT @value;
--







