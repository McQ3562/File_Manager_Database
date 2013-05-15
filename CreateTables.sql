--IF EXISTS(SELECT 1 FROM sys.databases WHERE name = 'FileManager')
--	DROP DATABASE FileManager
--GO
--CREATE DATABASE FileManager
--ON
--PRIMARY  
--    (NAME = FileManager_Data,
--    --FILENAME = 'D:\Data Bases\FileManager_Data.mdf',
--    FILENAME = 'c:\Program Files (x86)\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\FileManager_Data.mdf',
--    SIZE = 10MB,
--    MAXSIZE = 200,
--    FILEGROWTH = 10)
--LOG ON 
--   (NAME = FileManager_LOG,
--    --FILENAME = 'D:\Data Bases\FileManager_LOG.ldf',
--    FILENAME = 'c:\Program Files (x86)\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\FileManager_LOG.ldf',
--    SIZE = 10MB,
--    MAXSIZE = 200,
--    FILEGROWTH = 10)
--GO

USE FileManager
GO

/* DROP CONSTRAINTS */
IF(EXISTS(SELECT 1 FROM sys.objects WHERE name = 'FK_Library_LibraryID__LibraryFolder_LibraryID'))
	ALTER TABLE LibraryFolders DROP CONSTRAINT FK_Library_LibraryID__LibraryFolder_LibraryID

IF(EXISTS(SELECT 1 FROM sys.objects WHERE name = 'FK_LibraryFolder_LibraryFolderID__FileItem_LibraryFolderID'))
	ALTER TABLE FileItem DROP CONSTRAINT FK_LibraryFolder_LibraryFolderID__FileItem_LibraryFolderID

IF(EXISTS(SELECT 1 FROM sys.objects WHERE name = 'FK_LibraryFolder_LibraryFolderID__DataItem_LibraryFolderID'))
	ALTER TABLE DataItem DROP CONSTRAINT FK_LibraryFolder_LibraryFolderID__DataItem_LibraryFolderID
GO

/* Build Tables */
IF(EXISTS(SELECT name FROM sys.tables WHERE name='Configuration'))
	DROP TABLE Configuration
CREATE TABLE Configuration (
	ConfigurationID INT IDENTITY(1,1) PRIMARY KEY,
	ConfigurationName VARCHAR(100) NOT NULL,
	ConfigurationValue VARCHAR(100)
)

IF(EXISTS(SELECT name FROM sys.tables WHERE name='Library'))
	DROP TABLE Library
CREATE TABLE Library (
	LibraryID INT IDENTITY(1,1) PRIMARY KEY,
	LibraryName VARCHAR(100)
)

IF(EXISTS(SELECT name FROM sys.tables WHERE name='LibraryFolders'))
	DROP TABLE LibraryFolders
CREATE TABLE LibraryFolders (
	LibraryFolderID INT IDENTITY(1,1) PRIMARY KEY,
	LibraryID INT,
	ParentLibraryFolderID INT, 
	FolderName VARCHAR(100) NOT NULL,
)



IF(EXISTS(SELECT name FROM sys.tables WHERE name='FileItem'))
	DROP TABLE FileItem
CREATE TABLE FileItem
(
	FileItemID INT IDENTITY(1,1) PRIMARY KEY,
	LibraryFolderID INT NOT NULL,
	FileDisplayName VARCHAR(50),
	FilePath VARCHAR(255)
)


IF(EXISTS(SELECT name FROM sys.tables WHERE name='DataItem'))
	DROP TABLE DataItem
CREATE TABLE DataItem
(
	DataItemID INT IDENTITY(1,1) PRIMARY KEY,
	LibraryFolderID INT NOT NULL,
	DataItemLabel VARCHAR(50),
	DataItemValue VARCHAR(MAX)
)
GO

/* Add Constraints */
ALTER TABLE LibraryFolders ADD CONSTRAINT FK_Library_LibraryID__LibraryFolder_LibraryID
FOREIGN KEY (LibraryID) REFERENCES Library(LibraryID)
GO
ALTER TABLE FileItem ADD CONSTRAINT FK_LibraryFolder_LibraryFolderID__FileItem_LibraryFolderID
FOREIGN KEY (LibraryFolderID) REFERENCES LibraryFolders(LibraryFolderID)
GO
ALTER TABLE DataItem ADD CONSTRAINT FK_LibraryFolder_LibraryFolderID__DataItem_LibraryFolderID
FOREIGN KEY (LibraryFolderID) REFERENCES LibraryFolders(LibraryFolderID)
GO
