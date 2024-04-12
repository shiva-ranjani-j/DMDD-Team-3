Use DMDDHospitalprojectv8;
GO
-- Values insertion 
INSERT INTO Employee (FirstName, LastName, ContactNumber) VALUES
('Linda', 'Williams', '741-231-4750'),
('Mary', 'Williams', '317-334-9337'),
('Elizabeth', 'Smith', '309-802-5468'),
('Linda', 'Jones', '140-170-7335'),
('William', 'Smith', '789-392-4458'),
('Jennifer', 'Smith', '130-952-6558'),
('Elizabeth', 'Smith', '557-483-4712'),
('Robert', 'Johnson', '465-316-5223'),
('William', 'Johnson', '368-847-6865'),
('John', 'Brown', '982-510-6737'),
('Robert', 'Jones', '772-838-7783'),
('Elizabeth', 'Brown', '531-858-1030'),
('Patricia', 'Smith', '250-808-3861'),
('John', 'Brown', '776-367-4380'),
('Linda', 'Smith', '267-996-8550'),
('John', 'Johnson', '300-557-5445'),
('Linda', 'Williams', '252-817-1811'),
('Jennifer', 'Johnson', '352-557-9911'),
('James', 'Smith', '168-573-8270'),
('Mary', 'Brown', '660-722-3138'),
('Robert', 'Johnson', '426-679-7677'),
('Michael', 'Jones', '627-858-1964'),
('Michael', 'Williams', '348-241-7389'),
('Patricia', 'Jones', '215-525-4973'),
('Jennifer', 'Williams', '997-953-6360'),
('John', 'Williams', '163-679-3378'),
('Jennifer', 'Jones', '151-704-6030'),
('Michael', 'Jones', '103-346-4149'),
('Jennifer', 'Smith', '719-702-1581'),
('Michael', 'Jones', '579-641-7058');

INSERT INTO Lab (LabID, TestType) VALUES
(1, 'Blood Test'),
(2, 'Urine Analysis'),
(3, 'Biopsy'),
(4, 'X-Ray'),
(5, 'MRI'),
(6, 'CT Scan'),
(7, 'EKG'),
(8, 'Ultrasound'),
(9, 'Allergy Test'),
(10, 'Stress Test');

INSERT INTO Nurse (EmployeeID, Expertise) VALUES
(100010, 'Oncology'),
(100011, 'Surgical'),
(100012, 'Oncology'),
(100013, 'Critical Care'),
(100014, 'Psychiatric'),
(100015, 'Geriatrics'),
(100016, 'Pediatrics'),
(100017, 'Neonatal'),
(100018, 'Critical Care'),
(100019, 'Oncology');


INSERT INTO Room --(RoomNumber, CheckinDate, CheckinTime, CheckoutDate)
VALUES
(1,'','','',100012),
(2, '2025-01-04', '23:18:40', '2025-01-09',100010),
(3, '2024-08-25', '19:42:38', '2024-09-22',100011),
(4, '2024-09-01', '00:27:30', '2024-09-07',100012),
(5, '2024-11-07', '21:04:35', '2024-11-24',100013),
(6, '2024-04-11', '22:58:56', '2024-04-24',100014),
(7, '2024-05-03', '18:29:05', '2024-05-07',100010),
(8, '2024-07-18', '18:45:11', '2024-07-21',100011),
(9, '2024-11-16', '22:54:18', '2024-12-15',100013),
(10, '2024-10-12', '07:46:11', '2024-11-02',100012),
(11, '2024-04-10', '07:24:56', '2024-04-15',100015),
(12, '2024-09-26', '11:18:00', '2024-09-27',100015),
(13, '','','',100010),
(14, '2024-09-27', '03:40:02', '2024-10-06',100019),
(15, '','','',100013),
(16, '','','',100014),
(17, '2024-08-17', '16:22:37', '2024-08-26',100019),
(18, '2024-09-03', '08:19:15', '2024-09-27',100016),
(19, '2024-11-27', '00:15:13', '2024-12-09',100010),
(20, '2024-07-22', '17:38:00', '2024-08-10',100011),
(21, '2024-10-02', '10:41:04', '2024-10-19',100012),
(22, '2024-07-02', '12:27:01', '2024-07-09',100012),
(23, '2025-04-01', '12:10:09', '2025-04-27',100014),
(24, '2024-08-11', '12:12:55', '2024-08-17',100014),
(25, '2024-07-23', '11:16:22', '2024-08-11',100015),
(26, '2025-03-19', '10:41:30', '2025-03-19',100016),
(27, '2025-01-28', '14:29:06', '2025-02-23',100017),
(28, '2024-08-24', '09:03:24', '2024-08-29',100017),
(29, '2024-05-11', '22:31:56', '2024-05-25',100017),
(30, '2025-03-18', '23:48:32', '2025-04-04',100015);


