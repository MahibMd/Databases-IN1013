/*
Student name: Mahib Md              
Student ID: 240012145            
*/

/* SECTION 1 - CREATE TABLE STATEMENTS */

CREATE TABLE Customer (
    ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(15) NOT NULL,
    Surname VARCHAR(20) NOT NULL,
    FirstLineAddress VARCHAR(50) NOT NULL,
    SecondLineAddress VARCHAR(50) NULL,
    PostCode VARCHAR(15) NOT NULL,
    Email VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Rewards (
    PRIMARY KEY (ReferrerID, ReferredID),
    ReferrerID INTEGER NOT NULL,
    ReferredID INTEGER NOT NULL,
    Points INTEGER NOT NULL,
    DateAwarded DATE NOT NULL,
    FOREIGN KEY (ReferrerID) REFERENCES Customer(ID) ON DELETE CASCADE,
    FOREIGN KEY (ReferredID) REFERENCES Customer(ID) ON DELETE CASCADE,
    CHECK (ReferrerID <> ReferredID)
);

CREATE TABLE Brand (
    ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    BrandName VARCHAR(20) NOT NULL UNIQUE,
    Rating NUMERIC(3,2) NOT NULL
);

CREATE TABLE Items (
    ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    Series VARCHAR(20) NOT NULL,
    ModelName VARCHAR(30) NOT NULL,
    YearReleased YEAR NOT NULL,
    Category VARCHAR(20) NOT NULL,
    Colour VARCHAR(10) NULL,
    BrandID INTEGER NOT NULL, 
    Price NUMERIC(6, 2) NOT NULL,
    FOREIGN KEY (BrandID) REFERENCES Brand(ID) ON DELETE CASCADE
);

CREATE TABLE Orders (
    Number INTEGER PRIMARY KEY AUTO_INCREMENT,
    OrderDate DATE NOT NULL,
    OrderType ENUM("In Store", "Online") NOT NULL,
    OrderStatus ENUM("Processing", "Shipped", "Delivered", "Cancelled") NOT NULL,
    Total NUMERIC(8, 2) NOT NULL,
	CustomerID INTEGER NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(ID)
);

CREATE TABLE OrderItems (
    OrderNumber INTEGER NOT NULL,
    ItemID INTEGER NOT NULL,
    NumberOfItems INTEGER NOT NULL,
    PRIMARY KEY (OrderNumber, ItemID),
    FOREIGN KEY (OrderNumber) REFERENCES Orders(Number) ON DELETE CASCADE,
    FOREIGN KEY (ItemID) REFERENCES Items(ID) ON DELETE CASCADE,
    CHECK (NumberOfItems > 0)
);


/* SECTION 2 - INSERT STATEMENTS */

INSERT INTO Customer (Name, Surname, FirstLineAddress, SecondLineAddress, PostCode, Email) VALUES
("Jacob", "Brown", "Flat 4", "12 Maine Street", "W1 1GA", "jacobbrown12@gmail.com"),
("Suhaan", "Rahman", "16 Hay Street", NULL, "IG1 1AB", "suhaanrahmanx@gmail.com"),
("Zara", "Akter", "16 Hay Street", NULL, "IG1 1AB", "zara.akter@gmail.com"),
("Emily", "Davis", "Apartment 202", "15 Elm Grove", "E21 H28", "emily.davis14@gmail.com"),
("Chris", "Brown", "Unit 10D", "42 Maple Close", "E1 1PR", "chrisbrown_0@yahoo.com"),
("Sarah", "Wilson", "8 Birch Street", NULL, "S11 1AA", "sarah.wilson@yahoo.com"),
("Simon", "Ryan", "Floor 3", "5 Cheddar Park", "N11 HU0", "simon.ryan@gmail.com"),
("Raihan", "Walker", "26 Spruce Lane", NULL, "S10 1HA", "raihan.walker@gmail.com"),
("James", "Harris", "Apartment 404", "69 Fir Drive", "NE1 1GB", "james.harris@gmail.com"),
("Olivia", "Martinez", "Unit 5", "4 Oakwood Way", "N1 1PU", "olivia.martinez@yahoo.com"),
("Sophia", "Gonzalez", "17 Birchwood Avenue", NULL, "W1 1KP", "sophia.gonzalez@gmail.com"),
("Liam", "Rodriguez", "86 Pinecroft Road", NULL, "N1 1GK", "liam.rodriguez@gmail.com"),
("Isabella", "King", "Flat 10B", "9 Maplewood Drive", "E1 5GP", "isabella.king@gmail.com"),
("Ethan", "Scott", "51 Willow Grove", NULL, "E1 13FW", "ethan.scott@gmail.com"),
("Samadul", "Koe", "Flat 2", "23 Benjonson Street", "W1 1FT", "Samadul.koe@gmail.com");

INSERT INTO Rewards (ReferrerID, ReferredID, Points, DateAwarded) VALUES
(1, 2, 250, "2024-01-15"),
(3, 4, 570, "2024-02-09"),
(1, 5, 125, "2024-02-26"),
(2, 6, 160, "2024-03-10"),
(6, 8, 360, "2024-05-22"),
(7, 9, 630, "2024-06-13"),
(9, 10, 150, "2024-06-18"),
(3, 11, 270, "2024-08-03"),
(6, 12, 200, "2024-09-25"),
(6, 15, 600, "2024-11-14");

INSERT INTO Brand (BrandName, Rating) VALUES
("Intel", 3.7),
("AMD", 4.5),
("Nvidia", 3.9),
("Corsair", 4.3),
("Samsung", 4.5),
("Asus", 4.2),
("NZXT", 4.0),
("MSI", 3.9),
("Crucial", 4.0),
("Logitech", 4.6),
("Seagate", 3.4),
("Razer", 4.2);

INSERT INTO Items (Series, ModelName, YearReleased, Category, Colour, BrandID, Price) VALUES
("Ryzen 7", "9800X3D", 2024, "CPU", NULL, 2, 529.99), -- 1
("RTX", "4070Ti", 2023, "GPU", "Black", 3, 899.99), -- 2
("Vengeance", "32GB DDR4", 2022, "RAM", "Black", 4, 149.99), -- 3
("Strix", "Z690", 2023, "Motherboard", "White", 6, 359.99), -- 4
("EVO", "970 Plus 2TB", 2021, "SSD", "Black", 5, 120.00), -- 5
("RM", "750x 80 PLUS", 2022, "Power Supply", "Black", 4, 95.00), -- 6
("H", "510", 2022, "PC Case", "Grey", 7, 90.00), -- 7
("Strix", "OLED XG27AQDMG", 2024, "Monitor", "Black", 6, 569.99), -- 8
("Radeon", "RX 7900 XT", 2022, "GPU", "Red", 2, 629.99), -- 9
("Core", "i5 12400", 2022, "CPU", NULL, 1, 149.99), -- 10
("Ryzen 7", "7800X3D", 2023, "CPU", NULL, 2, 449.99), -- 11
("Odyssey", "G5 LS27DG502EUXXU", 2023, "Monitor", "Black", 5, 249.99), -- 12
("MAG", "B550 TOMAHAWK", 2020, "Motherboard", "Black", 8, 124.99), -- 13
("ARC", "B580", 2024, "GPU", "Blue", 1, 249.99), -- 14
("RTX", "3060", 2020, "GPU", "White", 3, 359.99), -- 15
("G", "502 Hero", 2018, "Mouse", "Red", 10, 74.99), -- 16
("Blackwidow", "V4", 2022, "Keyboard", "Black", 12, 129.99), -- 17
("Viper", "V3 Pro", 2023, "Mouse", "Green", 12, 159.99); -- 18

INSERT INTO Orders (OrderDate, OrderType, OrderStatus, Total, CustomerID) VALUES
('2024-01-05', 'Online', 'Shipped', 1949.97, 1), -- Order 1
('2024-01-11', 'In Store', 'Delivered', 215.00, 2), -- Order 2
('2024-02-03', 'Online', 'Processing', 1259.98, 3), -- Order 3
('2024-02-07', 'Online', 'Delivered', 569.99, 4), -- Order 4
('2024-02-21', 'In Store', 'Shipped', 274.98, 5), -- Order 5
('2024-03-06', 'Online', 'Cancelled', 159.99, 6), -- Order 6	
('2024-03-29', 'In Store', 'Shipped', 90.00, 5), -- Order 7
('2024-04-18', 'Online', 'Shipped', 569.99, 1), -- Order 8
('2024-05-20', 'Online', 'Delivered', 449.99, 8), -- Order 9
('2024-06-10', 'In Store', 'Delivered', 149.99, 9), -- Order 10
('2024-06-15', 'Online', 'Shipped', 249.99, 10), -- Order 11
('2024-07-27', 'Online', 'Shipped', 359.99, 11), -- Order 12 
('2024-09-14', 'In Store', 'Delivered', 95.00, 12), -- Order 13
('2024-08-10', 'Online', 'Processing', 899.99, 6), -- Order 14
('2024-09-20', 'In Store', 'Cancelled', 359.99, 14), -- Order 15
('2024-11-03', 'Online', 'Shipped', 569.99, 15), -- Order 16
('2024-12-08', 'In Store', 'Delivered', 74.99, 4); -- Order 17

INSERT INTO OrderItems (OrderNumber, ItemID, NumberOfItems) VALUES
(1, 2, 2),    -- Order 1: "RTX 4070Ti" x2
(1, 3, 1),    -- Order 1: "Vengeance 32GB DDR4" x1
(2, 5, 1),    -- Order 2: "EVO 970 Plus 2TB" x1
(2, 6, 1),    -- Order 2: "RM 750x 80 PLUS" x1
(3, 9, 2),    -- Order 3: "Radeon RX 7900 XT" x2
(4, 8, 1),    -- Order 4: "Strix OLED XG27AQDMG" x1
(5, 10, 1),   -- Order 5: "Core i5 12400" x1
(5, 13, 1),   -- Order 5: "MAG B550 Tomahawk" x1
(6, 12, 1),   -- Order 6: "Viper V3 Pro" x1
(7, 7, 1),    -- Order 7: "H 510" x1
(8, 8, 1),    -- Order 8: "Strix OLED XG27AQDMG" x1
(9, 11, 1),   -- Order 8: "Ryzen 7 7800X3D" x1
(10, 10, 1),  -- Order 9: "Core i5 12400" x1
(11, 12, 1),  -- Order 10: "Odyssey G5 LS27DG502EUXXU" x1
(12, 4, 1),   -- Order 11: "Strix Z690" x1
(13, 6, 1),   -- Order 12: "RM 750x 80 PLUS" x1
(14, 2, 1),   -- Order 13: "RTX 4070Ti" x1
(15, 15, 1),  -- Order 14: RTX 3060 x1
(16, 8, 1),   -- Order 15: Strix OLED XG27AQDMG x1
(17, 16, 1);  -- Order 17: G502 Hero x1
                     
/* SECTION 3 - UPDATE STATEMENTS - The queries must be explained in natural (English) language first, and then followed up by respective statements */

/* 1) Updates the brand rating of Intel to 3.9 */
UPDATE Brand
SET Rating = 3.9
WHERE BrandName = "Intel";

/* 2) Increases the price by 10%, for the categories of items that have been sold more than two times across all orders */
UPDATE Items
SET Price = Price * 1.10
WHERE Category IN (
    SELECT Category
    FROM (
        SELECT Items.Category
        FROM Items
        JOIN OrderItems ON Items.ID = OrderItems.ItemID
        JOIN Orders ON OrderItems.OrderNumber = Orders.Number
        GROUP BY Items.Category
        HAVING SUM(OrderItems.NumberOfItems) > 2
    ) AS MostSoldCategories
);

/* SECTION 4 - SELECT STATEMENTS - The queries must be explained in natural (English) language first, and then followed up by respective SELECTs*/


/* 1) Lists the name, surname, number of items ordered, categories, and the total spent. For the top five customers who have ordered the most items in descending order */
select '1)' AS '';

SELECT Customer.Name AS "Customer Name", Customer.Surname AS "Customer Surname", SUM(OrderItems.NumberOfItems) AS "Total Items Ordered", GROUP_CONCAT(Items.Category) AS "Ordered Items", SUM(Orders.Total) AS Total
FROM Customer
JOIN Orders ON Customer.ID = Orders.CustomerID
JOIN OrderItems ON Orders.Number = OrderItems.OrderNumber
JOIN Items ON OrderItems.ItemID = Items.ID
GROUP BY Customer.ID
ORDER BY SUM(OrderItems.NumberOfItems) DESC
LIMIT 5;



/* 2) Lists the name, surname and total reward points for the top three customers with the most reward points in descending order. */
select '2)' AS '';

SELECT Customer.Name AS "Name", Customer.Surname AS "Surname", SUM(Rewards.Points) AS "Total Points"
FROM Rewards
JOIN Customer ON Customer.ID = Rewards.ReferrerID
GROUP BY Customer.ID
ORDER BY SUM(Rewards.Points) DESC
LIMIT 3;



/* 3) Lists the name, surname and the total amount of items ordered for customers who have the surname beginning with the letter "R" */
select '3)' AS '';

SELECT Customer.Name As "Name", Customer.Surname AS "Surname", SUM(OrderItems.NumberOfItems) AS "Number of Items Ordered"
FROM OrderItems
JOIN Orders ON Orders.Number = OrderItems.OrderNumber
JOIN Customer ON Customer.ID = Orders.CustomerID
WHERE Customer.Surname LIKE "R%" 
GROUP BY Customer.ID;


/* 4) Lists the series, model name, categories of the items ordered and the number of times each item without colour has been ordered across all orders. In descending price order */
select '4)' AS '';

SELECT Items.Series, Items.ModelName, Items.Category, Items.Price, SUM(OrderItems.NumberOfItems) AS "Number of Times Ordered"
FROM Items
JOIN OrderItems ON Items.ID = OrderItems.ItemID
WHERE Items.Colour IS NULL
GROUP BY Items.ID
ORDER BY Price DESC;


/* 5) Lists the name, surname and total spent for the customers who have spent more than £1000 */
select '5)' AS '';

SELECT Customer.Name AS "Name", Customer.Surname AS "Surname", SUM(Orders.Total) AS "Total"
FROM Orders
JOIN Customer ON Customer.ID = Orders.CustomerID
JOIN OrderItems ON Orders.Number = OrderItems.OrderNumber
GROUP BY Customer.ID
HAVING SUM(Orders.Total) > 1000;


/* Lists the name, surname, and order type of customers who made an online order, and combines this list with the list of names, surnames, and order types of customers who made an in-store order */
select '6)' AS '';

SELECT Customer.Name AS "Name", Customer.Surname AS "Surname", Orders.OrderType AS "Order Type"
FROM Orders
JOIN Customer ON Customer.ID = Orders.CustomerID
WHERE Orders.OrderType = "Online"
UNION
SELECT Customer.Name AS "Name", Customer.Surname AS "Surname", Orders.OrderType AS "Order Type"
FROM Orders
JOIN Customer ON Customer.ID = Orders.CustomerID
WHERE Orders.OrderType = "In Store";



/* 7) Lists the name, surname and email of customers who have not made any orders */
select '7)' AS '';

SELECT Customer.Name, Customer.Surname, Customer.Email
FROM Customer
WHERE NOT EXISTS (
	SELECT 1
    FROM Orders
    WHERE Orders.CustomerID = Customer.ID
);



/* 8) Lists the top three most popular categories and the number of items that have been ordered from each category across all orders. In descending order of the total amount of items ordered */
select '8)' AS '';

SELECT Category AS "Most Popular Category", TotalItemsOrdered AS "Total Items Ordered"
FROM (SELECT Items.Category, SUM(OrderItems.NumberOfItems) AS TotalItemsOrdered
      FROM Items
      JOIN OrderItems ON Items.ID = OrderItems.ItemID
      GROUP BY Items.Category
) AS CategoryTotals
ORDER BY TotalItemsOrdered DESC
LIMIT 3;


/* SECTION 5 - DELETE ROWS - The queries must be explained in natural (English) language first, and then followed up by respective statements */

/* 1) Deletes records for customers who have not made any orders*/
DELETE 
FROM Customer
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders
    WHERE Orders.CustomerID = Customer.ID
);



/* 2) Deletes the brand Seagate */
DELETE
FROM Brand
WHERE BrandName = "Seagate";


/* SECTION 6 - DROP TABLES */
DROP TABLE Rewards;
DROP TABLE OrderItems;
DROP TABLE Items;
DROP TABLE Orders;
DROP TABLE Brand;
DROP TABLE Customer;

SHOW TABLES;
