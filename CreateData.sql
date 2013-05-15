USE FileManager
GO

/* Add Configurations */
PRINT 'Add Configurations'
DECLARE @ConfigID INT
EXEC sp_ADD_Configuration @ConfigName = 'BaseFileDir', @ConfigValue = 'C:\Pictures\', @NewConfigID=@ConfigID

/* Add Dictionaries */
PRINT 'Add Dictionaries'
DECLARE @LibraryID INT
EXEC sp_ADD_Library @LibraryName='Mecury', @NewLibraryID=@LibraryID
EXEC sp_ADD_Library @LibraryName='Venus', @NewLibraryID=@LibraryID
EXEC sp_ADD_Library @LibraryName='Earth', @NewLibraryID=@LibraryID
EXEC sp_ADD_Library @LibraryName='Mars', @NewLibraryID=@LibraryID
EXEC sp_ADD_Library @LibraryName='Jupiter', @NewLibraryID=@LibraryID
EXEC sp_ADD_Library @LibraryName='Saturn', @NewLibraryID=@LibraryID
EXEC sp_ADD_Library @LibraryName='Uranus', @NewLibraryID=@LibraryID
EXEC sp_ADD_Library @LibraryName='Neptune', @NewLibraryID=@LibraryID
EXEC sp_ADD_Library @LibraryName='Pluto', @NewLibraryID=@LibraryID
GO

/* Add Library Folder */
PRINT 'Add LibraryFolders'
DECLARE @DirID INT, @DirSubID INT
/**** Mercury ****/
EXEC sp_ADD_LibraryFolder @LibraryName='Mecury', @ParentLibraryFolderID=NULL, @FolderName='Surface Map', @NewDirectoryFolderID=@DirID OUTPUT
/*** File Data ***/
EXEC sp_ADD_FileItem @LibraryFolderID=@DirID, @FieldDisplayName='Part Map', @FilePath='C:\Pictures\Mercury\Mercury_h07_Beethoven_quadrangle_marked.png'
EXEC sp_ADD_FileItem @LibraryFolderID=@DirID, @FieldDisplayName='Full Map', @FilePath='C:\Pictures\Mercury\Mercury_MapDEF4.jpg'
/*** Data Item ***/
EXEC sp_ADD_DataItem @LibraryFolderID=@DirID, @DataItemLabel='Orbital period', @DataItemValue='Orbital period = 0.241 earth years'
EXEC sp_ADD_DataItem @LibraryFolderID=@DirID, @DataItemLabel='Rotational period', @DataItemValue='Rotational period = 58.646 earth days'

	/* Add Sub Library Folder */
	EXEC sp_ADD_LibraryFolder @LibraryName='Mecury', @ParentLibraryFolderID=@DirID, @FolderName='Core Map' , @NewDirectoryFolderID=@DirSubID OUTPUT
	/*** File Data ***/
	EXEC sp_ADD_FileItem @LibraryFolderID=@DirSubID, @FieldDisplayName='Core Cutaway', @FilePath='C:\Pictures\Mercury\Mercury_mag.jpg'
	EXEC sp_ADD_FileItem @LibraryFolderID=@DirSubID, @FieldDisplayName='Simple Core Cutaway', @FilePath='C:\Pictures\Mercury\mercuryinterior.jpg'

/**** Venus ****/
EXEC sp_ADD_LibraryFolder @LibraryName='Venus', @ParentLibraryFolderID=NULL, @FolderName='Surface Map', @NewDirectoryFolderID=@DirID OUTPUT

	/* Add Sub Library Folder */
	EXEC sp_ADD_LibraryFolder @LibraryName='Venus', @ParentLibraryFolderID=@DirID, @FolderName='Core Map' , @NewDirectoryFolderID=@DirSubID OUTPUT

EXEC sp_ADD_LibraryFolder @LibraryName='Venus', @ParentLibraryFolderID=NULL, @FolderName='Moons', @NewDirectoryFolderID=@DirID OUTPUT
EXEC sp_ADD_LibraryFolder @LibraryName='Venus', @ParentLibraryFolderID=NULL, @FolderName='Images', @NewDirectoryFolderID=@DirID OUTPUT

/**** Earth ****/
EXEC sp_ADD_LibraryFolder @LibraryName='Earth', @ParentLibraryFolderID=NULL, @FolderName='Surface Map', @NewDirectoryFolderID=@DirID OUTPUT
	/* Add Sub Library Folder */
	EXEC sp_ADD_LibraryFolder @LibraryName='Earth', @ParentLibraryFolderID=@DirID, @FolderName='Core Map' , @NewDirectoryFolderID=@DirSubID OUTPUT
EXEC sp_ADD_LibraryFolder @LibraryName='Earth', @ParentLibraryFolderID=NULL, @FolderName='Moons', @NewDirectoryFolderID=@DirID OUTPUT
EXEC sp_ADD_LibraryFolder @LibraryName='Earth', @ParentLibraryFolderID=NULL, @FolderName='Images', @NewDirectoryFolderID=@DirID OUTPUT
/**** Mars ****/
EXEC sp_ADD_LibraryFolder @LibraryName='Mars', @ParentLibraryFolderID=NULL, @FolderName='Surface Map', @NewDirectoryFolderID=@DirID OUTPUT
	/* Add Sub Library Folder */
	EXEC sp_ADD_LibraryFolder @LibraryName='Mars', @ParentLibraryFolderID=@DirID, @FolderName='Core Map', @NewDirectoryFolderID=@DirSubID  OUTPUT
