CREATE TABLE ARTISTS (
    Artist_ID INT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Nationality VARCHAR (50),
    Email VARCHAR(100) UNIQUE
);

CREATE TABLE EXHIBITIONS (
    Exhibition_ID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(150) NOT NULL,
    Start_Date DATE,
    End_Date DATE,
    Location VARCHAR(150)
);

CREATE TABLE ARTWORKS (
    Artwork_ID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(150) NOT NULL,
    Medium VARCHAR(100),
    Year_Created INT,
    Price DECIMAL(10,2),
    Status VARCHAR(30) DEFAULT 'Available',
    Artist_ID INT NOT NULL,
    Exhibition_ID INT NULL,
    FOREIGN KEY (Artist_ID) REFERENCES ARTISTS(Artist_ID),
    FOREIGN KEY (Exhibition_ID) REFERENCES EXHIBITIONS(Exhibition_ID)
);

CREATE TABLE CUSTOMERS (
    Customer_ID INT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20),
    Address VARCHAR(150)
);

  CREATE TABLE SALES (
    Sale_ID INT PRIMARY KEY AUTO_INCREMENT,
    Sale_Date DATE NOT NULL,
    Sale_Price DECIMAL(10,2) NOT NULL,
    Artwork_ID INT NOT NULL,
    Customer_ID INT NOT NULL,
    FOREIGN KEY (Artwork_ID) REFERENCES ARTWORKS(Artwork_ID),
    FOREIGN KEY (Customer_ID) REFERENCES CUSTOMERS(Customer_ID)
);

CREATE TABLE PAINTINGS (
    Artwork_ID INT PRIMARY KEY,
    Paint_Type VARCHAR(50),
    Surface VARCHAR(50),
    FOREIGN KEY (Artwork_ID) REFERENCES ARTWORKS(Artwork_ID)
);

CREATE TABLE SCULPTURES (
    Artwork_ID INT PRIMARY KEY,
    Material VARCHAR(100),
    Weight_Kg DECIMAL(8,2),
    FOREIGN KEY (Artwork_ID) REFERENCES ARTWORKS(Artwork_ID)
);

-- DATA
INSERT INTO ARTISTS (Artist_ID, First_Name, Last_Name, Nationality, Email) VALUES
(101, 'Maria', 'Garcia', 'American', 'maria.garcia@gmail.com'),
(102, 'James', 'Park', 'French', 'james.park@gmail.com'),
(103, 'Sam', 'Martinez', 'American', 'sam.martinez@gmail.com'),
(104, 'Elena', 'Rossi', 'Italian', 'elena.rossi@gmail.com'),
(105, 'Kenji', 'Tanaka', 'Japanese', 'kenji.tanaka@gmail.com'),
(106, 'Mark', 'Grayson', 'Korean', 'mark.grayson@gmail.com'),
(107, 'Marcello', 'Silva', 'Brazilian', 'marcello.silva@gmail.com'),
(108, 'Sofia', 'Hernandez', 'Mexican', 'sofia.hernandez@gmail.com'),
(109, 'Catalina', 'Harris', 'British', 'catalina.harris@gmail.com'),
(110, 'Scott', 'McCall', 'American', 'scott.mccall@gmail.com');
    
--Values for Exhibitions
INSERT INTO EXHIBITIONS (Title, Start_Date, End_Date, Location)
VALUES (1, 'Spring Showcase', '01-10-2026', '03-15-2026', 'East Wing');
       (2, 'Fall Showcase', '04-20-2026', '06-23-2026', 'Main Gallery');
       (3, 'Fall Showcase', '08-26-2026', '10-05-2026', 'Main Gallery');
       (4, 'Autumn Showcase', '03-15-2026', '04-23-2026', 'West Wing');
       (5, 'Fall Showcase', '06-24-2026', '09-18-2026', 'Main Gallery');
       (6, 'Spring Showcase', '10-04-2026', '12-15-2026', 'West Wing');

--Values for Customers
INSERT INTO CUSTOMERS (Customer_ID, First_Name, Last_Name, Email, Phone, Address)
  VALUES (001, 'Jax', 'Cruz', 'jax@gmail.com', '361-733-9484', '4111 Lydon St, PA'),
         (002, 'Ana', 'Scott', 'ana@gmail.com', '460-378-4893', '1492 Hickman St, TX'),
         (003, 'Maria', 'Langford', 'marialangford@gmail.com', '460-489-3843', '2381 Jonny Lane, WI'),
         (004, 'Emily', 'Johnson', 'emily.johnson93@gmail.com', '361-555-3279', '1462 Ocean Dr, TX'),
         (005, 'Riley', 'Mitchell', 'mitchellR31@gmail.com', '956-614-7421', '615 Dody St, WA'),
         (006, 'Jeffery', 'Davis', 'jdavis89@icloud.com', '210-875-9910', '8321 Lake Dr, KY'),
         (007, 'Donald', 'Jackson', 'donald.jackson@yahoo.com', '210-987-5816', '1738 Bronson St, AZ'),
         (008, 'Anthony', 'Rios', 'anthonyrios080@icloud.com', '956-782-2310', '569 Dolly St, OK'),
         (009, 'Chris', 'Bing', 'bingbing@icloud.com', '210-654-8973', '3279 Olive St, OR'),
         (010, 'Selena', 'Vela', 'selenaforever@yahoo.com', '361-967-1541', '410 Dangle Rd, MD'),
         (011, 'Angela', 'Tyson', 'twilight17@gmail.com', '956-841-6321', '1600 Little Av, WA'),
         (012, 'Crystal', 'Reyna', 'crystalLight901@yahoo.com', '460-955-4723', '2591 Windy St, MA');
