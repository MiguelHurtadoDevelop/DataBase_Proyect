
-- Creación de la base de datos
CREATE DATABASE Protection_of_Animals_of_Granada;

-- Uso de la base de datos
USE Protection_of_Animals_of_Granada;

-- Creación de la tabla PET
CREATE TABLE PET (
  CHIP VARCHAR(50) PRIMARY KEY,
  name VARCHAR(50),
  sex VARCHAR(10),
  birth_date DATE
);

-- Creación de la tabla USER
CREATE TABLE USER (
  NIE VARCHAR(50) PRIMARY KEY,
  name VARCHAR(50),
  surname VARCHAR(50),
  phone VARCHAR(20),
  email VARCHAR(100),
  password VARCHAR(100),
  address VARCHAR(100)
);
-- Creación de la tabla USER_have_PET
CREATE TABLE  USER_have_PET (
  NIE_USER VARCHAR(50),
  CHIP_PET VARCHAR(50),
  FOREIGN KEY (NIE_USER) REFERENCES USER(NIE),
  FOREIGN KEY (CHIP_PET) REFERENCES PET(CHIP),
  PRIMARY KEY (NIE_USER, CHIP_PET)
);



-- Creación de la tabla CREDIT_CARD
CREATE TABLE CREDIT_CARD (
  NIE_USER VARCHAR(50),
  NUMBER VARCHAR(20),
  FOREIGN KEY (NIE_USER) REFERENCES USER(NIE),
  PRIMARY KEY (NIE_USER)
);

-- Creación de la tabla MEMBERS
CREATE TABLE MEMBERS (
  ID_MEMBER INT PRIMARY KEY,
  NIE_USER VARCHAR(50),
  frequency VARCHAR(20),
  amount DECIMAL(10, 2),
  FOREIGN KEY (NIE_USER) REFERENCES USER(NIE)
);

-- Creación de la tabla ADOPTION
CREATE TABLE ADOPTION (
  CHIP_PET VARCHAR(50) PRIMARY KEY,
  name VARCHAR(50),
  price DECIMAL(10, 2),
  date_of_death DATE,
  FOREIGN KEY (CHIP_PET) REFERENCES PET(CHIP)
);

-- Creación de la tabla ORDER_
CREATE TABLE ORDER_ (
  ID INT PRIMARY KEY,
  NIE_USER VARCHAR(50),
  delivery_date DATE,
  total_cost DECIMAL(10, 2),
  FOREIGN KEY (NIE_USER) REFERENCES USER(NIE)
);

-- Creación de la tabla PRODUCT
CREATE TABLE PRODUCT (
  CODE VARCHAR(50) PRIMARY KEY,
  name VARCHAR(50),
  price DECIMAL(10, 2),
  availability INT,
  size VARCHAR(20),
  color VARCHAR(20)
);

-- Creación de la tabla ORDER_PRODUCT
CREATE TABLE ORDER_PRODUCT (
  ID_ORDER INT,
  PRODUCT_CODE VARCHAR(50),
  FOREIGN KEY (ID_ORDER) REFERENCES ORDER_(ID),
  FOREIGN KEY (PRODUCT_CODE) REFERENCES PRODUCT(CODE),
  PRIMARY KEY (ID_ORDER, PRODUCT_CODE)
);

-- Creación de la tabla CANINE_RESIDENCE
CREATE TABLE CANINE_RESIDENCE (
  NAME VARCHAR(50) PRIMARY KEY,
  availability INT
);

-- Creación de la tabla PET_stay_RESIDENCE
CREATE TABLE PET_stay_RESIDENCE (
  CHIP_PET VARCHAR(50),
  name_residence VARCHAR(50),
  FOREIGN KEY (CHIP_PET) REFERENCES PET(CHIP),
  FOREIGN KEY (name_residence) REFERENCES CANINE_RESIDENCE(NAME),
  PRIMARY KEY (CHIP_PET)
);

