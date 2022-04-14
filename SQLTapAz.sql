create database TapAz

use TapAz

create table Settings(
	Id int primary key identity,
	Logo nvarchar(150),
	[Location] nvarchar(100),
	Email nvarchar(100),
	Phone nvarchar(100),
	Phone2 nvarchar(100),
	IgUrl nvarchar(100),
	FbUrl nvarchar(100)
)

create table Advertisements(		
	Id int primary key identity,
	[Image] nvarchar(100),
	[Url] nvarchar(100)
)

create table Categories(
	Id int primary key identity,
	[Name] nvarchar(30)
)

create table SubCategories(
	Id int primary key identity,
	[Name] nvarchar(50),
	Category_Id int foreign key references Categories(Id)
)

create table Brands(
	Id int primary key identity,
	[Name] nvarchar(50),
	SubCategory_Id int foreign key references SubCategories(Id)
)

create table Color(
	Id int primary key identity,
	[Name] nvarchar(50)
)

create table GasType(
	Id int primary key identity,
	[Name] nvarchar(50)
)

create table Cities(
	Id int primary key identity,
	[Name] nvarchar(50)
)

create table Models(
	Id int primary key identity,
	[Name] nvarchar(50),
	Engine nvarchar(50),
	Relase smalldatetime,
	Km int,
	Brand_Id int foreign key references Brands(Id),
	Color_Id int foreign key references Color(Id),
	GasType_Id int foreign key references GasType(Id)
)

create table Announcements(
	Id int primary key identity,
	Price decimal(7,2),
	Article nvarchar(500),
	City_Id int foreign key references Cities(Id),
	Brand_Id int foreign key references Brands(Id),
	Model_Id int foreign key references Models(Id),
	Gas_Id int foreign key references GasType(Id),
	Color_Id int foreign key references Color(Id)
)

create table Images(
	Id int primary key identity,
	[Name] nvarchar(50),
	Announcement_Id int foreign key references Announcements(Id)
)