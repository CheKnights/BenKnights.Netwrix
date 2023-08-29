CREATE TABLE LogType
(
	ID INT IDENTITY(1,1) UNIQUE NOT NULL,  
	LogType NVARCHAR(32)

	PRIMARY KEY CLUSTERED
	(
		ID ASC
	)
)
CREATE INDEX idxLogType ON LogType (LogType);


CREATE TABLE LogSubType
(
	ID INT IDENTITY(1,1) UNIQUE NOT NULL,  
	LogTypeID INT NOT NULL,
	LogType NVARCHAR(32)

	PRIMARY KEY CLUSTERED
	(
		ID ASC, 
		LogTypeID ASC
	),
	FOREIGN KEY (LogTypeID) REFERENCES LogType(ID)
)
CREATE INDEX idxLogSubType ON LogSubType (LogType);

CREATE TABLE Logging 
(
	ID INT IDENTITY(1,1) UNIQUE NOT NULL,  
	DateCreated DATETIME NOT NULL,
	LogType INT NOT NULL,
	LogSubType INT NOT NULL,
	LogEntry NVARCHAR(MAX) NULL, 

	PRIMARY KEY CLUSTERED
	(
		ID ASC
	),
	FOREIGN KEY (LogType) REFERENCES LogType(ID),
	FOREIGN KEY (LogSubType) REFERENCES LogSubType(ID)
)
CREATE INDEX idxLoggingDate ON Logging (DateCreated);
CREATE INDEX idxLoggingType ON Logging (LogType);
CREATE INDEX idxLoggingSubType ON Logging (LogSubType);


SET IDENTITY_INSERT dbo.LogType ON;

INSERT INTO LogType (ID, LogType)
VALUES	(1, 'Alert'), 
		(2, 'Event')

SET IDENTITY_INSERT dbo.LogType OFF


SET IDENTITY_INSERT dbo.LogSubType ON;

INSERT INTO LogSubType (ID, LogTypeID, LogType)
VALUES (1, 1, 'Water Level'),
		(2, 1, 'Bean Feed'),
		(3, 1, 'Waste Coffee'),
		(4, 1, 'Water Tray'),
		(5, 2, 'Turned On'),
		(6, 2, 'Turned Off'),
		(7, 2, 'Making Coffee')

SET IDENTITY_INSERT dbo.LogSubType OFF;