INSERT INTO Physician (EmployeeID, Specialty) VALUES
(100000, 'Psychiatry'),
(100001, 'Radiology'),
(100002, 'General Surgery'),
(100003, 'Psychiatry'),
(100004, 'Pediatrics'),
(100005, 'Oncology'),
(100006, 'Orthopedics'),
(100007, 'Oncology'),
(100008, 'Gastroenterology'),
(100009, 'Neurology');



INSERT INTO Lab_Assistant (EmployeeID, Department, LabID) VALUES
(100020, 'Biochemistry', 1),
(100021, 'Pathology', 2),
(100022, 'Immunology', 3),
(100023, 'Hematology', 4),
(100024, 'Hematology', 5),
(100025, 'Immunology', 6),
(100026, 'Toxicology', 7),
(100027, 'Cytology', 8),
(100028, 'Microbiology', 9),
(100029, 'Virology', 10);


INSERT INTO NonMedicalStaff (EmployeeID, JobTitle) VALUES
(100011, 'Accountant'),
(100012, 'Accountant'),
(100013, 'Billing Specialist'),
(100014, 'Receptionist'),
(100015, 'Administrator'),
(100016, 'HR Coordinator'),
(100017, 'Billing Specialist'),
(100018, 'IT Support'),
(100019, 'Administrator'),
(100020, 'Billing Specialist');