-- Creación de la tabla DONATION
CREATE TABLE DONATION (
  ID INT PRIMARY KEY,
  NIE_USER VARCHAR(50),
  amount DECIMAL(10, 2),
  frequency VARCHAR(20),
  FOREIGN KEY (NIE_USER) REFERENCES USER(NIE)
);

-- Creación de la tabla VOLUNTEER
CREATE TABLE VOLUNTEER (
  ID_VOLUNTEER INT PRIMARY KEY,
  NIE_USER VARCHAR(50),
  FOREIGN KEY (NIE_USER) REFERENCES USER(NIE)
);

-- Creación de la tabla ADOPTER
CREATE TABLE ADOPTER (
  ID_VOLUNTEER INT,
  kind_housing VARCHAR(50),
  FOREIGN KEY (ID_VOLUNTEER) REFERENCES VOLUNTEER(ID_VOLUNTEER),
  PRIMARY KEY (ID_VOLUNTEER)
);

-- Creación de la tabla CLEANER
CREATE TABLE CLEANER (
  ID_VOLUNTEER INT,
  FOREIGN KEY (ID_VOLUNTEER) REFERENCES VOLUNTEER(ID_VOLUNTEER),
  PRIMARY KEY (ID_VOLUNTEER)
);

-- Insert
-- Inserciones en la tabla PET
INSERT INTO PET (CHIP, name, sex, birth_date)
VALUES
  ('chip1', 'Max', 'Male', '2020-01-01'),
  ('chip2', 'Bella', 'Female', '2019-05-10'),
  ('chip3', 'Charlie', 'Male', '2018-08-15'),
  ('chip4', 'Lucy', 'Female', '2021-02-28'),
  ('chip5', 'Cooper', 'Male', '2017-11-20');

-- Inserciones en la tabla USER
INSERT INTO USER (NIE, name, surname, phone, email, password, address)
VALUES
  ('nie1', 'John', 'Doe', '123456789', 'john@example.com', 'password123', '123 Main St'),
  ('nie2', 'Jane', 'Smith', '987654321', 'jane@example.com', 'secret456', '456 Elm St'),
  ('nie3', 'David', 'Johnson', '555555555', 'david@example.com', 'qwerty789', '789 Oak St'),
  ('nie4', 'Emily', 'Davis', '111222333', 'emily@example.com', 'letmein123', '321 Pine St'),
  ('nie5', 'Michael', 'Wilson', '999888777', 'michael@example.com', 'password789', '987 Cedar St');

-- Inserciones en la tabla USER_have_PET
INSERT INTO USER_have_PET (NIE_USER, CHIP_PET)
VALUES
  ('nie1', 'chip1'),
  ('nie2', 'chip2'),
  ('nie3', 'chip3'),
  ('nie4', 'chip4'),
  ('nie5', 'chip5');

-- Inserciones en la tabla CREDIT_CARD
INSERT INTO CREDIT_CARD (NIE_USER, NUMBER)
VALUES
  ('nie1', '1234567890123456'),
  ('nie2', '9876543210987654'),
  ('nie3', '5555555555555555'),
  ('nie4', '1111222233334444'),
  ('nie5', '9999888877776666');

-- Inserciones en la tabla MEMBERS
INSERT INTO MEMBERS (ID_MEMBER, NIE_USER, frequency, amount)
VALUES
  (1, 'nie1', 'Monthly', 50.00),
  (2, 'nie2', 'Annual', 200.00),
  (3, 'nie3', 'Monthly', 40.00),
  (4, 'nie4', 'Annual', 150.00),
  (5, 'nie5', 'Monthly', 30.00);

-- Inserciones en la tabla ADOPTION
INSERT INTO ADOPTION (CHIP_PET, name, price, date_of_death)
VALUES
  ('chip1', 'Max', 100.00, NULL),
  ('chip2', 'Bella', 150.00, NULL),
  ('chip3', 'Charlie', 75.00, NULL),
  ('chip4', 'Lucy', 120.00, '2022-04-15'),
  ('chip5', 'Cooper', 90.00, NULL);

