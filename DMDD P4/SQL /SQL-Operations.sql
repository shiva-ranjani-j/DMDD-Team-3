Use DMDDHospitalprojectv8;
GO
--PROCEDURES
--stored procedure for appointments employee
CREATE PROCEDURE UpcomingAppointments_Employee @Employee_ID int AS
BEGIN
SELECT a.AppointmentID, a.PatientID, p.FirstName + ' ' + p.LastName AS FullName, a.Date, a.Time
FROM Appointment a JOIN Patient p ON a.PatientID = p.PatientID
WHERE  a.Date >= GETDATE() AND a.EmployeeID = @Employee_ID
ORDER BY a.Date ASC, a.Time ASC
END;

EXEC UpcomingAppointments_Employee '100000';

--stored procedure for appointments patient
CREATE PROCEDURE UpcomingAppointments_Patient @Patient_ID int AS
BEGIN
SELECT a.AppointmentID, p.PatientID, p.FirstName + ' ' + p.LastName AS FullName, a.Date, a.Time, a.EmployeeID
FROM Appointment a RIGHT JOIN Patient p ON a.PatientID = p.PatientID
WHERE  a.Date >= GETDATE() AND p.PatientID = @Patient_ID
ORDER BY a.Date ASC, a.Time ASC
END;

EXEC UpcomingAppointments_Patient '100001';

--stored procedure for room availability
CREATE PROCEDURE RoomAvailability @CheckinDate Date AS
BEGIN
SELECT RoomNumber
FROM Room
WHERE CheckoutDate < @CheckinDate
END;

EXEC RoomAvailability '04/08/2024';


--VIEWs

--view for specialitysummary
CREATE VIEW SpecialitySummary AS
SELECT p.Specialty, COUNT(t.PatientID) AS Number_of_Patients
FROM Physician p LEFT JOIN MedicalRecords m ON p.EmployeeID = m.EmployeeID LEFT JOIN Patient t
ON m.PatientID = t.PatientID
WHERE t.PatientID IS NOT NULL
GROUP BY p.Specialty;

SELECT * FROM SpecialitySummary;

--view for customersegmentation
CREATE VIEW CustomerSegmentation AS
SELECT p.PatientID, COUNT(a.appointmentID) AS Number_of_Appointments, 'A' as Customer_Segment
FROM Patient p JOIN Appointment a ON p.PatientID = a.PatientID
GROUP BY p.PatientID
HAVING COUNT(a.appointmentID) > (SELECT AVG(z.Number_of_Appointments)
FROM (SELECT p.PatientID, COUNT(a.appointmentID) AS Number_of_Appointments
FROM Patient p JOIN Appointment a ON p.PatientID = a.PatientID
GROUP BY p.PatientID) z)
UNION ALL
SELECT p.PatientID, COUNT(a.appointmentID) AS Number_of_Appointments, 'B' as Customer_Segment
FROM Patient p JOIN Appointment a ON p.PatientID = a.PatientID
GROUP BY p.PatientID
HAVING COUNT(a.appointmentID) <= (SELECT AVG(z.Number_of_Appointments)
FROM (SELECT p.PatientID, COUNT(a.appointmentID) AS Number_of_Appointments
FROM Patient p JOIN Appointment a ON p.PatientID = a.PatientID
GROUP BY p.PatientID) z);

SELECT * FROM CustomerSegmentation;


--view for room allocation details
CREATE VIEW Patient_Nurse_Room_Allocation_Details AS
SELECT p.PatientID, p.FirstName + ' ' + p.LastName AS FullName, n.EmployeeID AS NurseID, r.RoomNumber
FROM Patient p JOIN Room r ON p.RoomNumber = r.RoomNumber
JOIN Nurse n ON r.EmployeeID = n.EmployeeID;

SELECT * FROM Patient_Nurse_Room_Allocation_Details;

CREATE VIEW PatientPhysicianDetails AS
SELECT 
    p.PatientID,
    p.FirstName + ' ' + p.LastName AS PatientFullName,
    eP.FirstName + ' ' + eP.LastName AS PhysicianFullName,
    m.Diagnosis,
    m.Treatment,
    m.Date AS TreatmentDate
FROM 
    Patient p
    INNER JOIN MedicalRecords m ON p.PatientID = m.PatientID
    INNER JOIN Physician y ON m.EmployeeID = y.EmployeeID
    INNER JOIN Employee eP ON y.EmployeeID = eP.EmployeeID;

SELECT * FROM PatientPhysicianDetails;

