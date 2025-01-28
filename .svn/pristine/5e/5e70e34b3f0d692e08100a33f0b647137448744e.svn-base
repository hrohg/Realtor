using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using RealEstate.Business.Managers;
using RealEstate.DataAccess;
using Realtor.Synchronize.Service.Facade;

namespace Shared.Helpers
{
	public class DataUpdateHelper
	{
		public static void UpdataDatabaseRecords()
		{
			var lastChangeDate = BlackListManager.GetLastChangeDate();
			List<BlackListItem> blackListItems = ServiceExecutionContext<IDataUpdateServiceHost>.Execute(s => s.GetNewBlackListItems(lastChangeDate));
			BlackListManager.SynchronizeBlackListItems(blackListItems);

			lastChangeDate = BuildingTypeManager.GetLastChangeDate();
			List<BuildingType> buildingTypes = ServiceExecutionContext<IDataUpdateServiceHost>.Execute(s => s.GetNewBuildingTypes(lastChangeDate));
			BuildingTypeManager.SynchronizeBuildingTypes(buildingTypes);

			lastChangeDate = CityManager.GetLastChangeDate();
			List<City> cities = ServiceExecutionContext<IDataUpdateServiceHost>.Execute(s => s.GetNewCities(lastChangeDate));
			CityManager.SynchronizeCities(cities);

			lastChangeDate = CurrencyManager.GetLastChangeDate();
			List<Currency> currencies = ServiceExecutionContext<IDataUpdateServiceHost>.Execute(s => s.GetNewCurrencies(lastChangeDate));
			CurrencyManager.SynchronizeCurrencies(currencies);

			//lastChangeDate = OperationalSignificanceManager.GetLastChangeDate();
			//List<OperationalSignificance> operationalSignificances = ServiceExecutionContext<IDataUpdateServiceHost>.Execute(s => s.GetNewOperationalSignificances(lastChangeDate));
			//OperationalSignificanceManager.SynchronizeOperationalSignificances(operationalSignificances);

			//lastChangeDate = OperationalSignificanceManager.GetSignificanceOfTheUsesLastChangeDate();
			//List<SignificanceOfTheUse> significanceOfTheUses = ServiceExecutionContext<IDataUpdateServiceHost>.Execute(s => s.GetNewSignificanceOfTheUses(lastChangeDate));
			//OperationalSignificanceManager.SynchronizeSignificanceOfTheUses(significanceOfTheUses);

			lastChangeDate = ProjectManager.GetLastChangeDate();
			List<Project> projects = ServiceExecutionContext<IDataUpdateServiceHost>.Execute(s => s.GetNewProjects(lastChangeDate));
			ProjectManager.SynchronizeProjects(projects);
			
			lastChangeDate = RemontManager.GetLastChangeDate();
			List<Remont> remonts = ServiceExecutionContext<IDataUpdateServiceHost>.Execute(s => s.GetNewRemonts(lastChangeDate));
			RemontManager.SynchronizeRemonts(remonts);
			
			lastChangeDate = RoofingManager.GetLastChangeDate();
			List<Roofing> roofings = ServiceExecutionContext<IDataUpdateServiceHost>.Execute(s => s.GetNewRoofings(lastChangeDate));
			RoofingManager.SynchronizeRoofings(roofings);
			
			lastChangeDate = StateManager.GetLastChangeDate();
			List<State> states = ServiceExecutionContext<IDataUpdateServiceHost>.Execute(s => s.GetNewStates(lastChangeDate));
			StateManager.SynchronizeStates(states);
			
			lastChangeDate = StreetManager.GetLastChangeDate();
			List<Street> streets = ServiceExecutionContext<IDataUpdateServiceHost>.Execute(s => s.GetNewStreets(lastChangeDate));
			StreetManager.SynchronizeStreets(streets);

			lastChangeDate = UserManager.GetLastChangeDate();
			List<User> users = ServiceExecutionContext<IDataUpdateServiceHost>.Execute(s => s.GetNewUsers(lastChangeDate));
			UserManager.SynchronizeUsers(users);

			lastChangeDate = DemandManager.GetLastChangeDate();
			List<NeededEstate> demands = ServiceExecutionContext<IDataUpdateServiceHost>.Execute(s => s.GetNewDemands(lastChangeDate));
			DemandManager.SynchronizeDemands(demands);

			lastChangeDate = EstateManager.GetLastChangeDate();
			List<Estate> estates = ServiceExecutionContext<IDataUpdateServiceHost>.Execute(s => s.GetNewEstates(lastChangeDate));
			EstateManager.SynchronizeEstates(estates);

			lastChangeDate = EstateManager.GetRentLastChangeDate();
			List<RentedEstate> rentedEstates = ServiceExecutionContext<IDataUpdateServiceHost>.Execute(s => s.GetNewRentedEstates(lastChangeDate));
			EstateManager.SynchronizeRentedEstates(rentedEstates);

			lastChangeDate = EstateManager.GetSoldEstatesLastChangeDate();
			List<SelledEstate> soldEstates = ServiceExecutionContext<IDataUpdateServiceHost>.Execute(s => s.GetNewSoldEstates(lastChangeDate));
			EstateManager.SynchronizeSoldEstates(soldEstates);
			
			lastChangeDate = EstatesAndDemandManager.GetLastChangeDate();
			List<EstatesAndDemand> estateAndDemands = ServiceExecutionContext<IDataUpdateServiceHost>.Execute(s => s.GetNewEstateDemands(lastChangeDate));
			EstatesAndDemandManager.SynchronizeEstateAndDemands(estateAndDemands);
		}
	}
}
