--                                                                  MAJOR AND MINOR PROJECT ON
--                                                                      CAR RENTAL SYSTEM
--                                                       SUBMITTED BY:
--                                                                     EVA SHARMA (12408153), roll no. 13
--                                                                     KUNDAN SINGH (12400845), roll no. 03



CREATE DATABASE CAR_RENTAL
USE CAR_RENTAL


--CUSTOMER TABLE 

CREATE TABLE CUSTOMER (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) Unique);

-- CUSTOMER_CONTACT table

CREATE TABLE CUSTOMER_CONTACT (
    CustomerID INT,
    ContactType VARCHAR(20), -- Can be 'Phone' or 'Address'
    ContactValue VARCHAR(100),
    PRIMARY KEY (CustomerID,ContactType,ContactValue),
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID));

-- DRIVER TABLE

CREATE TABLE DRIVER (
    DriverID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
	Contact_Details VARCHAR(50));

-- MODEL table
CREATE TABLE MODEL (
    ModelID INT PRIMARY KEY,
    Make VARCHAR(50),
    ModelName VARCHAR(50));

-- CARS table
CREATE TABLE CARS (
    CarID INT PRIMARY KEY,
    ModelID INT,
    Seats INT,
    LicensePlate VARCHAR(20),
    FOREIGN KEY (ModelID) REFERENCES MODEL(ModelID));

-- RENTAL TABLE
CREATE TABLE RENTAL (
    RentalID INT PRIMARY KEY,
    CustomerID INT,
    DriverID INT, 
    Rental_Date DATE,
    Maturity_Date DATE,
    Total_Amount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID),
    FOREIGN KEY (DriverID) REFERENCES DRIVER(DriverID));

-- RENTAL_CAR table
CREATE TABLE RENTAL_CAR (
    RentalID INT,
    CarID INT,
    PRIMARY KEY (RentalID, CarID),
    FOREIGN KEY (RentalID) REFERENCES RENTAL(RentalID),
    FOREIGN KEY (CarID) REFERENCES CARS(CarID));

-- PAYMENT table
CREATE TABLE PAYMENT (
    PaymentID INT PRIMARY KEY,
    RentalID INT,
    Amount DECIMAL(10, 2),
    PaymentMethodType Varchar(50),
    Payment_Date DATE,
    FOREIGN KEY (RentalID) REFERENCES RENTAL(RentalID));

--FEEDBACK TABLE

	CREATE TABLE FEEDBACK (
    FeedbackID INT PRIMARY KEY,
    CustomerID INT,
    DriverID INT,
    Rating DECIMAL(3, 2) CHECK (Rating BETWEEN 1 AND 5),
    Feedback_Content TEXT,
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID),
    FOREIGN KEY (DriverID) REFERENCES DRIVER(DriverID));

-- MAINTENANCE table
CREATE TABLE MAINTENANCE (
    MaintenanceID INT PRIMARY KEY,
    CarID INT,
    Maintenance_Date DATE,
    Cost DECIMAL(10, 2),
    FOREIGN KEY (CarID) REFERENCES CARS(CarID));


-- Inserting data into the CUSTOMER table

