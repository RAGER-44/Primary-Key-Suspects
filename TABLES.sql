CREATE DATABASE art_gallery;
USE art_gallery;

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
    Start_Date DATE NOT NULL,
    End_Date DATE NOT NULL,
    Location VARCHAR(150) NOT NULL
);

CREATE TABLE ARTWORKS (
    Artwork_ID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(150) NOT NULL,
    Medium VARCHAR(20) NOT NULL,
    Year_Created INT,
    Price DECIMAL(10,2) NOT NULL,
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
    Artwork_ID INT NOT NULL UNIQUE,
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

-- Values for Artists
INSERT INTO ARTISTS (Artist_ID, First_Name, Last_Name, Nationality, Email) 
VALUES (101, 'Maria', 'Garcia', 'American', 'maria.garcia@gmail.com'),
       (102, 'James', 'Park', 'French', 'james.park@gmail.com'),
       (103, 'Sam', 'Martinez', 'American', 'sam.martinez@gmail.com'),
       (104, 'Elena', 'Rossi', 'Italian', 'elena.rossi@gmail.com'),
       (105, 'Hanzo', 'Hasashi', 'Japanese', 'kenji.tanaka@gmail.com'),
       (106, 'Mark', 'Grayson', 'Korean', 'mark.grayson@gmail.com'),
       (107, 'Marcello', 'Silva', 'Brazilian', 'marcello.silva@gmail.com'),
       (108, 'Sofia', 'Hernandez', 'Mexican', 'sofia.hernandez@gmail.com'),
       (109, 'Catalina', 'Harris', 'British', 'catalina.harris@gmail.com'),
       (110, 'Scott', 'McCall', 'American', 'scott.mccall@gmail.com');
    
-- Values for Exhibitions
INSERT INTO EXHIBITIONS (Title, Start_Date, End_Date, Location)
VALUES (1, 'Spring Showcase', '01-10-2026', '03-15-2026', 'East Wing');
       (2, 'Fall Showcase', '04-20-2026', '06-23-2026', 'Main Gallery');
       (3, 'Fall Showcase', '08-26-2026', '10-05-2026', 'Main Gallery');
       (4, 'Autumn Showcase', '03-15-2026', '04-23-2026', 'West Wing');
       (5, 'Fall Showcase', '06-24-2026', '09-18-2026', 'Main Gallery');
       (6, 'Spring Showcase', '10-04-2026', '12-15-2026', 'West Wing');

-- Values for Customers
INSERT INTO CUSTOMERS (Customer_ID, First_Name, Last_Name, Email, Phone, Address)
VALUES (001, 'Jax', 'Cruz', 'jax@gmail.com', '361-733-9484', '4111 Lydon St, Scranton, PA'),
       (002, 'Ana', 'Scott', 'ana@gmail.com', '460-378-4893', '1492 Hickman St, Lubbock, TX'),
       (003, 'Maria', 'Langford', 'marialangford@gmail.com', '460-489-3843', '2381 Jonny Lane, Appleton, WI'),
       (004, 'Emily', 'Johnson', 'emily.johnson93@gmail.com', '361-555-3279', '1462 Ocean Dr, Corpus Christi, TX'),
       (005, 'Riley', 'Mitchell', 'mitchellR31@gmail.com', '956-614-7421', '615 Dody St, Spokane, WA'),
       (006, 'Jeffery', 'Davis', 'jdavis89@icloud.com', '210-875-9910', '8321 Lake Dr, Frankfort, KY'),
       (007, 'Donald', 'Jackson', 'donald.jackson@yahoo.com', '210-987-5816', '1738 Bronson St, Yuma, AZ'),
       (008, 'Anthony', 'Rios', 'anthonyrios080@icloud.com', '956-782-2310', '569 Dolly St, Lawton, OK'),
       (009, 'Chris', 'Bing', 'bingbing@icloud.com', '210-654-8973', '3279 Olive St, Bend, OR'),
       (010, 'Selena', 'Vela', 'selenaforever@yahoo.com', '361-967-1541', '410 Dangle Rd, Salisbury, MD'),
       (011, 'Angela', 'Tyson', 'twilight17@gmail.com', '956-841-6321', '1600 Little Av, Tacoma, WA'),
       (012, 'Crystal', 'Reyna', 'crystalLight901@yahoo.com', '460-955-4723', '2591 Windy St, Plymouth, MA');

-- Values for Artworks
INSERT INTO ARTWORKS (Artwork_ID, Title, Medium, Year_Created, Price, Status, Artist_ID, Exhibition_ID) 
VALUES (1001, 'Blue Dusk', 'Painting', 2018, 800, 'On Display', 101, 1),
       (1002, 'Quiet Field', 'Painting', 2019, 1170, 'Available', 104, NULL),
       (1003, 'Iron Tide', 'Painting', 2020, 1550, 'On Display', 107, 3),
       (1004, 'Amber Hours', 'Sculpture', 2021, 1930, 'Available', 110, NULL),
       (1005, 'Salt Wind', 'Sculpture', 2022, 2300, 'Available', 103, 2),
       (1006, 'Harbor Light', 'Painting', 2023, 2680, 'On Display', 106, 6),
       (1007, 'Paper Moon', 'Painting', 2024, 3060, 'Available', 109, NULL),
       (1008, 'Desert Bloom', 'Painting', 2025, 3430, 'Available', 102, NULL),
       (1009, 'Still Water', 'Sculpture', 2026, 3810, 'On Display', 105, 3),
       (1010, 'Red Horizon', 'Sculpture', 2018, 4190, 'Available', 108, NULL),
       (1011, 'Echo Chamber', 'Painting', 2019, 4570, 'On Display', 101, 5),
       (1012, 'Morning Fog', 'Painting', 2020, 4940, 'Available', 104, NULL),
       (1013, 'Copper Wave', 'Painting', 2021, 1120, 'On Display', 107, 1),
       (1014, 'Night Garden', 'Sculpture', 2022, 1500, 'Available', 110, NULL),
       (1015, 'Open Window', 'Sculpture', 2023, 1870, 'Available', 103, 3),
       (1016, 'Falling Light', 'Painting', 2024, 2250, 'On Display', 106, 4),
       (1017, 'Stone Memory', 'Painting', 2025, 2630, 'Available', 109, NULL),
       (1018, 'Silver Rain', 'Painting', 2026, 3000, 'Available', 102, NULL),
       (1019, 'Winter Orchard', 'Sculpture', 2018, 3380, 'On Display', 105, 1),
       (1020, 'Burnt Sand', 'Sculpture', 2019, 3760, 'Available', 108, NULL),
       (1021, 'The Long Road', 'Painting', 2020, 4140, 'On Display', 101, 3),
       (1022, 'Green Moss', 'Painting', 2021, 4510, 'Available', 104, NULL),
       (1023, 'Tidal Form', 'Painting', 2022, 4890, 'On Display', 107, 5),
       (1024, 'Fractured Sky', 'Sculpture', 2023, 1070, 'Available', 110, NULL),
       (1025, 'Weight of Air', 'Sculpture', 2024, 1440, 'Available', 103, 1),
       (1026, 'Marigold', 'Painting', 2025, 1820, 'On Display', 106, 2),
       (1027, 'Slow Current', 'Painting', 2026, 2200, 'Available', 109, NULL),
       (1028, 'Ash and Ivory', 'Painting', 2018, 2570, 'Available', 102, NULL),
       (1029, 'Lantern Row', 'Sculpture', 2019, 2950, 'On Display', 105, 5),
       (1030, 'Dry Creek', 'Sculpture', 2020, 3330, 'Available', 108, NULL),
       (1031, 'Folded Time', 'Painting', 2021, 3710, 'On Display', 101, 1),
       (1032, 'Coral Study', 'Painting', 2022, 4080, 'Available', 104, NULL),
       (1033, 'Midday Heat', 'Painting', 2023, 4460, 'On Display', 107, 3),
       (1034, 'Crescent', 'Sculpture', 2024, 4840, 'Available', 110, NULL),
       (1035, 'Hollow Tree', 'Sculpture', 2025, 1010, 'Available', 103, 2),
       (1036, 'Backyard Sun', 'Painting', 2026, 1390, 'On Display', 106, 6),
       (1037, 'Granite Dream', 'Painting', 2018, 1770, 'Available', 109, NULL),
       (1038, 'Low Tide', 'Painting', 2019, 2140, 'Available', 102, NULL),
       (1039, 'Violet Hour', 'Sculpture', 2020, 2520, 'On Display', 105, 3),
       (1040, 'Rust Belt', 'Sculpture', 2021, 2900, 'Available', 108, NULL),
       (1041, 'Wandering Line', 'Painting', 2022, 3280, 'On Display', 101, 5),
       (1042, 'Gulf Breeze', 'Painting', 2023, 3650, 'Available', 104, NULL),
       (1043, 'Thread and Bone', 'Painting', 2024, 4030, 'On Display', 107, 1),
       (1044, 'North Light', 'Sculpture', 2025, 4410, 'Available', 110, NULL),
       (1045, 'Cactus Flower', 'Sculpture', 2026, 4780, 'Available', 103, 3),
       (1046, 'Glass Garden', 'Painting', 2018, 960, 'On Display', 106, 4),
       (1047, 'Moth Wing', 'Painting', 2019, 1340, 'Available', 109, NULL),
       (1048, 'Dune Song', 'Painting', 2020, 1710, 'Available', 102, NULL),
       (1049, 'Quiet Harbor', 'Sculpture', 2021, 2090, 'On Display', 105, 1),
       (1050, 'Ember', 'Sculpture', 2022, 2470, 'Available', 108, NULL);

-- Paintings
INSERT INTO PAINTINGS (Artwork_ID, Paint_Type, Surface) 
VALUES (1001, 'Oil', 'Canvas'),
       (1002, 'Acrylic', 'Paper'),
       (1003, 'Watercolor', 'Wood Panel'),
       (1006, 'Oil', 'Paper'),
       (1007, 'Acrylic', 'Wood Panel'),
       (1008, 'Watercolor', 'Linen'),
       (1011, 'Oil', 'Wood Panel'),
       (1012, 'Acrylic', 'Linen'),
       (1013, 'Watercolor', 'Canvas'),
       (1016, 'Oil', 'Linen'),
       (1017, 'Acrylic', 'Canvas'),
       (1018, 'Watercolor', 'Paper'),
       (1021, 'Oil', 'Canvas'),
       (1022, 'Acrylic', 'Paper'),
       (1023, 'Watercolor', 'Wood Panel'),
       (1026, 'Oil', 'Paper'),
       (1027, 'Acrylic', 'Wood Panel'),
       (1028, 'Watercolor', 'Linen'),
       (1031, 'Oil', 'Wood Panel'),
       (1032, 'Acrylic', 'Linen'),
       (1033, 'Watercolor', 'Canvas'),
       (1036, 'Oil', 'Linen'),
       (1037, 'Acrylic', 'Canvas'),
       (1038, 'Watercolor', 'Paper'),
       (1041, 'Oil', 'Canvas'),
       (1042, 'Acrylic', 'Paper'),
       (1043, 'Watercolor', 'Wood Panel'),
       (1046, 'Oil', 'Paper'),
       (1047, 'Acrylic', 'Wood Panel'),
       (1048, 'Watercolor', 'Linen');

-- Sculptures
INSERT INTO SCULPTURES (Artwork_ID, Material, Weight_Kg) 
VALUES (1004, 'Clay', 12.1),
       (1005, 'Wood', 14.8),
       (1009, 'Steel', 25.6),
       (1010, 'Clay', 28.3),
       (1014, 'Marble', 39.1),
       (1015, 'Steel', 41.8),
       (1019, 'Bronze', 52.6),
       (1020, 'Marble', 55.3),
       (1024, 'Glass', 6.1),
       (1025, 'Bronze', 8.8),
       (1029, 'Wood', 19.6),
       (1030, 'Glass', 22.3),
       (1034, 'Clay', 33.1),
       (1035, 'Wood', 35.8),
       (1039, 'Steel', 46.6),
       (1040, 'Clay', 49.3),
       (1044, 'Marble', 60.1),
       (1045, 'Steel', 62.8),
       (1049, 'Bronze', 13.6),
       (1050, 'Marble', 16.3);

-- Values for Sales
INSERT INTO SALES (Sale_ID, Sale_Date, Sale_Price, Artwork_ID, Customer_ID)
VALUES (111, '2026-02-15', 1230.00, , 009),
       (112, '2026-03-01', 4200.00, , 007),
       (113, '2026-05-13', 3000.00, , 005),
       (114, '2026-06-01', 1800.00, , 012),
       (115, '2026-08-30', 2750.00, , 001),
       (116, '2026-09-25', 3600.00, , 010),
       (117, '2026-09-15', 4250.00, , 008),
       (118, '2026-03-20', 2100.00, , 006),
       (119, '2026-04-10', 5000.00, , 004),
       (120, '2026-07-02', 1950.00, , 011),
       (121, '2026-08-15', 2800.00, , 002),
       (122, '2026-01-20', 3400.00, , 003),
       (123, '2026-02-14', 2500.00, , 010),
       (124, '2026-11-02', 3200.00, , 004),
       (125, '2026-10-25', 1500.00, , 009);

-- QUERIES
-- join sale with artwork, artist and buyer
SELECT 
    SALES.Sale_ID              AS Sale_ID,  
    SALES.Sale_Date            AS Sale_Date,
    SALES.Sale_Price           AS Sale_Price,
    SALES.Artwork_ID           AS Sale_Artwork_ID,
    SALES.Customer_ID          AS Sale_Customer_ID,

    ARTWORKS.Artwork_ID        AS Artwork_ID,
    ARTWORKS.Title             AS Artwork_Title,
    ARTWORKS.Medium            AS Artwork_Medium,
    ARTWORKS.Year_Created      AS Artwork_Year_Created,
    ARTWORKS.Price             AS Artwork_List_Price,
    ARTWORKS.Status            AS Artwork_Status,
    ARTWORKS.Artist_ID         AS Artwork_Artist_ID,
    ARTWORKS.Exhibition_ID     AS Artwork_Exhibition_ID,

    ARTISTS.Artist_ID          AS Artist_ID,
    ARTISTS.First_Name         AS Artist_First_Name,
    ARTISTS.Last_Name          AS Artist_Last_Name,
    ARTISTS.Nationality        AS Artist_Nationality,
    ARTISTS.Email              AS Artist_Email,

    CUSTOMERS.Customer_ID      AS Customer_ID,
    CUSTOMERS.First_Name       AS Customer_First_Name,
    CUSTOMERS.Last_Name        AS Customer_Last_Name,
    CUSTOMERS.Email            AS Customer_Email,
    CUSTOMERS.Phone            AS Customer_Phone,
    CUSTOMERS.Address          AS Customer_Address,

    EXHIBITIONS.Exhibition_ID  AS Exhibition_ID,
    EXHIBITIONS.Title          AS Exhibition_Title,
    EXHIBITIONS.Start_Date     AS Exhibition_Start_Date,
    EXHIBITIONS.End_Date       AS Exhibition_End_Date,
    EXHIBITIONS.Location       AS Exhibition_Location,

    PAINTINGS.Artwork_ID       AS PAINTINGS_Artwork_ID,
    PAINTINGS.Paint_Type       AS PAINTINGS_Paint_Type,
    PAINTINGS.Surface          AS PAINTINGS_Surface,

    SCULPTURES.Artwork_ID      AS SCULPTURES_Artwork_ID,
    SCULPTURES.Material        AS SCULPTURES_Material,
    SCULPTURES.Weight_Kg       AS SCULPTURES_Weight_Kg
    FROM SALES 
    JOIN ARTWORKS              ON SALES.Artwork_ID = ARTWORKS.Artwork_ID
    JOIN ARTISTS               ON ARTWORKS.Artists_ID = ARTISTS.Artist_ID
    JOIN CUSTOMERS             ON SALES.Customer_ID = CUSTOMERS.Customer_ID
    LEFT JOIN EXHIBITIONS      ON ARTWORKS.Exhibition_ID = EXHIBITION.Exhibition_ID
    LEFT JOIN PAINTINGS        ON ARTWORKS.Artwork_ID = PAINTINGS.Artwork_ID
    LEFT JOIN SCULPTURES       ON ARTWORKS.Artwork_ID = SCULPTURES.Artwork_ID;

--query where we can show availble artworks or maybe most expensive art works first?
-- we can use orderby
