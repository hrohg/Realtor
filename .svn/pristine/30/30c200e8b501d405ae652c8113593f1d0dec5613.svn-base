using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using RealEstate.Common;
using RealEstate.DataAccess;
using RealEstate.DataAccess.SearchCriteria;

namespace RealEstate.Business.Managers
{
	public class StatisticsManager: DataManagerBase
	{
		public static ReportData GetBrokerReportData(StatisticSearchCriteria criteria, bool isOfflineMode)
		{
			if (criteria == null || !criteria.BrokerID.HasValue) return new ReportData();

		    var endDate = criteria.EndDate.AddDays(1);
			DataClassesDataContext db = new DataClassesDataContext(GetConnectionString(isOfflineMode));
			var broker = db.Users.Single(s => s.ID == criteria.BrokerID);
			ReportData data = new ReportData();
            data.AddedDemandsCount = broker.NeededEstates.Count(s => s.AddDate >= criteria.StartDate.Date && s.AddDate < endDate.Date);
            data.AddedEstatesCount = broker.Estates.Count(s => s.AddDate >= criteria.StartDate.Date && s.AddDate < endDate.Date);
            data.AddedEstatesCount += broker.Estates.Count(s => s.ChangeToBrokerDate >= criteria.StartDate.Date && s.ChangeToBrokerDate < endDate.Date && s.AddDate < criteria.StartDate.Date);
			data.DemandsCount = broker.NeededEstates.Count;
			data.EstatesCount = broker.Estates.Count;
            data.RentedEstatesCount = broker.RentedEstates.Count(s => s.StartDate >= criteria.StartDate && s.StartDate < endDate.Date);
            data.SoldEstatesCount = broker.SelledEstates.Count(s => s.SellDate >= criteria.StartDate.Date && s.SellDate < endDate.Date);
            data.UpdatedDemandsCount = broker.NeededEstates.Count(s => s.LastModifiedDate >= criteria.StartDate.Date && s.LastModifiedDate < endDate.Date);
            data.UpdatedEstatesCount = broker.Estates.Count(s => s.LastModifiedDate >= criteria.StartDate.Date && s.LastModifiedDate < endDate.Date);
			data.ShowedClientsCount = broker.EstatesAndDemands.Select(s => s.NeededEstate).Count();
			data.ShowedEstatesCount = broker.EstatesAndDemands.Select(s => s.Estate).Count();
			data.BrokerName = broker.FullName;
			return data;
		}

		public static ReportData GetAgencyReportData(StatisticSearchCriteria criteria, bool isOfflineMode)
		{
			DataClassesDataContext db = new DataClassesDataContext(GetConnectionString(isOfflineMode));
			var data = new ReportData();
			data.AddedDemandsCount = db.NeededEstates.Count(s => s.AddDate >= criteria.StartDate.Date && s.AddDate <= criteria.EndDate.Date);
			data.AddedEstatesCount = db.Estates.Count(s => s.AddDate >= criteria.StartDate.Date && s.AddDate <= criteria.EndDate.Date);
			data.DemandsCount = db.NeededEstates.Count();
			data.EstatesCount = db.Estates.Count();
			data.RentedEstatesCount = db.RentedEstates.Count(s => s.StartDate >= criteria.StartDate && s.StartDate <= criteria.EndDate);
			data.SoldEstatesCount = db.SelledEstates.Count(s => s.SellDate >= criteria.StartDate.Date && s.SellDate <= criteria.EndDate.Date);
			data.UpdatedDemandsCount = db.NeededEstates.Count(s => s.LastModifiedDate >= criteria.StartDate.Date && s.LastModifiedDate <= criteria.EndDate.Date);
			data.UpdatedEstatesCount = db.Estates.Count(s => s.LastModifiedDate >= criteria.StartDate.Date && s.LastModifiedDate <= criteria.EndDate.Date);
			data.ShowedClientsCount = db.EstatesAndDemands.Select(s => s.NeededEstate).Distinct().Count();
			data.ShowedEstatesCount = db.EstatesAndDemands.Select(s => s.Estate).Distinct().Count();
			
			return data;
		}

		public static DateTime GetFirstAddedObjectDate(bool isOfflineMode)
		{
			DataClassesDataContext db = new DataClassesDataContext(GetConnectionString(isOfflineMode));
			var firstEstate = db.Estates.OrderBy(s => s.AddDate).FirstOrDefault();
			var date = DateTime.Now.Date;
			if (firstEstate != null)
			{
				date = firstEstate.AddDate.GetValueOrDefault(DateTime.Now).Date;
			}
			var firstDemand = db.NeededEstates.OrderBy(s => s.AddDate).FirstOrDefault();
			if (firstDemand != null)
			{
				if (date.Date > firstDemand.AddDate.GetValueOrDefault(DateTime.Now).Date)
				{
					date = firstDemand.AddDate.GetValueOrDefault(DateTime.Now).Date;
				}
			}
			return date;
		}

		public static List<ReportData> GetReportByBrokers(StatisticSearchCriteria criteria, bool isOfflineMode)
		{
			var db = new DataClassesDataContext(GetConnectionString(isOfflineMode));
			var users = UserManager.GetUsers(isOfflineMode);
			List<ReportData> list = new List<ReportData>();
			
			foreach (User user in users)
			{
				criteria.BrokerID = user.ID;
				list.Add(GetBrokerReportData(criteria, isOfflineMode));
			}

			ReportData data = new ReportData();
			data.AddedDemandsCount = db.NeededEstates.Count(s => s.AddDate >= criteria.StartDate.Date && s.AddDate <= criteria.EndDate.Date && s.BrokerID == null);
			data.AddedEstatesCount = db.Estates.Count(s => s.AddDate >= criteria.StartDate.Date && s.AddDate <= criteria.EndDate.Date && s.BrokerID == null);
			data.DemandsCount = db.NeededEstates.Count(s => s.BrokerID == null);
			data.EstatesCount = db.Estates.Count(s=> s.BrokerID == null);
			data.RentedEstatesCount = db.RentedEstates.Count(s => s.StartDate >= criteria.StartDate && s.StartDate <= criteria.EndDate && s.BrokerID == null);
			data.SoldEstatesCount = db.SelledEstates.Count(s => s.SellDate >= criteria.StartDate.Date && s.SellDate <= criteria.EndDate.Date && s.BrokerID == null);
			data.UpdatedDemandsCount = db.NeededEstates.Count(s => s.LastModifiedDate >= criteria.StartDate.Date && s.LastModifiedDate <= criteria.EndDate.Date && s.BrokerID == null);
			data.UpdatedEstatesCount = db.Estates.Count(s => s.LastModifiedDate >= criteria.StartDate.Date && s.LastModifiedDate <= criteria.EndDate.Date && s.BrokerID == null);
			data.ShowedClientsCount = db.EstatesAndDemands.Where(s => s.BrokerID == null).Select(s => s.NeededEstate).Count();
			data.ShowedEstatesCount = db.EstatesAndDemands.Where(s => s.BrokerID == null).Select(s => s.Estate).Count();
			data.BrokerName = "----------------------";
			list.Add(data);
			
			return list;
		}
	}
}
