USE BenKnightsNetWrix;
GO
CREATE PROCEDURE [dbo].[InsertLogItem]

	@Type INT,
	@SubType INT,
	@Detail NVARCHAR(MAX)

AS

	INSERT INTO Logging VALUES (@Type, @SubType, @Detail);

RETURN 0