INSERT INTO CUSTOMER (CustomerID, FirstName, LastName, Email) VALUES
  (1, 'Rajesh', 'Kumar', 'rajeshkumar@email.com'),
  (2, 'Aishwarya', 'Rai', 'aishwaryarai@email.com'),
  (3, 'Amitabh', 'Bachchan', 'amitabhb@email.com'),
  (4, 'Deepika', 'Padukone', 'deepikapadukone@email.com'),
  (5, 'Hrithik', 'Roshan', 'hrithikroshan@email.com'),
  (6, 'Priyanka', 'Chopra', 'priyankachopra@email.com'),
  (7, 'Shahrukh', 'Khan', 'shahrukhkhan@email.com'),
  (8, 'Katrina', 'Kaif', 'katrinakaif@email.com'),
  (9, 'Akshay', 'Kumar', 'akshaykumar@email.com'),
  (10, 'Kareena', 'Kapoor', 'kareenakapoor@email.com');

  SELECT * FROM CUSTOMER

  -- Inserting data into the CUSTOMER_CONTACT table

  INSERT INTO CUSTOMER_CONTACT ( CustomerID, ContactType, ContactValue)VALUES
  ( 1, 'Phone', '9876543210'),
  ( 1, 'Address', '123 Main St, Mumbai, Maharashtra, 400001'),
  ( 2, 'Phone', '8765432109'),
  ( 2, 'Address', '456 Elm St, Delhi, Delhi, 110001'),
  ( 3, 'Phone', '7654321098'),
  ( 3, 'Address', '789 Oak St, Kolkata, West Bengal, 700001'),
  ( 4, 'Phone', '6543210987'),
  ( 4, 'Address', '101 Pine St, Chennai, Tamil Nadu, 600001'),
  ( 5, 'Phone', '5432109876'),
  ( 5, 'Address', '222 Cedar St, Bangalore, Karnataka, 560001'),
  ( 6, 'Phone', '6654321098'),
  ( 6, 'Address', '189 Oak St, Kolkata, West Bengal, 700331'),
  ( 7, 'Phone', '6547777987'),
  ( 7, 'Address', '101 Love St, Chennai, Tamil Nadu, 600661'),
  ( 8, 'Phone', '1234109876'),
  ( 8, 'Address', '112 Cedar St, Bangalore, Karnataka, 562001'),
  ( 6, 'Phone', '5432109877');

  SELECT * FROM CUSTOMER_CONTACT

-- Inserting data into the DRIVER table

INSERT INTO DRIVER (DriverID, FirstName, LastName,Contact_Details)VALUES
  (101, 'Ravi', 'Sharma','8976543210'),
  (102, 'Sita', 'Devi', '7865432109'),
  (103, 'Gopal', 'Krishnan','6754321098'),
  (104, 'Vikash','Singh','7643210987'),
  (105, 'Vishal','Patel','5432109876'),
  (106, 'Atul','Pandey','9754321098');

  SELECT * FROM DRIVER


   -- Inserting data into the MODEL table

INSERT INTO MODEL (ModelID, Make, ModelName)VALUES
  (1, 'Maruti Suzuki', 'Swift'),
  (2, 'Hyundai', 'i20'),
  (3, 'Tata', 'Nexon'),
  (4, 'Mahindra', 'Scorpio'),
  (5, 'Toyota', 'Innova Crysta');
  SELECT * FROM MODEL

-- Inserting data into the CARS table

INSERT INTO CARS (CarID, ModelID, Seats, LicensePlate)VALUES
    (101, 1, 5, 'DL12CA1234'),
    (102, 2, 5, 'MH14AB5678'),
    (103, 3, 5, 'AP16CD7890'),
    (104, 4, 7, 'KA19EF0123'),
    (105, 5, 7, 'TN10GH4567'),
    (106, 1, 5, 'HR26IJ9012'),
    (107, 2, 5, 'KL17MN3456'),
    (108, 3, 7, 'RJ19OP7890'),
    (109, 4, 7, 'UP21QR1234'),
    (110, 5, 8, 'WB23ST5678');

	SELECT * FROM  CARS

-- Inserting data into the RENTAL table

INSERT INTO RENTAL (RentalID, CustomerID, DriverID, Rental_Date, Maturity_Date, Total_Amount)VALUES
  (1001, 1, 101, '2023-11-01', '2023-11-03', 100.00),
  (1002, 2, 102, '2023-11-05', '2023-11-07', 150.00),
  (1003, 3, 103, '2023-11-08', '2023-11-10', 80.00),
  (1004, 1, 106, '2023-12-01', '2023-12-03', 1050.00),
  (1005, 1, 104, '2023-07-01', '2023-07-03', 1000.00),
  (1006, 2, 101, '2023-08-05', '2023-08-07', 1500.00),
  (1007, 4, 105, '2023-10-08', '2023-10-10', 800.00),
  (1008, 5, 104, '2023-12-01', '2023-12-03', 1000.00);

  SELECT * FROM RENTAL