-- Inserciones en la tabla ORDER
INSERT INTO ORDER_ (ID, NIE_USER, delivery_date, total_cost)
VALUES
  (1, 'nie1', '2023-05-20', 75.00),
  (2, 'nie2', '2023-05-22', 150.00),
  (3, 'nie3', '2023-05-23', 100.00),
  (4, 'nie4', '2023-05-21', 50.00),
  (5, 'nie5', '2023-05-25', 200.00);

-- Inserciones en la tabla PRODUCT
INSERT INTO PRODUCT (CODE, name, price, availability, size, color)
VALUES
  ('code1', 'Product 1', 10.00, 20, 'Small', 'Red'),
  ('code2', 'Product 2', 15.00, 10, 'Medium', 'Blue'),
  ('code3', 'Product 3', 20.00, 5, 'Large', 'Green'),
  ('code4', 'Product 4', 8.00, 15, 'Small', 'Yellow'),
  ('code5', 'Product 5', 12.00, 12, 'Medium', 'Black');
-- Inserciones en la tabla ORDER_PRODUCT
INSERT INTO ORDER_PRODUCT (ID_ORDER, PRODUCT_CODE)
VALUES
  (1, 'code1'),
  (1, 'code2'),
  (2, 'code3'),
  (3, 'code1'),
  (4, 'code4');

-- Inserciones en la tabla CANINE_RESIDENCE
INSERT INTO CANINE_RESIDENCE (NAME, availability)
VALUES
  ('Residence 1', 10),
  ('Residence 2', 5),
  ('Residence 3', 8),
  ('Residence 4', 12),
  ('Residence 5', 15);

-- Inserciones en la tabla PET_stay_RESIDENCE
INSERT INTO PET_stay_RESIDENCE (CHIP_PET, name_residence)
VALUES
  ('chip1', 'Residence 1'),
  ('chip2', 'Residence 2'),
  ('chip3', 'Residence 3'),
  ('chip4', 'Residence 4'),
  ('chip5', 'Residence 5');

-- Inserciones en la tabla DONATION
INSERT INTO DONATION (ID, NIE_USER, amount, frequency)
VALUES
  (1, 'nie1', 50.00, 'Monthly'),
  (2, 'nie2', 100.00, 'Annual'),
  (3, 'nie3', 25.00, 'Monthly'),
  (4, 'nie4', 75.00, 'Annual'),
  (5, 'nie5', 30.00, 'Monthly');

-- Inserciones en la tabla VOLUNTEER
INSERT INTO VOLUNTEER (ID_VOLUNTEER, NIE_USER)
VALUES
  (1, 'nie1'),
  (2, 'nie2'),
  (3, 'nie3'),
  (4, 'nie4'),
  (5, 'nie5');

-- Inserciones en la tabla ADOPTER
INSERT INTO ADOPTER (ID_VOLUNTEER, kind_housing)
VALUES
  (1, 'Apartment'),
  (2, 'House'),
  (3, 'Apartment');

-- Inserciones en la tabla CLEANER
INSERT INTO CLEANER (ID_VOLUNTEER)
VALUES
  (4),
  (5);
-- Vistas
CREATE VIEW Usuario_Mascota AS
SELECT U.name AS user_name, P.name AS pet_name
FROM USER U
INNER JOIN USER_have_PET UP ON U.NIE = UP.NIE_USER
INNER JOIN PET P ON UP.CHIP_PET = P.CHIP;


drop view Detalles_Adopcion;
CREATE VIEW Detalles_Adopcion AS
SELECT A.CHIP_PET, P.name AS pet_name, A.name AS adopter_name, A.price, A.date_of_death
FROM ADOPTION A
JOIN PET P ON A.CHIP_PET = P.CHIP
JOIN ADOPTER AD ON A.CHIP_PET = AD.ID_VOLUNTEER;

select * from Detalles_Adopcion;