INSERT INTO Patient ( FirstName, LastName, EmailAddress, Gender, DOB, PhoneNumber, EmergencyPhoneNumber, RoomNumber, Street, Apartment, City, State) VALUES
( 'Michael', 'Brown', 'michael.brown@example.com', 'O', '1955-06-16', '198-458-7989', '307-121-7443', 2, '6358 Oak St', '', 'Springfield', 'CA'),
( 'Elizabeth', 'Jones', 'elizabeth.jones@example.com', 'M', '1954-02-20', '469-824-6317', '363-935-1832', 25, '9286 Grove St', '', 'Springfield', 'FL'),
( 'Linda', 'Smith', 'linda.smith@example.com', 'F', '1982-05-20', '643-971-7931', '950-537-1637', 28, '7472 Pine St', '', 'Springfield', 'FL'),
( 'Mary', 'Smith', 'mary.smith@example.com', 'F', '1983-07-21', '689-555-2024', '447-256-3511', 8, '5628 Oak St', '', 'Lake City', 'CA'),
( 'John', 'Smith', 'john.smith@example.com', 'M', '1968-10-12', '488-784-6201', '577-872-4200', 2, '4153 Main St', 'Apt. 3', 'Lake City', 'TX'),
( 'Mary', 'Jones', 'mary.jones@example.com', 'O', '1948-09-21', '258-368-4137', '156-742-9518', 22, '5794 Main St', '', 'Lake City', 'CA'),
( 'William', 'Jones', 'william.jones@example.com', 'O', '1961-03-11', '932-822-6418', '888-157-2386', 23, '1458 Pine St', 'Apt. 9', 'Lake City', 'PA'),
( 'Elizabeth', 'Williams', 'elizabeth.williams@example.com', 'F', '1952-10-17', '889-729-9688', '694-722-4951', 12, '7726 Oak St', 'Apt. 7', 'Lake City', 'NY'),
( 'Patricia', 'Jones', 'patricia.jones@example.com', 'M', '1925-06-01', '979-920-2240', '759-847-3770', 4, '2770 Main St', '', 'Rivertown', 'CA'),
( 'John', 'Brown', 'john.brown@example.com', 'M', '1951-02-10', '848-638-7085', '190-895-4217', 10, '8847 Grove St', 'Apt. 7', 'Rivertown', 'TX');
INSERT INTO Patient (FirstName, LastName, EmailAddress, Gender, DOB, PhoneNumber, EmergencyPhoneNumber, RoomNumber, Street, Apartment, City, State) VALUES
('Robert', 'Williams', 'robert.williams@example.com', 'O', '1957-09-11', '853-767-6916', '360-967-9144', 28, '5765 Pine St', '', 'Lake City', 'PA'),
('Patricia', 'Williams', 'patricia.williams@example.com', 'O', '1921-10-19', '887-135-7911', '913-580-2630', 14, '5337 Pine St', 'Apt. 18', 'Springfield', 'TX'),
('Robert', 'Johnson', 'robert.johnson@example.com', 'F', '2003-04-21', '796-726-4481', '957-581-8925', 2, '6188 Oak St', '', 'Rivertown', 'FL'),
('Linda', 'Williams', 'linda.williams@example.com', 'M', '1927-12-29', '889-657-6004', '857-209-2217', 18, '1784 Grove St', '', 'Rivertown', 'NY'),
('Elizabeth', 'Smith', 'elizabeth.smith@example.com', 'O', '1967-11-14', '582-241-1435', '592-794-1413', 21, '3809 Oak St', '', 'Springfield', 'CA'),
('Elizabeth', 'Brown', 'elizabeth.brown@example.com', 'M', '1988-07-06', '930-975-8307', '263-878-2219', 12, '7255 Main St', 'Apt. 11', 'Rivertown', 'FL'),
('John', 'Smith', 'john.smith@example.com', 'O', '1952-07-30', '239-183-6690', '706-695-5748', 17, '9006 Oak St', '', 'Rivertown', 'PA'),
('Mary', 'Smith', 'mary.smith@example.com', 'F', '1954-05-13', '335-883-7424', '216-658-1080', 24, '9534 Main St', 'Apt. 18', 'Rivertown', 'PA'),
('William', 'Smith', 'william.smith@example.com', 'O', '1964-12-07', '342-385-2446', '149-177-4446', 3, '1150 Pine St', '', 'Springfield', 'FL'),
('James', 'Smith', 'james.smith@example.com', 'F', '1970-02-21', '136-866-7485', '410-161-7520', 7, '1131 Main St', 'Apt. 5', 'Lake City', 'NY');
INSERT INTO Patient (FirstName, LastName, EmailAddress, Gender, DOB, PhoneNumber, EmergencyPhoneNumber, RoomNumber, Street, Apartment, City, State) VALUES
('John', 'Williams', 'john.williams@example.com', 'F', '1943-06-22', '835-377-5006', '980-895-8878', 11, '3380 Oak St', 'Apt. 18', 'Rivertown', 'CA'),
('William', 'Williams', 'william.williams@example.com', 'O', '1939-06-30', '674-520-3933', '946-952-9083', 2, '7759 Oak St', 'Apt. 17', 'Springfield', 'TX'),
('John', 'Brown', 'john.brown@example.com', 'O', '1989-07-23', '877-930-9009', '261-353-2697', 18, '6040 Main St', '', 'Rivertown', 'CA'),
('William', 'Williams', 'william.williams@example.com', 'M', '1936-07-11', '530-459-5208', '453-276-8581', 30, '7563 Oak St', '', 'Lake City', 'PA'),
('Elizabeth', 'Smith', 'elizabeth.smith@example.com', 'M', '1934-07-05', '416-299-6544', '628-487-4316', 20, '4384 Oak St', '', 'Lake City', 'TX'),
('Patricia', 'Williams', 'patricia.williams@example.com', 'F', '1990-12-25', '813-321-3041', '125-787-7799', 6, '7266 Main St', '', 'Lake City', 'TX'),
('John', 'Williams', 'john.williams@example.com', 'M', '1958-07-25', '205-632-3905', '254-274-4471', 24, '6349 Main St', 'Apt. 3', 'Lake City', 'NY'),
('Michael', 'Williams', 'michael.williams@example.com', 'O', '1926-12-25', '834-595-7731', '420-543-5687', 27, '9677 Grove St', 'Apt. 9', 'Lake City', 'CA'),
('William', 'Jones', 'william.jones@example.com', 'O', '1950-10-20', '521-911-8334', '134-229-1695', 14, '5469 Pine St', 'Apt. 4', 'Rivertown', 'PA'),
('Elizabeth', 'Williams', 'elizabeth.williams@example.com', 'F', '1926-08-04', '944-325-3991', '466-612-4237', 8, '9110 Main St', 'Apt. 19', 'Rivertown', 'NY');
INSERT INTO Patient ( FirstName, LastName, EmailAddress, Gender, DOB, PhoneNumber, EmergencyPhoneNumber, RoomNumber, Street, Apartment, City, State) VALUES
( 'Patricia', 'Smith', 'patricia.smith@example.com', 'M', '1954-11-27', '442-850-1354', '408-260-1939', 5, '6470 Oak St', 'Apt. 10', 'Rivertown', 'PA'),
( 'Robert', 'Johnson', 'robert.johnson@example.com', 'M', '1962-06-28', '564-693-2898', '109-230-3103', 14, '1637 Pine St', '', 'Springfield', 'CA'),
( 'Mary', 'Jones', 'mary.jones@example.com', 'M', '1975-03-09', '149-610-5294', '251-452-8752', 19, '2111 Pine St', '', 'Springfield', 'CA'),
( 'Elizabeth', 'Williams', 'elizabeth.williams@example.com', 'M', '1937-06-21', '148-154-4197', '736-137-6772', 26, '823 Main St', 'Apt. 16', 'Springfield', 'TX'),
( 'James', 'Jones', 'james.jones@example.com', 'M', '1977-07-19', '497-334-2599', '245-287-4737', 23, '9403 Pine St', '', 'Springfield', 'FL'),
( 'Robert', 'Jones', 'robert.jones@example.com', 'M', '1985-06-21', '943-622-1352', '372-232-9703', 18, '874 Pine St', '', 'Springfield', 'CA'),
( 'John', 'Brown', 'john.brown@example.com', 'O', '1937-12-29', '925-387-4497', '422-953-3388', 9, '6441 Oak St', 'Apt. 15', 'Lake City', 'NY'),
( 'Patricia', 'Smith', 'patricia.smith@example.com', 'F', '1950-10-07', '630-611-1786', '837-403-5294', 29, '7108 Oak St', 'Apt. 5', 'Lake City', 'TX'),
( 'Robert', 'Williams', 'robert.williams@example.com', 'F', '1945-11-29', '557-585-8935', '563-600-8220', 21, '497 Main St', 'Apt. 7', 'Springfield', 'FL'),
( 'Jennifer', 'Brown', 'jennifer.brown@example.com', 'M', '1996-01-19', '464-807-8829', '739-718-1340', 22, '9014 Main St', 'Apt. 11', 'Rivertown', 'PA');


