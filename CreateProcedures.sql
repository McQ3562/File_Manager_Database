USE FileManager
GO

IF EXISTS(SELECT 1 FROM sys.objects WHERE name = 'sp_ADD_Configuration')
	DROP PROCEDURE sp_ADD_Configuration
GO
CREATE PROCEDURE sp_ADD_Configuration (
	@ConfigName VARCHAR(50),
	@ConfigValue VARCHAR(50),
	@NewConfigID INT OUT
)
AS
INSERT INTO dbo.Configuration (ConfigurationName, ConfigurationValue)
VALUES (@ConfigName, @ConfigValue)

SET @NewConfigID = @@IDENTITY
GO

IF EXISTS(SELECT 1 FROM sys.objects WHERE name = 'sp_GET_ConfigurationByName')
	DROP PROCEDURE sp_GET_ConfigurationByName
GO
CREATE PROCEDURE sp_GET_ConfigurationByName (
	@ConfigName VARCHAR(50)
)
AS
SELECT LibraryID, LibraryName
FROM dbo.Library
WHERE LibraryName = @ConfigName
GO

IF EXISTS(SELECT 1 FROM sys.objects WHERE name = 'sp_ADD_Library')
	DROP PROCEDURE sp_ADD_Library
GO
CREATE PROCEDURE sp_ADD_Library (
	@LibraryName VARCHAR(100),
	@NewLibraryID INT OUT
)
AS
INSERT INTO dbo.Library (LibraryName)
VALUES (@LibraryName)

SET @NewLibraryID = @@IDENTITY
GO

IF EXISTS(SELECT 1 FROM sys.objects WHERE name = 'sp_GET_Libraries')
	DROP PROCEDURE sp_GET_Libraries
GO
CREATE PROCEDURE sp_GET_Libraries 
AS
SELECT LibraryID, LibraryName
FROM dbo.Library
GO

IF EXISTS(SELECT 1 FROM sys.objects WHERE name = 'sp_ADD_LibraryFolder')
	DROP PROCEDURE sp_ADD_LibraryFolder
GO
CREATE PROCEDURE sp_ADD_LibraryFolder (
	@LibraryFolderID INT = NULL,
	@LibraryName VARCHAR(50) = NULL,
	@ParentLibraryFolderID INT, 
	@FolderName VARCHAR(100),
	@NewDirectoryFolderID INT OUT
)
AS
IF (@LibraryFolderID IS NULL)
BEGIN
	SET @LibraryFolderID = (SELECT LibraryID FROM Library WHERE LibraryName = @LibraryName)
END

	INSERT INTO LibraryFolders (LibraryID, ParentLibraryFolderID, FolderName)
	VALUES (@LibraryFolderID, @ParentLibraryFolderID, @FolderName)

SET @NewDirectoryFolderID = SCOPE_IDENTITY()
GO

IF EXISTS(SELECT 1 FROM sys.objects WHERE name = 'sp_GET_LibraryFolder')
	DROP PROCEDURE sp_GET_LibraryFolder
GO
CREATE PROCEDURE sp_GET_LibraryFolder (
	@LibraryFolderID INT
)
AS
BEGIN
	SELECT *
	FROM LibraryFolders
	WHERE LibraryFolderID=@LibraryFolderID
END
GO

IF EXISTS(SELECT 1 FROM sys.objects WHERE name = 'sp_GET_LibraryFolderIDs')
	DROP PROCEDURE sp_GET_LibraryFolderIDs
GO
CREATE PROCEDURE sp_GET_LibraryFolderIDs (
	@LibraryFolderID INT = NULL,
	@LibraryName VARCHAR(50) = NULL
)
AS
IF (@LibraryFolderID IS NOT NULL)
BEGIN
	SELECT LibraryFolderID
	FROM LibraryFolders
	WHERE ParentLibraryFolderID=@LibraryFolderID
END
ELSE IF (@LibraryName IS NOT NULL)
BEGIN
	SET @LibraryFolderID = (SELECT LibraryID FROM Library WHERE LibraryName=@LibraryName)

	SELECT LibraryFolderID
	FROM LibraryFolders
	WHERE LibraryID = @LibraryFolderID
	AND
	ParentLibraryFolderID IS NULL
END
GO

IF EXISTS(SELECT 1 FROM sys.objects WHERE name = 'sp_ADD_FileItem')
	DROP PROCEDURE sp_ADD_FileItem
GO
CREATE PROCEDURE sp_ADD_FileItem (
	@LibraryFolderID INT,
	@FieldDisplayName VARCHAR(50),
	@FilePath VARCHAR(255)
)
AS
BEGIN
	INSERT INTO FileItem (LibraryFolderID, FileDisplayName, FilePath)
	VALUES(@LibraryFolderID, @FieldDisplayName, @FilePath)
END
GO

IF EXISTS(SELECT 1 FROM sys.objects WHERE name = 'sp_GET_FileItem')
	DROP PROCEDURE sp_GET_FileItem
GO
CREATE PROCEDURE sp_GET_FileItem (
	@FileItemID INT
)
AS
BEGIN
	SELECT *
	FROM FileItem
	WHERE FileItemID=@FileItemID
END
GO

IF EXISTS(SELECT 1 FROM sys.objects WHERE name = 'sp_GET_FileItemsByID')
	DROP PROCEDURE sp_GET_FileItemsByID
GO
CREATE PROCEDURE sp_GET_FileItemsByID (
	@LibraryFolderID INT = NULL
)
AS
BEGIN
	SELECT FileItemID
	FROM FileItem
	WHERE LibraryFolderID = @LibraryFolderID
END
GO

IF EXISTS(SELECT 1 FROM sys.objects WHERE name = 'sp_ADD_DataItem')
	DROP PROCEDURE sp_ADD_DataItem
GO
CREATE PROCEDURE sp_ADD_DataItem (
	@LibraryFolderID INT,
	@DataItemLabel VARCHAR(50),
	@DataItemValue VARCHAR(MAX)
)
AS
BEGIN
	INSERT INTO DataItem (LibraryFolderID, DataItemLabel, DataItemValue)
	VALUES (@LibraryFolderID, @DataItemLabel, @DataItemValue)
END
GO

IF EXISTS(SELECT 1 FROM sys.objects WHERE name = 'sp_GET_DataItem')
	DROP PROCEDURE sp_GET_DataItem
GO
CREATE PROCEDURE sp_GET_DataItem (
	@DataItemID INT
)
AS
BEGIN
	SELECT *
	FROM DataItem
	WHERE DataItemID = @DataItemID
END
GO

IF EXISTS(SELECT 1 FROM sys.objects WHERE name = 'sp_GET_DataItemsByID')
	DROP PROCEDURE sp_GET_DataItemsByID
GO
CREATE PROCEDURE sp_GET_DataItemsByID (
	@LibraryFolderID INT = NULL
)
AS
BEGIN
	SELECT DataItemID
	FROM DataItem
	WHERE LibraryFolderID = @LibraryFolderID
END