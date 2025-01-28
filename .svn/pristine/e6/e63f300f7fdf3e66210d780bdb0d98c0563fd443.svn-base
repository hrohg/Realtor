using System;
using System.Collections.Generic;
using System.ServiceModel;
using RealEstate.DataAccess;

namespace Realtor.Synchronize.Service.Facade
{
	// NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IDataUpdateServiceHost" in both code and config file together.
	[ServiceContract]
	public interface IDataUpdateServiceHost
	{
		[OperationContract]
		string DoWork();

		[OperationContract]
		List<BlackListItem> GetNewBlackListItems(DateTime lastModifiedDate);

		[OperationContract]
		List<BuildingType> GetNewBuildingTypes(DateTime lastModifiedDate);

		[OperationContract]
		List<City> GetNewCities(DateTime lastModifiedDate);

		[OperationContract]
		List<Currency> GetNewCurrencies(DateTime lastChangeDate);

		[OperationContract]
		List<OperationalSignificance> GetNewOperationalSignificances(DateTime lastChangeDate);

		[OperationContract]
		List<SignificanceOfTheUse> GetNewSignificanceOfTheUses(DateTime lastChangeDate);

		[OperationContract]
		List<Project> GetNewProjects(DateTime lastChangeDate);

		[OperationContract]
		List<Region> GetNewRegions(DateTime lastChangeDate);

		[OperationContract]
		List<Remont> GetNewRemonts(DateTime lastChangeDate);

		[OperationContract]
		List<RentedEstate> GetNewRentedEstates(DateTime lastChangeDate);

		[OperationContract]
		List<Roofing> GetNewRoofings(DateTime lastChangeDate);

		[OperationContract]
		List<SelledEstate> GetNewSoldEstates(DateTime lastChangeDate);

		[OperationContract]
		List<State> GetNewStates(DateTime lastChangeDate);

		[OperationContract]
		List<Street> GetNewStreets(DateTime lastChangeDate);

		[OperationContract]
		List<User> GetNewUsers(DateTime lastChangeDate);

		[OperationContract]
		List<NeededEstate> GetNewDemands(DateTime lastChangeDate);

		[OperationContract]
		List<Estate> GetNewEstates(DateTime lastChangeDate);

		[OperationContract]
		List<EstatesAndDemand> GetNewEstateDemands(DateTime lastChangeDate);
		
		[OperationContract]
		List<Convenient> GetNewConvenients(DateTime lastChangeDate);
	}
}