EXEC sp_ADD_LibraryFolder @LibraryName='Mars', @ParentLibraryFolderID=NULL, @FolderName='Moons', @NewDirectoryFolderID=@DirID OUTPUT
EXEC sp_ADD_LibraryFolder @LibraryName='Mars', @ParentLibraryFolderID=NULL, @FolderName='Images', @NewDirectoryFolderID=@DirID OUTPUT
/**** Jupiter ****/
EXEC sp_ADD_LibraryFolder @LibraryName='Jupiter', @ParentLibraryFolderID=NULL, @FolderName='Surface Map', @NewDirectoryFolderID=@DirID OUTPUT
	/* Add Sub Library Folder */
	EXEC sp_ADD_LibraryFolder @LibraryName='Jupiter', @ParentLibraryFolderID=@DirID, @FolderName='Core Map', @NewDirectoryFolderID=@DirSubID OUTPUT
EXEC sp_ADD_LibraryFolder @LibraryName='Jupiter', @ParentLibraryFolderID=NULL, @FolderName='Moons', @NewDirectoryFolderID=@DirID OUTPUT
EXEC sp_ADD_LibraryFolder @LibraryName='Jupiter', @ParentLibraryFolderID=NULL, @FolderName='Images', @NewDirectoryFolderID=@DirID OUTPUT
/**** Saturn ****/
EXEC sp_ADD_LibraryFolder @LibraryName='Saturn', @ParentLibraryFolderID=NULL, @FolderName='Surface Map', @NewDirectoryFolderID=@DirID OUTPUT
	/* Add Sub Library Folder */
	EXEC sp_ADD_LibraryFolder @LibraryName='Saturn', @ParentLibraryFolderID=@DirID, @FolderName='Core Map', @NewDirectoryFolderID=@DirSubID OUTPUT
EXEC sp_ADD_LibraryFolder @LibraryName='Saturn', @ParentLibraryFolderID=NULL, @FolderName='Moons', @NewDirectoryFolderID=@DirID OUTPUT
EXEC sp_ADD_LibraryFolder @LibraryName='Saturn', @ParentLibraryFolderID=NULL, @FolderName='Images', @NewDirectoryFolderID=@DirID OUTPUT
/**** Uranus ****/
EXEC sp_ADD_LibraryFolder @LibraryName='Uranus', @ParentLibraryFolderID=NULL, @FolderName='Surface Map', @NewDirectoryFolderID=@DirID OUTPUT
	/* Add Sub Library Folder */
	EXEC sp_ADD_LibraryFolder @LibraryName='Uranus', @ParentLibraryFolderID=@DirID, @FolderName='Core Map', @NewDirectoryFolderID=@DirSubID OUTPUT
EXEC sp_ADD_LibraryFolder @LibraryName='Uranus', @ParentLibraryFolderID=NULL, @FolderName='Moons', @NewDirectoryFolderID=@DirID OUTPUT
EXEC sp_ADD_LibraryFolder @LibraryName='Uranus', @ParentLibraryFolderID=NULL, @FolderName='Images', @NewDirectoryFolderID=@DirID OUTPUT
/**** Neptune ****/
EXEC sp_ADD_LibraryFolder @LibraryName='Neptune', @ParentLibraryFolderID=NULL, @FolderName='Surface Map', @NewDirectoryFolderID=@DirID OUTPUT
	/* Add Sub Library Folder */
	EXEC sp_ADD_LibraryFolder @LibraryName='Neptune', @ParentLibraryFolderID=@DirID, @FolderName='Core Map', @NewDirectoryFolderID=@DirSubID  OUTPUT
EXEC sp_ADD_LibraryFolder @LibraryName='Neptune', @ParentLibraryFolderID=NULL, @FolderName='Moons', @NewDirectoryFolderID=@DirID OUTPUT
EXEC sp_ADD_LibraryFolder @LibraryName='Neptune', @ParentLibraryFolderID=NULL, @FolderName='Images', @NewDirectoryFolderID=@DirID OUTPUT
/**** Pluto ****/
EXEC sp_ADD_LibraryFolder @LibraryName='Pluto', @ParentLibraryFolderID=NULL, @FolderName='Surface Map', @NewDirectoryFolderID=@DirID OUTPUT
	/* Add Sub Library Folder */
	EXEC sp_ADD_LibraryFolder @LibraryName='Pluto', @ParentLibraryFolderID=@DirID, @FolderName='Core Map', @NewDirectoryFolderID=@DirSubID  OUTPUT
EXEC sp_ADD_LibraryFolder @LibraryName='Pluto', @ParentLibraryFolderID=NULL, @FolderName='Moons', @NewDirectoryFolderID=@DirID OUTPUT
EXEC sp_ADD_LibraryFolder @LibraryName='Pluto', @ParentLibraryFolderID=NULL, @FolderName='Images', @NewDirectoryFolderID=@DirID OUTPUT
GO




