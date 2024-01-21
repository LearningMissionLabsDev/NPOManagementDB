IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'AccountStatus')
BEGIN
   CREATE TABLE AccountStatus (
    Id INT PRIMARY KEY,
    Description VARCHAR(50) NOT NULL);

	INSERT INTO AccountStatus (Id, Description) VALUES
    (1, 'Pending'),
    (2, 'Active'),
    (3, 'Deleted');
END;


IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Account' AND COLUMN_NAME = 'StatusId')
BEGIN
    ALTER TABLE Account
    ADD StatusId INT;
END;

GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Account' AND COLUMN_NAME = 'Status')
BEGIN
   UPDATE [Account]
		SET StatusId = 
				CASE 
					WHEN [Status] = 'Activ' THEN 2
					WHEN [Status] = 'Pending' THEN 1
					WHEN [Status] = 'Deleted' THEN 3
					ELSE NULL 
				END;

	ALTER TABLE [Account]
	DROP COLUMN Status;

END;

IF NOT EXISTS (
    SELECT 1 
    FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    WHERE TABLE_NAME = 'Account' 
      AND CONSTRAINT_NAME = 'FK_AccountStatus'
)
BEGIN
    ALTER TABLE [Account]
		ADD CONSTRAINT FK_AccountStatus
		FOREIGN KEY (StatusId)
		REFERENCES AccountStatus(Id);
END

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME in ('UserRoleConnection', 'Role') )
BEGIN
	ALTER TABLE [UserRoleConnection]
		DROP CONSTRAINT FK_UserRoleConnection_Role;

		DROP TABLE [Role];
		DROP TABLE [UserRoleConnection];
END;

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'UserStatus')
BEGIN
   CREATE TABLE UserStatus (
    Id INT PRIMARY KEY,
    Description VARCHAR(50) NOT NULL
);

INSERT INTO UserStatus (Id, Description) VALUES
    (1, 'Pending'),
    (2, 'Active'),
    (3, 'Deleted');
END;


IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'User' AND COLUMN_NAME = 'StatusId')
BEGIN
	ALTER TABLE [User]
	ADD StatusId INT;
END;

GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'User' AND COLUMN_NAME = 'Status')
BEGIN
   UPDATE [User]
				SET StatusId = 
				CASE 
                WHEN Status = 'Activ' THEN 2
                WHEN Status = 'Pending' THEN 1
                WHEN Status = 'Deleted' THEN 3
                ELSE NULL 
              END;

	ALTER TABLE [User]
	DROP COLUMN Status;

END;

IF NOT EXISTS (
    SELECT 1 
    FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    WHERE TABLE_NAME = 'User' 
      AND CONSTRAINT_NAME = 'FK_UserStatus'
)
BEGIN
    ALTER TABLE [User]
		ADD CONSTRAINT FK_UserStatus
		FOREIGN KEY (StatusId)
		REFERENCES UserStatus(Id);
END