INSERT INTO MedicalRecords (Date, Diagnosis, Treatment, PatientID, EmployeeID) VALUES
('2023-04-17', 'Asthma', 'Antibiotics', 100001, 100000),
('2023-04-21', 'Hypertension', 'Medication and lifestyle changes', 100002, 100001),
('2023-05-10', 'Diabetes', 'Topical creams', 100003, 100002),
('2023-04-20', 'Migraine', 'Pain management', 100004, 100003),
('2023-05-19', 'Bronchitis', 'Physical therapy', 100005, 100004),
('2023-06-04', 'Anemia', 'Topical creams', 100006, 100005),
('2023-04-29', 'Hypertension', 'Inhalers and avoidance of triggers', 100007, 100006),
('2023-05-28', 'Influenza', 'Inhalers and avoidance of triggers', 100008, 100007),
('2023-05-27', 'Gastritis', 'Physical therapy', 100009, 100008),
('2023-05-12', 'Dermatitis', 'Iron supplements', 100010, 100009),
('2023-05-30', 'Diabetes', 'Antibiotics', 100011, 100000),
('2023-05-17', 'Gastritis', 'Physical therapy', 100012, 100001),
('2023-04-23', 'Migraine', 'Inhalers and avoidance of triggers', 100013, 100002),
('2023-05-19', 'Anemia', 'Antibiotics', 100014, 100003),
('2023-06-04', 'Anemia', 'Rest and hydration', 100015, 100004),
('2022-06-02', 'Bronchitis', 'Physical therapy', 100016, 100005),
('2021-04-17', 'Asthma', 'Pain management', 100017, 100006),
('2023-05-08', 'Migraine', 'Pain management', 100018, 100007),
('2022-05-05', 'Bronchitis', 'Dietary changes', 100019, 100008),
('2022-04-12', 'Diabetes', 'Inhalers and avoidance of triggers', 100020, 100009),
('2023-05-18', 'Anemia', 'Antibiotics', 100021, 100000),
('2021-04-21', 'Bronchitis', 'Medication and lifestyle changes', 100022, 100001),
('2022-04-30', 'Anemia', 'Iron supplements', 100023, 100002),
('2021-04-15', 'Hypertension', 'Iron supplements', 100024, 100003),
('2021-05-31', 'Influenza', 'Physical therapy', 100025, 100004),
('2021-04-21', 'Hypertension', 'Insulin therapy', 100026, 100005),
('2021-04-13', 'Influenza', 'Medication and lifestyle changes', 100027, 100006),
('2024-03-10', 'Influenza', 'Insulin therapy', 100028, 100007),
('2024-02-24', 'Asthma', 'Rest and hydration', 100029, 100008),
('2024-01-25', 'Migraine', 'Inhalers and avoidance of triggers', 100030, 100009);