-- Inserting data into the RENTAL_CAR table

INSERT INTO RENTAL_CAR (RentalID, CarID)VALUES
  (1001, 101),
  (1002, 102),
  (1003, 103),
  (1004, 101),
  (1005, 102),
  (1006, 104),
  (1007, 105),
  (1001,110);

  SELECT * FROM RENTAL_CAR

-- Inserting data into the PAYMENT table

INSERT INTO PAYMENT (PaymentID, RentalID, Amount, PaymentMethodType, Payment_Date)VALUES
  (2001, 1001, 100.00, 'Credit Card', '2023-11-03'),
  (2002, 1002, 150.00,'Cash', '2023-11-07'),
  (2003, 1003, 80.00, 'Credit Card', '2023-11-10'),
  (2004, 1004, 1050.00, 'Debit Card', '2023-11-03'),
  (2005, 1005, 1000.00, 'Cash', '2023-11-07'),
  (2006, 1006, 1500.00,'Net Banking', '2023-11-03'),
  (2007, 1007, 800.00, 'UPI', '2023-11-07'),
  (2008, 1008, 1000.00,'Credit Card', '2023-11-03');

  SELECT * FROM PAYMENT
 
 -- Inserting data into the FEEDBACK table

INSERT INTO FEEDBACK (FeedbackID, CustomerID, DriverID, Rating, Feedback_Content)VALUES
   (1, 1, 101, 4.5, 'Good service, polite driver.'),
   (2, 2, 102, 4.2, 'Car was clean, on-time pickup.'),
   (3, 3, 103, 4.8, 'Driver was helpful and courteous.'),
   (4, 1, 106, 4.1, 'Comfortable ride, smooth driving.'),
   (5, 5, 105, 4.7, 'Excellent service, highly recommended.'),
   (6, 6, 104, 4.3, 'Car was well-maintained, no issues.'),
   (7, 1, 105, 4.9, 'Best driving experience ever!' ),
   (8, 8,101, 4.0, 'Average service, could be better.'),
   (9, 9, 102, 4.6, 'Prompt service, friendly driver.'),
   (10,1,101,4.4, 'Good overall experience.');

   SELECT * FROM FEEDBACK


-- Inserting data into the MAINTENANCE table

INSERT INTO MAINTENANCE (MaintenanceID, CarID, Maintenance_Date, Cost)VALUES
  (1001, 101, '2023-10-25', 100.00),
  (1002, 102, '2023-11-15', 150.00),
  (1003, 103, '2023-12-01', 200.00),
  (1004, 104, '2024-12-01', 800.00),
  (1005, 105, '2023-12-25', 1000.00),
  (1006, 106, '2023-10-15', 1500.00),
  (1007, 107, '2023-11-01', 2000.00),
  (1008, 108, '2024-01-01', 850.00);

  SELECT * FROM MAINTENANCE

  -- INSERTING SOME MORE VALUES IN CUSTOMER-CONTACT TABLE
  INSERT INTO CUSTOMER_CONTACT VALUES
  ( 3, 'Phone', '6523456787'),
  ( 2, 'Address', 'Indrapuram, Chennai, Tamil Nadu, 600661'),
  ( 5, 'Phone', '2689509876'),
  ( 9, 'Address', 'Sarvabhoumnagar, Bangalore, Karnataka, 562001'),
  ( 10, 'Phone', '7865409877');

  -- INSERTING SOME MORE VALUES IN CUSTOMER-CONTACT TABLE
  INSERT INTO MAINTENANCE (MaintenanceID, CarID, Maintenance_Date, Cost)VALUES
  (1009,101, '2023-08-25',1000.00),
  (1010,102, '2023-11-15', 150.00),
  (1011,103, '2023-12-01', 2000.00);


