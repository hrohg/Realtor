
	
UPDATE Cities SET OriginalID = CityID

	
	UPDATE BlackListItems SET OriginalID = ID
	

	
UPDATE BlackListNumbers SET OriginalID = ID

	UPDATE BuildingTypes SET OriginalID = BuildingTypeID

	
	UPDATE Convenients SET OriginalID = ID

	
	UPDATE Currencies SET OriginalID = CurrencyID

	UPDATE Estates SET OriginalID = EstateID

	UPDATE OperationalSignificances SET OriginalID = ID

	UPDATE Projects SET OriginalID = ProjectID

	UPDATE Regions SET OriginalID = RegionID	

	UPDATE RentedEstates SET OriginalID = ID

	UPDATE Roofings SET OriginalID = ID

	UPDATE SelledEstates SET OriginalID = ID

	UPDATE SignificanceOfTheUses SET OriginalID = ID

	UPDATE States SET OriginalID = ID

	UPDATE Streets SET OriginalID = StreetID

	UPDATE Users SET OriginalID = ID
	
	UPDATE EstatesAndDemands SET EstateOriginalID = EstateID, DemandOriginalID = DemandID
	
	UPDATE Remonts set OriginalID = RemontID
	
	update EstateImages set OriginalID = ImageID
	
	update Estates set OriginalID = EstateID

	update Estates set LastModifiedDate = AddDate where LastModifiedDate is null
	
	update NeededEstates set OriginalID = ID
