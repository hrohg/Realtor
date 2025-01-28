







update estates  set priceperdayinamd = (select valueInAMD from currencies where currencyID=estates.currencyid) * estates.priceperday




ALTER TABLE dbo.Estates ADD
	IsHasFurniture bit NULL,
	IsHasConditioner bit NULL,
	IsHasWasher bit NULL