--Query for listing all customers
  
SELECT * FROM CUSTOMER;

-- Query for finding all rentals for a specific customer

SELECT * FROM RENTAL WHERE CustomerID = 1;

--Query for calculating  the total revenue generated from rentals:
   
SELECT SUM(Total_Amount) AS TotalRevenue FROM RENTAL


-- Query for identifying  the average rating given by customers

SELECT AVG(Rating) AS AverageRating FROM FEEDBACK;

-- Query for total maintainence cost

SELECT SUM(Cost) AS TotalMaintenanceCost FROM MAINTENANCE;


-- Query for Identifying  the most popular car model:

SELECT TOP 1 m.ModelName, COUNT(*) AS RentalCount
FROM RENTAL r
INNER JOIN RENTAL_CAR rc ON r.RentalID = rc.RentalID
INNER JOIN CARS c ON rc.CarID = c.CarID
INNER JOIN MODEL m ON c.ModelID = m.ModelID
GROUP BY m.ModelName
ORDER BY RentalCount DESC;


--Query for Determine the top 3 drivers with the highest average rating

SELECT TOP 3 d.FirstName, d.LastName, AVG(f.Rating) AS AverageRating
FROM DRIVER d
INNER JOIN FEEDBACK f ON d.DriverID = f.DriverID
GROUP BY d.FirstName, d.LastName
ORDER BY AverageRating DESC;

-- Query for Finding  the customer who has made the most rentals

SELECT TOP 1 c.FirstName, c.LastName, COUNT(*) AS RentalCount
FROM CUSTOMER c
INNER JOIN RENTAL r ON c.CustomerID = r.CustomerID
GROUP BY c.FirstName, c.LastName
ORDER BY RentalCount DESC;

-- Query for Identifying the cars that have undergone the most maintenance

SELECT c.LicensePlate, COUNT(*) AS MaintenanceCount
FROM CARS c
INNER JOIN MAINTENANCE m ON c.CarID = m.CarID
GROUP BY c.LicensePlate
ORDER BY MaintenanceCount DESC;



-- Find the total revenue generated by each driver:
SELECT d.FirstName, d.LastName, SUM(r.Total_Amount) AS TotalRevenue
FROM DRIVER d
INNER JOIN RENTAL r ON d.DriverID = r.DriverID
GROUP BY d.FirstName, d.LastName;

--Find the top 5 customers who have spent the most money on rentals:
SELECT  TOP 3 c.FirstName, c.LastName, SUM(r.Total_Amount) AS TotalSpent
FROM CUSTOMER c
INNER JOIN RENTAL r ON c.CustomerID = r.CustomerID
GROUP BY c.FirstName, c.LastName
ORDER BY TotalSpent DESC;


--Identify drivers with high customer satisfaction:
SELECT d.FirstName, d.LastName, AVG(f.Rating) AS AverageRating
FROM DRIVER d
INNER JOIN FEEDBACK f ON d.DriverID = f.DriverID
GROUP BY d.FirstName, d.LastName
ORDER BY AverageRating DESC;

-- Determine the total revenue generated by each car model:
SELECT m.ModelName, SUM(r.Total_Amount) AS TotalRevenue
FROM RENTAL r
INNER JOIN RENTAL_CAR rc ON r.RentalID = rc.RentalID
INNER JOIN CARS c ON rc.CarID = c.CarID
INNER JOIN MODEL m ON c.ModelID = m.ModelID
GROUP BY m.ModelName;


--MAJOR PROJECT CODES

--SUBQUERIES
-- List customers who have not given any feedback
SELECT CustomerID, FirstName, LastName
FROM CUSTOMER
WHERE CustomerID NOT IN (
    SELECT DISTINCT CustomerID
    FROM FEEDBACK
);


