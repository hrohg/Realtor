

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
ALTER TABLE dbo.Cities ADD
	LastModifiedDate datetime NULL,
	OriginalID int NULL
	
--UPDATE Cities SET OriginalID = CityID
	
ALTER TABLE dbo.BlackListItems ADD
	LastModifiedDate datetime NULL,
	OriginalID int NULL,
	IsDeleted bit NULL
	
	--UPDATE BlackListItems SET OriginalID = ID
	
ALTER TABLE dbo.BlackListNumbers ADD
	LastModifiedDate datetime NULL,
	OriginalID int NULL,
	IsDeleted bit NULL
	
--UPDATE BlackListNumbers SET OriginalID = ID
	
ALTER TABLE dbo.BuildingTypes ADD
	LastModifiedDate datetime NULL,
	OriginalID int NULL
	
	--UPDATE BuildingTypes SET OriginalID = BuildingTypeID
	
	ALTER TABLE Convenients ADD
	LastModifiedDate datetime NULL,
	OriginalID int NULL,
	IsDeleted bit NULL
	
	--UPDATE Convenients SET OriginalID = ID
	
	ALTER TABLE Currencies ADD
	LastModifiedDate datetime NULL,
	OriginalID int NULL
	
	--UPDATE Currencies SET OriginalID = CurrencyID
	
	ALTER TABLE Estates ADD
	OriginalID int NULL,
	IsHasSomething bit NULL,
	IsDeleted bit NULL,
	IsHasSauna bit NULL
	
	--UPDATE Estates SET OriginalID = EstateID
	
	ALTER TABLE OperationalSignificances ADD
	LastModifiedDate datetime NULL,
	OriginalID int NULL
	
	--UPDATE OperationalSignificances SET OriginalID = ID
	
	ALTER TABLE Projects ADD
	LastModifiedDate datetime NULL,
	OriginalID int NULL
	
	--UPDATE Projects SET OriginalID = ProjectID
	
	ALTER TABLE Regions ADD
	LastModifiedDate datetime NULL,
	OriginalID int NULL
	
	--UPDATE Regions SET OriginalID = RegionID	
	
	ALTER TABLE RentedEstates ADD
	LastModifiedDate datetime NULL,
	IsDeleted bit NULL,
	OriginalID int NULL
	
	--UPDATE RentedEstates SET OriginalID = ID
	
	ALTER TABLE Roofings ADD
	LastModifiedDate datetime NULL,
	OriginalID int NULL
	
	--UPDATE Roofings SET OriginalID = ID
	
	ALTER TABLE SelledEstates ADD
	LastModifiedDate datetime NULL,
	IsDeleted bit NULL,
	OriginalID int NULL
	
	--UPDATE SelledEstates SET OriginalID = ID
	
	ALTER TABLE SignificanceOfTheUses ADD
	LastModifiedDate datetime NULL,
	OriginalID int NULL
	
	--UPDATE SignificanceOfTheUses SET OriginalID = ID
	
	ALTER TABLE States ADD
	LastModifiedDate datetime NULL,
	OriginalID int NULL
	
	--UPDATE States SET OriginalID = ID
	
	ALTER TABLE Streets ADD
	LastModifiedDate datetime NULL,
	OriginalID int NULL
	
	--UPDATE Streets SET OriginalID = StreetID
	
	ALTER TABLE Users ADD
	LastModifiedDate datetime NULL,
	OriginalID int NULL
	
	--UPDATE Users SET OriginalID = ID
	
	ALTER TABLE dbo.NeededEstates ADD
	IsDeleted bit NULL,
	OriginalID int NULL
	
	ALTER TABLE dbo.Remonts ADD
	LastModifiedDate datetime NULL,
	OriginalID int NULL
	
	ALTER TABLE dbo.EstatesAndDemands ADD
	DemandOriginalID int NULL,
	EstateOriginalID int NULL,
	LastModifiedDate datetime NULL,
	IsDeleted bit NULL
	
	ALTER TABLE dbo.BrokerEstateTypes ADD
	EstateTypeOriginalID int NULL,
	BrokerOriginalID int NULL
	
	ALTER TABLE dbo.BrokerOrderTypes ADD
	BrokerOriginalID int NULL,
	OrderTypeOriginalID int NULL
	
	ALTER TABLE dbo.BrokersRegions ADD
	BrokerOriginalID int NULL,
	RegionOriginalID int NULL
	
	ALTER TABLE dbo.BrokerStates ADD
	BrokerOriginalID int NULL,
	StateOriginalID int NULL
	
	ALTER TABLE dbo.NeededBuildingTypes ADD
	DemandOriginalID int NULL,
	BuildingTypeOriginalID int NULL
	
	ALTER TABLE dbo.NeededEstateTypes ADD
	DemandOriginalID int NULL,
	EstateTypeOriginalID int NULL
	
	ALTER TABLE dbo.NeededProjects ADD
	DemandOriginalID int NULL,
	ProjectOriginalID int NULL
	
	ALTER TABLE dbo.NeededRegions ADD
	DemandOriginalID int NULL,
	RegionOriginalID int NULL
	
	ALTER TABLE dbo.NeededRemonts ADD
	DemandOriginalID int NULL,
	RemontOriginalID int NULL
	
	ALTER TABLE dbo.EstateImages ADD
	LastModifiedDate datetime NULL,
	IsDeleted bit NULL,
	OriginalID int NULL
	
	ALTER TABLE dbo.EstateVideos ADD
	LastModifiedDate datetime NULL,
	IsDeleted bit NULL,
	OriginalID int NULL
COMMIT
