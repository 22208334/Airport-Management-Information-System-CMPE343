-- Employees
INSERT INTO Employee VALUES ('11111', 'Ahmet Yilmaz', 'U001', '555-0101');
INSERT INTO Employee VALUES ('22222', 'Ayse Demir', 'U002', '555-0202');
INSERT INTO Employee VALUES ('33333', 'Mehmet Kaya', 'U003', '555-0303');
INSERT INTO Employee VALUES ('44444', 'Fatma Celik', 'U004', '555-0404');
INSERT INTO Employee VALUES ('55555', 'Ali Tekin', 'U005', '555-0505');

-- Traffic Controllers
INSERT INTO Traffic_Controller VALUES ('11111', '2025-10-15');
INSERT INTO Traffic_Controller VALUES ('22222', '2026-01-20');

-- Technicians
INSERT INTO Technician VALUES ('33333');
INSERT INTO Technician VALUES ('44444');

-- Plane Models
INSERT INTO Plane_Model VALUES ('B737', 'Boeing', 200, 41000);
INSERT INTO Plane_Model VALUES ('A320', 'Airbus', 180, 42600);
INSERT INTO Plane_Model VALUES ('B777', 'Boeing', 350, 134000);

-- Technician Expertise
INSERT INTO Technician_Expertise VALUES ('33333', 'B737');
INSERT INTO Technician_Expertise VALUES ('33333', 'A320');
INSERT INTO Technician_Expertise VALUES ('44444', 'B777');

-- Airplanes
INSERT INTO Airplane VALUES ('TC-JAA', 'B737', 2015);
INSERT INTO Airplane VALUES ('TC-JAB', 'A320', 2018);
INSERT INTO Airplane VALUES ('TC-JAC', 'B777', 2020);

-- Hangars
INSERT INTO Hangar VALUES ('H1', 'North Wing', 5);
INSERT INTO Hangar VALUES ('H2', 'South Wing', 3);

-- Airplane Locations
INSERT INTO Airplane_Location
VALUES (1, 'TC-JAA', 'H1', '2026-05-01 10:00:00', '2026-05-02 12:00:00');

INSERT INTO Airplane_Location
VALUES (2, 'TC-JAB', 'H2', '2026-05-10 08:00:00', NULL);

-- Tests
INSERT INTO Test VALUES ('T1', 'Engine Diagnostic', 100);
INSERT INTO Test VALUES ('T2', 'Landing Gear Check', 100);
INSERT INTO Test VALUES ('T3', 'Avionics System Test', 100);

-- Maintenance Tests
INSERT INTO Maintenance_Test
VALUES (1, 'TC-JAA', '33333', 'T1', '2026-05-01', 4.5, 95);

INSERT INTO Maintenance_Test
VALUES (2, 'TC-JAB', '33333', 'T2', '2026-05-11', 2.0, 98);

INSERT INTO Maintenance_Test
VALUES (3, 'TC-JAC', '44444', 'T3', '2026-05-12', 6.0, 100);

INSERT INTO Maintenance_Test
VALUES (4, 'TC-JAA', '33333', 'T2', '2026-05-05', 3.0, 85);