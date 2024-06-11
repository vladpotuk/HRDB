-- Створення бази даних HRDB
CREATE DATABASE HRDB;
GO

-- Використання бази даних HRDB
USE HRDB;
GO

-- Створення таблиці HR
CREATE TABLE [HR] (
    HRId INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    Phone NVARCHAR(15)
);
GO

-- Створення таблиці User
CREATE TABLE [User] (
    UserId INT PRIMARY KEY IDENTITY,
    Username NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    Password NVARCHAR(255) NOT NULL
);
GO

-- Створення таблиці HRUser для зв'язку HR та User
CREATE TABLE [HRUser] (
    HRId INT NOT NULL,
    UserId INT NOT NULL,
    PRIMARY KEY (HRId, UserId),
    FOREIGN KEY (HRId) REFERENCES [HR](HRId),
    FOREIGN KEY (UserId) REFERENCES [User](UserId)
);
GO

-- Вставка даних у таблицю HR
INSERT INTO [HR] (Name, Email, Phone) VALUES
('John Smith', 'john.smith@hrcompany.com', '555-1234'),
('Jane Doe', 'jane.doe@hrcompany.com', '555-5678'),
('Robert Brown', 'robert.brown@hrcompany.com', '555-8765'),
('Alice Johnson', 'alice.johnson@hrcompany.com', '555-4321'),
('Michael Lee', 'michael.lee@hrcompany.com', '555-6789');
GO

-- Вставка даних у таблицю User
INSERT INTO [User] (Username, Email, Password) VALUES
('alice99', 'alice99@example.com', 'password123'),
('bob_smith', 'bob_smith@example.com', 'securepass456'),
('charlie_brown', 'charlie_brown@example.com', 'mypassword789'),
('david_jones', 'david_jones@example.com', 'davidpass101'),
('emma_wilson', 'emma_wilson@example.com', 'emma2024'),
('frank_lucas', 'frank_lucas@example.com', 'frankpass202'),
('grace_kim', 'grace_kim@example.com', 'grace2023'),
('henry_miller', 'henry_miller@example.com', 'henrypass202'),
('irene_young', 'irene_young@example.com', 'irene2024'),
('jackson_white', 'jackson_white@example.com', 'jackson2023');
GO

-- Вставка даних у таблицю HRUser
INSERT INTO [HRUser] (HRId, UserId) VALUES
(1, 1), -- John Smith with alice99
(2, 2), -- Jane Doe with bob_smith
(3, 3), -- Robert Brown with charlie_brown
(4, 4), -- Alice Johnson with david_jones
(5, 5), -- Michael Lee with emma_wilson
(1, 6), -- John Smith with frank_lucas
(2, 7), -- Jane Doe with grace_kim
(3, 8), -- Robert Brown with henry_miller
(4, 9), -- Alice Johnson with irene_young
(5, 10); -- Michael Lee with jackson_white
GO

-- Вибірка всіх записів з таблиці HR
SELECT * FROM HR;
GO

-- Вибірка всіх записів з таблиці User
SELECT * FROM User;
GO

-- Вибірка всіх записів з таблиці HRUser
SELECT * FROM HRUser;
GO

-- Вибірка всіх користувачів, які пов'язані з конкретним HR (наприклад, з HRId = 1)
SELECT 
    u.Username, 
    u.Email
FROM 
    User u
JOIN 
    HRUser hu ON u.UserId = hu.UserId
WHERE 
    hu.HRId = 1;
GO

-- Вибірка всіх HR, які відповідають за конкретного користувача (наприклад, з UserId = 1)
SELECT 
    h.Name, 
    h.Email
FROM 
    HR h
JOIN 
    HRUser hu ON h.HRId = hu.HRId
WHERE 
    hu.UserId = 1;
GO