-- List customers and their total payment amounts
SELECT CustomerID, FirstName, LastName, (
    SELECT SUM(Amount)
    FROM PAYMENT
    WHERE RentalID IN (
        SELECT RentalID
        FROM RENTAL
        WHERE RENTAL.CustomerID = CUSTOMER.CustomerID
    )
) AS TotalPayment
FROM CUSTOMER;


-- Get the average rental period for each customer
SELECT CustomerID, FirstName, LastName, (
    SELECT AVG(DATEDIFF(DAY, Rental_Date, Maturity_Date))
    FROM RENTAL
    WHERE RENTAL.CustomerID = CUSTOMER.CustomerID
) AS AverageRentalPeriod
FROM CUSTOMER;


-- Retrieve feedback content for the driver with the highest average rating
SELECT Feedback_Content
FROM FEEDBACK
WHERE DriverID = (
    SELECT TOP 1 DriverID
    FROM FEEDBACK
    GROUP BY DriverID
    ORDER BY AVG(Rating) DESC
);


--------IF-ELSE STATEMENTS
-- Check if there is a payment record for the rental
DECLARE @RentalID INT = 1;

IF EXISTS (
    SELECT 1
    FROM PAYMENT
    WHERE RentalID = @RentalID
)
BEGIN
    PRINT 'Payment has been made for this rental.';
END
ELSE
BEGIN
    PRINT 'No payment has been made for this rental.';
END;

------ Check if the customer has multiple rentals
DECLARE @CustomerID INT = 1;

IF EXISTS (
    SELECT 1
    FROM RENTAL
    WHERE CustomerID = @CustomerID
    HAVING COUNT(*) > 1
)
BEGIN
    PRINT 'The customer is a repeat renter.';
END
ELSE
BEGIN
    PRINT 'The customer is a first-time renter.';
END;


--CREATING STORED PROCEDURES
--THIS PROCEDURE RECORDS MAINTENANCE DETAILS FOR A SPECIFIC CAR, IF THAT DOES NOT EXISTS, WILL PRINT "CAR DOES NOT EXIST"
CREATE PROCEDURE LogMaintenance1
    @CarID INT,
    @MaintenanceDate DATE,
    @Cost DECIMAL(10, 2),
	@MaintenanceID INT
AS
BEGIN
    SET NOCOUNT ON;
    IF NOT EXISTS (SELECT 1 FROM CARS WHERE CarID = @CarID)
    BEGIN
        PRINT 'Error: Car does not exist';
        RETURN;
    END
    INSERT INTO MAINTENANCE (MaintenanceID, CarID, Maintenance_Date, Cost)
    VALUES (@MaintenanceID, @CarID, @MaintenanceDate, @Cost);

    PRINT 'Maintenance record added successfully!';
END

--executing the above stored procedure
EXEC LogMaintenance1 @MaintenanceID=1014, @CarID = 109, @MaintenanceDate = '2024-11-20', @Cost = 200.00;
EXEC LogMaintenance1 @MaintenanceID=1013, @CarID = 101, @MaintenanceDate = '2024-11-20', @Cost = 200.00;
--executing to get output "car does not exist"
EXEC LogMaintenance1 @MaintenanceID=1013, @CarID = 111, @MaintenanceDate = '2024-11-20', @Cost = 200.00;


--THIS PROCEDURE RETRIEVES RENTAL DETAILS FOR A SPECIFIC RENTAL ID
CREATE PROCEDURE GetRentalDetails
    @RentalID INT
