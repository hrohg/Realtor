using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using RealEstate.DataAccess;

namespace RealEstate.Business.Managers
{
	public class RealtorSettingsManager : DataManagerBase
	{
		public static RealtorSetting GetSettings(bool isOfflineMode = false)
		{
			string connectionString = GetConnectionString(isOfflineMode);
			return new DataClassesDataContext(connectionString).RealtorSettings.FirstOrDefault();
		}

		public static bool SaveSettings(RealtorSetting settingsData)
		{
			DataClassesDataContext db = new DataClassesDataContext();
			try
			{
				var settings = db.RealtorSettings.FirstOrDefault();
				if (settings == null)
				{
					settings = new RealtorSetting();
					db.RealtorSettings.InsertOnSubmit(settings);
				}
				settings.AllowBrokersToAddData = settingsData.AllowBrokersToAddData;
				settings.DaysBeforeToRentClose = settingsData.DaysBeforeToRentClose;
				settings.RatingFrom = settingsData.RatingFrom;
				settings.RatingTo = settingsData.RatingTo;
				settings.ShowOpenAddressToBrokers = settingsData.ShowOpenAddressToBrokers;
				settings.AllowBrokersToPrintEstates = settingsData.AllowBrokersToPrintEstates;
				db.SubmitChanges();
				return true;
			}
			catch (Exception)
			{
				return false;
			}
		}

		public static List<UserDisplayColumn> GetDisplayColumns(User user, bool isOfflineMode)
		{
			if (user.ID == 0) return new List<UserDisplayColumn>();
			string connectionString = GetConnectionString(isOfflineMode);
			using (var db = new DataClassesDataContext(connectionString))
			{
				var columns = db.UserDisplayColumns.Where(s => s.UserID == user.ID).OrderBy(s => s.OrderIndex).ToList();
				if (columns.Count != 25)
				{
					columns = UserDisplayColumn.GetEmptyDisplayColumns();
					var userInDB = db.Users.Single(s => s.ID == user.ID);
					foreach (UserDisplayColumn col in columns)
					{
						col.User = userInDB;
					}
					db.UserDisplayColumns.InsertAllOnSubmit(columns);
					db.SubmitChanges();
				}
				columns.ForEach(s => s.IdName = s.ColumnName);
				return columns;
			}
		}

		public static void SaveDisplayColumns(ObservableCollection<UserDisplayColumn> displayColumns, bool isOfflineMode = false)
		{
			string connectionString = GetConnectionString(isOfflineMode);
			using (DataClassesDataContext db = new DataClassesDataContext(connectionString))
			{
				foreach (UserDisplayColumn column in displayColumns)
				{
					var columnInDB = db.UserDisplayColumns.Single(s => s.ID == column.ID);
					columnInDB.Show = column.Show;
					columnInDB.OrderIndex = column.OrderIndex;
					db.SubmitChanges();
				}
			}
		}
	}
}
