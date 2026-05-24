CREATE TABLE Employee (
    SSN VARCHAR(15) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Union_Mem_No VARCHAR(20) UNIQUE,
    Phone VARCHAR(15)
);

CREATE TABLE Traffic_Controller (
    SSN VARCHAR(15) PRIMARY KEY,
    Last_Exam_Date DATE NOT NULL,
    FOREIGN KEY (SSN) REFERENCES Employee(SSN) ON DELETE CASCADE
);

CREATE TABLE Technician (
    SSN VARCHAR(15) PRIMARY KEY,
    FOREIGN KEY (SSN) REFERENCES Employee(SSN) ON DELETE CASCADE
);

CREATE TABLE Plane_Model (
    Model_No VARCHAR(20) PRIMARY KEY,
    Manufacturer VARCHAR(50),
    Capacity INT,
    Weight DECIMAL(10,2)
);

CREATE TABLE Technician_Expertise (
    SSN VARCHAR(15),
    Model_No VARCHAR(20),
    PRIMARY KEY (SSN, Model_No),
    FOREIGN KEY (SSN) REFERENCES Technician(SSN) ON DELETE CASCADE,
    FOREIGN KEY (Model_No) REFERENCES Plane_Model(Model_No) ON DELETE CASCADE
);

CREATE TABLE Airplane (
    Plane_No VARCHAR(20) PRIMARY KEY,
    Model_No VARCHAR(20),
    Year_Built INT,
    FOREIGN KEY (Model_No) REFERENCES Plane_Model(Model_No)
);

CREATE TABLE Hangar (
    Hangar_No VARCHAR(10) PRIMARY KEY,
    Location VARCHAR(100),
    Capacity INT
);

CREATE TABLE Airplane_Location (
    Location_ID INT PRIMARY KEY,
    Plane_No VARCHAR(20),
    Hangar_No VARCHAR(10),
    In_Date_Time TIMESTAMP,
    Out_Date_Time TIMESTAMP,
    FOREIGN KEY (Plane_No) REFERENCES Airplane(Plane_No) ON DELETE CASCADE,
    FOREIGN KEY (Hangar_No) REFERENCES Hangar(Hangar_No) ON DELETE CASCADE
);

CREATE TABLE Test (
    Test_ID VARCHAR(10) PRIMARY KEY,
    Test_Name VARCHAR(100) NOT NULL,
    Max_Score INT
);

CREATE TABLE Maintenance_Test (
    Event_ID INT PRIMARY KEY,
    Plane_No VARCHAR(20),
    SSN VARCHAR(15),
    Test_ID VARCHAR(10),
    Test_Date DATE NOT NULL,
    Hours_Spent DECIMAL(5,2),
    Score INT,
    FOREIGN KEY (Plane_No) REFERENCES Airplane(Plane_No) ON DELETE CASCADE,
    FOREIGN KEY (SSN) REFERENCES Technician(SSN),
    FOREIGN KEY (Test_ID) REFERENCES Test(Test_ID)
);