INSERT INTO Billing (BillingID, Amount, Date, DueDate, ModeOfPayment, NM_EmployeeID, PatientID) VALUES
(1, 600, '2024-04-28', '2024-05-09', 'Insurance', 100011, 100001),
(2, 200, '2024-04-20', '2024-05-09', 'Online Payment', 100012, 100002),
(3, 700, '2024-04-29', '2024-05-31', 'Insurance', 100013, 100003),
(4, 200, '2024-04-10', '2024-05-06', 'Insurance', 100014, 100004),
(5, 600, '2024-05-19', '2024-05-28', 'Credit Card', 100015, 100005),
(6, 200, '2024-05-25', '2024-05-14', 'Online Payment', 100016, 100006),
(7, 900, '2024-05-10', '2024-05-17', 'Cash', 100017, 100007),
(8, 1000, '2024-06-03', '2024-05-14', 'Online Payment', 100018, 100008),
(9, 400, '2024-06-02', '2024-05-12', 'Insurance', 100019, 100009),
(10, 400, '2024-04-17', '2024-05-29', 'Insurance', 100020, 100010);


INSERT INTO Insurance (InsuranceNumber, BillingID, Provider) VALUES
('INS-9879-1839', 1, 'LifeCare Ins.'),
('INS-2370-3830', 2, 'HealthPlus Ins.'),
('INS-8828-7441', 3, 'HealthPlus Ins.'),
('INS-8268-4596', 4, 'MediAssist Ins.'),
('INS-1829-9956', 5, 'HealthPlus Ins.'),
('INS-7593-4994', 6, 'LifeCare Ins.'),
('INS-2748-9287', 7, 'SecureHealth Ins.'),
('INS-9418-6525', 8, 'LifeCare Ins.'),
('INS-5009-2887', 9, 'WellBeing Ins.'),
('INS-7102-1443', 10, 'HealthPlus Ins.');


