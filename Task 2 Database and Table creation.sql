create database Library 
go

create table Books (
BookID int Primary Key NOT NULL,
Title nvarchar(255) NOT NULL,
Author nvarchar(255) NOT NULL,
Barcode int NOT NULL,
Genre nvarchar(255) NOT NULL,
Date_Published Date NOT NULL
)

create table Members(
MemberID int Primary key NOT NULL,
Name nvarchar(255) NOT NULL,
Address nvarchar(255) NOT NULL,
Phone_Number nvarchar(255) NOT NULL,
Email nvarchar(255) NOT NULL
)

create table Borrowed (
BorrowID int Primary key NOT NULL,
MemberID int Foreign Key references Members(MemberID),
BookID int Foreign Key references Books(BookID),
Borrow_Date Date NOT NULL,
Due_Date Date NOT NULL,
Return_Date Date NOT NULL,
)

create table Reservations(
ReservationID int Primary Key NOT NULL,
MemberID int Foreign Key references Members(MemberID),
BookID int Foreign Key references Books(BookID),
Reservation_Date Date NOT NULL,
Expected_Availability date NOT NULL,
Status nvarchar(25) NOT NULL
)

ALTER TABLE
  Borrowed
Alter COLUMN
  Return_Date date;

insert into Books
Values(1, 'The Chronicles of Narnia', 'Richard Grant', '48573958609', 'Fiction', '2013-02-25'),
(2, 'Percy Jackson and The lightning thief', 'Rcik Riordan', '35869856938', 'Fiction', '2005-06-28'),
(23, 'Nifty Shades Of Beige', 'Gibby Gibson', '7539840284', 'Romance', '2013-08-21'),
(4, 'From', 'Boyd Matthews', '4753629402', 'Horror', '2021-02-22'),
(5, 'You', 'Joe Goldberg', '5792652013', 'Romance', '2019-11-30'),
(44, 'Euphoria', 'Kendrick Lamar', '5793204753','Autobiography', '2024-02-14'),
(321, 'The theory Of Everything', 'Stephen Hawking','4756203748', 'Autobiography', '2012-04-19'),
(64, 'Its always Sunny in Philadelphia', 'Rob McElhenny', '4858492834' , 'Spy Thriller', '2004-09-22'),
(3, 'The life and times of Sunshine', 'Kentavious Caldwell Pope', '5738294053' ,'Horror', '2021-05-16'),
(221, 'Que Sera', 'Anthony Russo', '5738294053', 'Autobiography', '2018-07-25')

insert into Members
Values(21, 'Bruce Matthis', '64 McDonald Drive', '+276453271834', 'BruceTheDon@gmail.com'),
(1, 'Tabitha Matthews', '463 Rhode Island Road', '+27384945633', 'Tabs33@gmail.com'),
(43, 'Joe Russo', '753 President Square Lane', '+27384932046', 'RussoJoe@gmail.com'),
(95, 'Selina Whitwham', '287 Rieder Trail', '+27688373618','swhitwham0@issuu.com'),
(24, 'Stafford Brandon', '59 Ilene Hill', '+27066912490','sbrandon1@deliciousdays.com'),
(98, 'Jillayne Magog', '89 Carey Trail',  '+27984152066','jmagog2@npr.org'),
(81, 'Hanson Itzkovwitch', '89 Waxwing Plaza', '+27653349803','hitzkovwitch3@princeton.edu'),
(61, 'Aleksandr Colquitt', '2180 Debra Alley', '+27247208281','acolquitt4@i2i.jp'),
(83, 'Curran Gethen', '6289 Algoma Point', '+27735886269','cgethen5@va.gov'),
(84, 'Dodi Dimitru', '21 Stone Corner Terrace',  '+27677450261','ddimitru6@google.cn')

insert into Borrowed
Values(1, 21, 44, '2024-07-21', '2024-08-31',Null),
(23, 84, 221, '2024-02-25', '2024-03-25', '2024-03-20'),
(34, 95, 1, '2024-02-14', '2024-03-14', '2024-04-20'),
(3, 81, 23, '2024-05-06', '2024-06-13', Null),
(2, 61, 321, '2024-07-11', '2024-08-11', '2024-08-03'),
(56, 83, 3, '2024-01-10', '2024-03-10', '2024-02-28'),
(8, 24, 64, '2024-04-12', '2024-05-12', Null),
(39, 43, 5, '2024-03-11', '2024-04-18', '2024-04-05'),
(49, 98, 44, '2024-09-30', '2024-10-30', Null),
(5, 24, 23, '2024-08-23', '2024-09-23', '2024-09-15')

insert into Reservations
Values(1, 95, 321, '2024-08-01', '2024-08-11', 'Fulfilled'),
(22, 24, 64, '2024-05-11', '2024-05-12', 'Not Fulfilled'),
(31, 95, 23, '2024-05-28', '2024-06-13', 'Not Fulfilled'),
(342, 61, 221, '2024-03-19', '2024-03-25', 'Canceled'),
(212, 43, 64, '2024-04-23', '2024-05-12', 'Fulfilled'),
(110, 98, 1, '2024-03-10', '2024-03-14', 'Fulfilled'),
(432, 81, 3, '2024-02-21', '2024-03-10', 'Canceled'),
(67, 81, 5, '2024-04-12', '2024-04-18', 'Fulfilled'),
(86, 21, 44, '2024-10-10', '2024-10-30', 'Not Fulfilled'),
(15, 95, 1, '2023-03-18', '2024-03-14', 'Canceled')