AS
BEGIN
    SET NOCOUNT ON;
    IF NOT EXISTS (SELECT 1 FROM RENTAL WHERE RentalID = @RentalID)
    BEGIN
        PRINT 'Error: Rental does not exist';
        RETURN;
    END

    -- Retrieve rental details
    SELECT 
        r.RentalID,
        c.FirstName AS CustomerFirstName,
        c.LastName AS CustomerLastName,
        d.FirstName AS DriverFirstName,
        d.LastName AS DriverLastName,
        cars.LicensePlate,
        cars.Seats,
        r.Rental_Date,
        r.Maturity_Date,
        r.Total_Amount
    FROM RENTAL r
    JOIN CUSTOMER c ON r.CustomerID = c.CustomerID
    JOIN DRIVER d ON r.DriverID = d.DriverID
    JOIN RENTAL_CAR rc ON r.RentalID = rc.RentalID
    JOIN CARS cars ON rc.CarID = cars.CarID
    WHERE r.RentalID = @RentalID;
END

--executing the above stored procedure to get error message
EXEC GetRentalDetails @RentalID = 1;
--executing the above stored procedure successfully
EXEC GetRentalDetails @RentalID = 1002;


--CREATING FUNCTIONS
--THIS FUNCTION CALCULATES HOW MANY RENTALS A SPECIFIC CUSTOMER HAS MADE 
CREATE FUNCTION GetTotalRentalsByCustomer (@CustomerID INT)
RETURNS INT
AS
BEGIN
    DECLARE @TotalRentals INT;

    SELECT @TotalRentals = COUNT(*)
    FROM RENTAL
    WHERE CustomerID = @CustomerID;
    RETURN ISNULL(@TotalRentals, 0);
END

--executing above function
SELECT dbo.GetTotalRentalsByCustomer(1) AS TotalRentals;


--THIS FUNCTION RETRIEVES ALL CONTACT DETAILS OF A SPECIFIC CUSTOMER IN A SINGLE STRING
CREATE FUNCTION GetCustomerContactDetails (@CustomerID INT)
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @ContactDetails NVARCHAR(MAX);

    SELECT @ContactDetails = STRING_AGG(ContactValue, ', ')
    FROM CUSTOMER_CONTACT
    WHERE CustomerID = @CustomerID;

    RETURN ISNULL(@ContactDetails, 'No contact details found');
END

--executing above function
SELECT dbo.GetCustomerContactDetails(1) AS ContactDetails;



--CREATING CURSORS
--CURSOR TO RETRIEVE ALL FEEDBACK FOR EACH DRIVER AND DISPLAY THE FEEDBACK DETAILS
DECLARE @DriverID INT;
DECLARE @DriverName NVARCHAR(100);
DECLARE @FeedbackContent NVARCHAR(MAX);
DECLARE @Rating INT;

DECLARE FeedbackCursor CURSOR FOR
SELECT d.DriverID, CONCAT(d.FirstName, ' ', d.LastName) AS DriverName, f.Feedback_Content, f.Rating
FROM FEEDBACK f
JOIN DRIVER d ON f.DriverID = d.DriverID;

OPEN FeedbackCursor;

FETCH NEXT FROM FeedbackCursor INTO @DriverID, @DriverName, @FeedbackContent, @Rating;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT CONCAT('Driver: ', @DriverName, 
                 ', Feedback: ', @FeedbackContent, 
                 ', Rating: ', @Rating);

    FETCH NEXT FROM FeedbackCursor INTO @DriverID, @DriverName, @FeedbackContent, @Rating;
END;

CLOSE FeedbackCursor;
DEALLOCATE FeedbackCursor;


--CURSOR TO LIST ALL PAYMENTS SHOWING THE PAYMENTID, AMOUNT AND METHOD TYPE
DECLARE @PaymentID INT;
DECLARE @Amount DECIMAL(10, 2);
DECLARE @PaymentMethodType NVARCHAR(50);

DECLARE PaymentCursor CURSOR FOR
SELECT PaymentID, Amount, PaymentMethodType
FROM PAYMENT;

OPEN PaymentCursor;

FETCH NEXT FROM PaymentCursor INTO @PaymentID, @Amount, @PaymentMethodType;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT CONCAT('Payment ID: ', @PaymentID, 
                 ', Amount: ', @Amount, 
                 ', Method: ', @PaymentMethodType);

    FETCH NEXT FROM PaymentCursor INTO @PaymentID, @Amount, @PaymentMethodType;
