using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using RealEstate.Business.Managers;
using RealEstate.DataAccess;
using Realtor.Synchronize.Service.Facade;

namespace Realtor.Synchronize.Host
{
	// NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "DataUpdateServiceHost" in both code and config file together.
	public class DataUpdateServiceHost : IDataUpdateServiceHost
	{
		public string DoWork()
		{
			return "Valod";
		}

		public List<BlackListItem> GetNewBlackListItems(DateTime lastModifiedDate)
		{
			return BlackListManager.GetNewBlackListItems(lastModifiedDate);
		}

		public List<BuildingType> GetNewBuildingTypes(DateTime lastModifiedDate)
		{
			return BuildingTypeManager.GetNewBuildingTypes(lastModifiedDate);
		}

		public List<City> GetNewCities(DateTime lastModifiedDate)
		{
			return CityManager.GetNewCities(lastModifiedDate);
		}

		public List<Currency> GetNewCurrencies(DateTime lastChangeDate)
		{
			return CurrencyManager.GetNewCurrencies(lastChangeDate);
		}

		public List<OperationalSignificance> GetNewOperationalSignificances(DateTime lastChangeDate)
		{
			return OperationalSignificanceManager.GetNewOperationalSignificances(lastChangeDate);
		}

		public List<SignificanceOfTheUse> GetNewSignificanceOfTheUses(DateTime lastChangeDate)
		{
			return OperationalSignificanceManager.GetNewSignificanceOfTheUses(lastChangeDate);
		}

		public List<Project> GetNewProjects(DateTime lastChangeDate)
		{
			return ProjectManager.GetNewProjects(lastChangeDate);
		}

		public List<Region> GetNewRegions(DateTime lastChangeDate)
		{
			return RegionManager.GetNewRegions(lastChangeDate);
		}

		public List<Remont> GetNewRemonts(DateTime lastChangeDate)
		{
			return RemontManager.GetNewRemonts(lastChangeDate);
		}

		public List<RentedEstate> GetNewRentedEstates(DateTime lastChangeDate)
		{
			return EstateManager.GetNewRentedEstates(lastChangeDate);
		}

		public List<Roofing> GetNewRoofings(DateTime lastChangeDate)
		{
			return RoofingManager.GetNewRoofings(lastChangeDate);
		}

		public List<SelledEstate> GetNewSoldEstates(DateTime lastChangeDate)
		{
			return EstateManager.GetNewSoldEstates(lastChangeDate);
		}

		public List<State> GetNewStates(DateTime lastChangeDate)
		{
			return StateManager.GetNewStates(lastChangeDate);
		}

		public List<Street> GetNewStreets(DateTime lastChangeDate)
		{
			return StreetManager.GetNewStreets(lastChangeDate);
		}

		public List<User> GetNewUsers(DateTime lastChangeDate)
		{
			return UserManager.GetNewUsers(lastChangeDate);
		}

		public List<NeededEstate> GetNewDemands(DateTime lastChangeDate)
		{
			return DemandManager.GetNewDemands(lastChangeDate);
		}

		public List<Estate> GetNewEstates(DateTime lastChangeDate)
		{
			return EstateManager.GetNewEstates(lastChangeDate);
		}

		public List<EstatesAndDemand> GetNewEstateDemands(DateTime lastChangeDate)
		{
			return EstatesAndDemandManager.GetNewEstateDemands(lastChangeDate);
		}

		public List<Convenient> GetNewConvenients(DateTime lastChangeDate)
		{
			return ConvenientManager.GetNewConvenients(lastChangeDate);
		}
	}
}