INSERT INTO Card (BillingID, FirstNameOnCard, LastNameOnCard, CardType) VALUES
(1, 'John', 'Brown', 'Discover'),
(2, 'Elizabeth', 'Jones', 'Discover'),
(3, 'Linda', 'Brown', 'Visa'),
(4, 'Mary', 'Johnson', 'American Express'),
(5, 'John', 'Brown', 'Discover'),
(6, 'Patricia', 'Smith', 'American Express'),
(7, 'Patricia', 'Jones', 'MasterCard'),
(8, 'Patricia', 'Johnson', 'Discover'),
(9, 'William', 'Jones', 'American Express'),
(10, 'Linda', 'Jones', 'Discover');


INSERT INTO Appointment (Date, Time, PatientID, EmployeeID) VALUES
('2024-05-27', '05:15:04', 100001, 100004),
('2024-05-21', '03:05:04', 100001, 100002),
('2024-05-21', '03:05:04', 100001, 100000),
('2024-05-31', '09:22:05', 100002, 100001),
('2024-05-05', '13:54:05', 100003, 100002),
('2024-05-29', '00:17:09', 100004, 100003),
('2024-04-15', '09:46:55', 100005, 100004),
('2024-05-19', '14:46:23', 100006, 100005),
('2024-04-29', '13:21:37', 100007, 100006),
('2024-05-20', '15:56:36', 100008, 100007),
('2024-05-03', '11:17:21', 100009, 100008),
('2024-04-20', '21:18:24', 100010, 100009),
('2024-06-01', '08:00:00', 100011, 100000),
('2024-06-01', '08:30:00', 100012, 100001),
('2024-06-01', '09:00:00', 100013, 100002),
('2024-06-01', '09:30:00', 100014, 100003),
('2024-06-01', '10:00:00', 100015, 100004),
('2024-06-01', '10:30:00', 100016, 100005),
('2024-06-01', '11:00:00', 100017, 100006),
('2024-06-02', '08:00:00', 100018, 100007),
('2024-06-02', '08:30:00', 100019, 100008),
('2024-06-02', '09:00:00', 100020, 100009),
('2024-06-02', '09:30:00', 100021, 100010),
('2024-06-02', '10:00:00', 100022, 100011),
('2024-06-02', '10:30:00', 100023, 100012),
('2024-06-02', '11:00:00', 100024, 100013),
('2024-06-03', '08:00:00', 100025, 100014),
('2024-06-03', '08:30:00', 100026, 100015),
('2024-06-03', '09:00:00', 100027, 100016),
('2024-06-03', '09:30:00', 100028, 100017),
('2024-06-03', '10:00:00', 100029, 100018),
('2024-06-03', '10:30:00', 100030, 100019),
('2024-06-03', '11:00:00', 100031, 100020),
('2024-06-04', '08:00:00', 100032, 100021),
('2024-06-04', '08:30:00', 100033, 100022),
('2024-06-04', '09:00:00', 100034, 100023),
('2024-06-04', '09:30:00', 100035, 100024),
('2024-06-04', '10:00:00', 100036, 100025),
('2024-06-04', '10:30:00', 100037, 100026),
('2024-06-04', '11:00:00', 100038, 100027),
('2024-06-04', '11:30:00', 100039, 100028);