END;

CLOSE PaymentCursor;
DEALLOCATE PaymentCursor;



--TRIGGER CODES
--CREATING AUDIT TABLE TO STORE CHANGES DONE IN CUSTOMER TABLE
CREATE TABLE CustomerLog (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT,
    Action NVARCHAR(50),
    ActionDate DATETIME DEFAULT GETDATE(),
);

--CREATING TRIGGER FOR THE ABOVE AUDIT TABLE, AFTER STATEMENT EXECUTION 
CREATE TRIGGER trg_CustomerLog
ON CUSTOMER
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    -- INSERT Operation
        INSERT INTO CustomerLog (CustomerID, Action)
        SELECT CustomerID, 'INSERT'
        FROM INSERTED;

    -- UPDATE Operation
        INSERT INTO CustomerLog (CustomerID, Action)
        SELECT CustomerID, 'UPDATE'
        FROM INSERTED;

    -- DELETE Operation
        INSERT INTO CustomerLog (CustomerID, Action)
        SELECT CustomerID, 'DELETE'
        FROM DELETED;
END;


--comands to check triggers
INSERT INTO CUSTOMER (CustomerID, FirstName, LastName, Email) VALUES 
   (11, 'Ram', 'Sharma', 'ramsharma@email.com')

UPDATE CUSTOMER
SET Email = 'john.doe@newmail.com'
WHERE CustomerID = 1;

DELETE FROM CUSTOMER
WHERE CustomerID = 1;

select * from CustomerLog


--TRANSACTION CODES
--Updating Driver Contact Details
BEGIN TRANSACTION;

BEGIN TRY
    -- Update driver contact details
    UPDATE DRIVER
    SET Contact_Details = '8768790987'
    WHERE DriverID = 101;

    -- Commit transaction
    COMMIT;
    PRINT 'Transaction completed: Driver contact details updated successfully.';
END TRY
BEGIN CATCH
    -- Rollback in case of an error
    PRINT 'An error occurred. Transaction rolled back.';
    ROLLBACK;
END CATCH;


select * from DRIVER


--Adding Feedback for a Driver
BEGIN TRANSACTION;

BEGIN TRY
    -- Insert feedback record
    INSERT INTO FEEDBACK (FeedbackID, CustomerID, DriverID, Rating, Feedback_Content)
    VALUES (11, 4, 105, 4.80, 'Excellent service and friendly driver.');

    -- Commit transaction
    COMMIT;
    PRINT 'Transaction completed: Feedback recorded successfully.';
END TRY
BEGIN CATCH
    -- Rollback in case of an error
    PRINT 'An error occurred. Transaction rolled back.';
    ROLLBACK;
END CATCH;

select * from FEEDBACK
SELECT * FROM CUSTOMER
SELECT * FROM CUSTOMER_CONTACT

--ADDING A NEW CUSTOMER AND ITS CONTACT INFORMATION
BEGIN TRANSACTION;

BEGIN TRY
    -- Insert new customer record
    INSERT INTO CUSTOMER (CustomerID, FirstName, LastName, Email)
    VALUES (12, 'Alice', 'Johnson', 'alice.johnson@email.com');

    -- Insert customer's phone number
    INSERT INTO CUSTOMER_CONTACT (CustomerID, ContactType, ContactValue)
    VALUES (12, 'Phone', '5551234567');

    -- Insert customer's address
    INSERT INTO CUSTOMER_CONTACT (CustomerID, ContactType, ContactValue)
    VALUES (12, 'Address', '123 Elm Street');

    -- Commit transaction
    COMMIT;
    PRINT 'Transaction completed: Customer and contact information added successfully.';
END TRY
BEGIN CATCH
    -- Rollback in case of an error
    PRINT 'An error occurred. Transaction rolled back.';
    ROLLBACK;
END CATCH;


