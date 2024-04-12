Create Database DMDDHospitalprojectv8;
GO
Use DMDDHospitalprojectv8;
GO

-- Creating the Employee table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY IDENTITY(100000,1),
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    ContactNumber VARCHAR(15),
	CONSTRAINT Emp_IDLen CHECK (LEN(EmployeeID) = 6)
);

-- Creating the Lab table
CREATE TABLE Lab (
    LabID INT PRIMARY KEY,
    TestType VARCHAR(255)
);

-- Creating the Nurse table
CREATE TABLE Nurse (
    EmployeeID INT PRIMARY KEY,
    Expertise VARCHAR(255),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

-- Creating the Room table
CREATE TABLE Room (
    RoomNumber INT PRIMARY KEY,
    CheckinDate DATE NULL,
    CheckinTime TIME NULL,
    CheckoutDate DATE NULL,
	EmployeeID INT FOREIGN KEY REFERENCES Nurse(EmployeeID)
);

-- Creating the Physician table
CREATE TABLE Physician (
    EmployeeID INT PRIMARY KEY,
    Specialty VARCHAR(255),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);


-- Creating the Lab-Assistant table
CREATE TABLE Lab_Assistant (
    EmployeeID INT PRIMARY KEY,
    Department VARCHAR(255),
    LabID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (LabID) REFERENCES Lab(LabID)
);

-- Creating the Non-Medical Staff table
CREATE TABLE NonMedicalStaff (
    EmployeeID INT PRIMARY KEY,
    JobTitle VARCHAR(255),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

-- Creating the Patient table
CREATE TABLE Patient (
    PatientID INT PRIMARY KEY IDENTITY(100000,1),
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    EmailAddress VARCHAR(255),
    Gender CHAR(1),
    DOB DATE,
    PhoneNumber VARCHAR(15),
    EmergencyPhoneNumber VARCHAR(15),
    RoomNumber INT,
    Street VARCHAR(255),
    Apartment VARCHAR(255),
    City VARCHAR(255),
    State VARCHAR(2),
    FOREIGN KEY (RoomNumber) REFERENCES Room(RoomNumber),
	CONSTRAINT Pat_IDLen CHECK (LEN(PatientID) = 6)
);

-- Creating the Medical Records table
CREATE TABLE MedicalRecords (
    RecordID INT PRIMARY KEY IDENTITY(100000,1),
    Date DATE,
    Diagnosis VARCHAR(255),
    Treatment VARCHAR(255),
    PatientID INT,
    EmployeeID INT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (EmployeeID) REFERENCES Physician(EmployeeID)
);

-- Creating the Billing table
CREATE TABLE Billing (
    BillingID INT PRIMARY KEY,
    Amount MONEY,
    Date DATE,
    DueDate DATE,
    ModeOfPayment VARCHAR(255),
    NM_EmployeeID INT,
    PatientID INT,
    FOREIGN KEY (NM_EmployeeID) REFERENCES NonMedicalStaff(EmployeeID),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
	CONSTRAINT Payment CHECK(ModeOfPayment IN ('Cash','Insurance', 'Online Payment', 'Credit Card'))
);

-- Creating the Insurance table
CREATE TABLE Insurance (
    InsuranceNumber VARCHAR(255) PRIMARY KEY,
    BillingID INT,
    Provider VARCHAR(255),
    FOREIGN KEY (BillingID) REFERENCES Billing(BillingID)
);

-- Creating the Card table
CREATE TABLE Card (
    TransactionID INT PRIMARY KEY IDENTITY(100000,1),
    BillingID INT,
    FirstNameOnCard VARCHAR(255),
    LastNameOnCard VARCHAR(255),
    CardType VARCHAR(255),
    FOREIGN KEY (BillingID) REFERENCES Billing(BillingID)
);

-- Creating the Appointment table
CREATE TABLE Appointment (
    AppointmentID INT PRIMARY KEY IDENTITY(1000,1),
    Date DATE,
    Time TIME,
    PatientID INT,
    EmployeeID INT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