--USER-DEFINED FUNCTIONS
--function for calculating Age
CREATE FUNCTION dbo.CalculateAge(@BirthDate DATE)
RETURNS INT
AS
BEGIN
    DECLARE @Today DATE = GETDATE();
    DECLARE @Age INT = DATEDIFF(year, @BirthDate, @Today);

    -- Adjust for cases where the birthday hasn't occurred yet in the current year
    IF (MONTH(@BirthDate) > MONTH(@Today)) OR 
       (MONTH(@BirthDate) = MONTH(@Today) AND DAY(@BirthDate) > DAY(@Today))
    BEGIN
        SET @Age = @Age - 1;
    END

    RETURN @Age;
END;

SELECT dbo.CalculateAge('1990-01-01') AS Age;

ALTER TABLE Patient
ADD Age AS dbo.CalculateAge(DOB);

SELECT FirstName, LastName, DOB, Age
FROM Patient;


--3 NON-CLUSTERED INDEXES

CREATE NONCLUSTERED INDEX IX_Room_CheckinDate ON Room (CheckinDate);

CREATE NONCLUSTERED INDEX IX_Room_EmployeeID ON Room (EmployeeID);

CREATE NONCLUSTERED INDEX IX_Employee_LastName ON Employee (LastName);


--TRIGGERS
--Trigger for patientaudit
CREATE TABLE PatientAudit (
    AuditID INT PRIMARY KEY IDENTITY(1,1),
    PatientID INT,
    ActionTaken VARCHAR(50),
    ActionDate DATETIME,
    Description VARCHAR(MAX)
);

CREATE TRIGGER trg_AfterInsertPatient
ON Patient
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @patientId int;
    DECLARE @actionDate datetime = GETDATE();
    SELECT @patientId = i.PatientID FROM inserted i;

    INSERT INTO PatientAudit (PatientID, ActionTaken, ActionDate, Description)
    VALUES (@patientId, 'INSERT', @actionDate, 'New patient record inserted');
END;

--Inserting values to patient table
INSERT INTO Patient(FirstName, LastName, EmailAddress, Gender, DOB, PhoneNumber, EmergencyPhoneNumber, RoomNumber, Street, Apartment, City, State) VALUES 
('Jane', 'Doe', 'jane.doe@example.com', 'F', '1985-04-23', '555-1234', '555-5678', 10, '123 Main St', 'Apt 4B', 'Springfield', 'IL');

SELECT * FROM PatientAudit;
-

--Trigger for medicalrecord
CREATE TABLE MedicalRecord_Changes (
RecordChangeID int PRIMARY KEY IDENTITY(9000,1),
RecordID int NOT NULL,
Diagnosis varchar(255) NOT NULL,
Treatment varchar(255) NOT NULL,
PatientID int NOT NULL,
EmployeeID INT NOT NULL,
DateofUpdate DATETIME ,
[Action] char(10)
)

CREATE TRIGGER RecordHist
ON dbo.MedicalRecords
FOR UPDATE
AS
BEGIN
declare @action char(10)
SET @action = 'Update'
	INSERT INTO MedicalRecord_Changes(RecordID,Diagnosis,Treatment,PatientID,EmployeeID,DateofUpdate,[Action])
SELECT 	RecordID,Diagnosis,Treatment,PatientID,EmployeeID,GETDATE(),@action FROM DELETED
END
GO

UPDATE MedicalRecords
SET DIAGNOSIS = 'Migraine' WHERE RecordID = 100000
SELECT * FROM MedicalRecord_Changes


--DATA ENCRYPTION

-- Create a Master Key
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Password123';

-- Create a Certificate
CREATE CERTIFICATE UserCertificate WITH SUBJECT = 'User Email Encryption';

-- Create a Symmetric Key
CREATE SYMMETRIC KEY UserSymmetricKey
WITH ALGORITHM = AES_256
ENCRYPTION BY CERTIFICATE UserCertificate;

ALTER TABLE patient ADD Email_Encrypted VARBINARY(MAX);

OPEN SYMMETRIC KEY UserSymmetricKey
DECRYPTION BY CERTIFICATE UserCertificate;

UPDATE patient
SET Email_Encrypted = EncryptByKey(Key_GUID('UserSymmetricKey'), EmailAddress);

CLOSE SYMMETRIC KEY UserSymmetricKey;

OPEN SYMMETRIC KEY UserSymmetricKey
DECRYPTION BY CERTIFICATE UserCertificate;

SELECT PatientID, FirstName, Email_Encrypted,
       CONVERT(VARCHAR(MAX), DecryptByKey(Email_Encrypted)) AS DecryptedEmail
FROM patient;

CLOSE SYMMETRIC KEY UserSymmetricKey;