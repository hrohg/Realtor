using System;
using System.Collections.Generic;
using System.Linq;
using RealEstate.Common;
using RealEstate.DataAccess;

namespace RealEstate.Business.Managers
{
	public class StreetManager : DataManagerBase
	{
		public static List<Street> GetStreets(Region region, bool isOfflineMode)
		{
			if (region == null || region.RegionID == 0) return null;

			DataClassesDataContext db = new DataClassesDataContext(GetConnectionString(isOfflineMode));
			return db.Streets.Where(s => s.RegionID == region.RegionID && (s.IsDeleted == null || s.IsDeleted == false)).OrderBy(s => s.NameAm).ToList();
		}

		public static List<Street> GetStreets(bool isOfflineMode)
		{
			return new DataClassesDataContext(GetConnectionString(isOfflineMode)).Streets.Where(s => s.IsDeleted == null || s.IsDeleted == false).OrderBy(s => s.NameAm).ToList();
		}

		public static bool DeleteStreet(Street street)
		{
			if (street == null) return false;
			street.IsDeleted = true;
			return UpdateStreet(street);
		}

		public static bool UpdateStreet(Street street)
		{
			if (street == null) return false;
			DataClassesDataContext db = new DataClassesDataContext();
			try
			{
				var streetInDB = db.Streets.FirstOrDefault(s => s.StreetID == street.StreetID);
				if (streetInDB == null) return false;

				CopyProperties(street, streetInDB);
				streetInDB.LastModifiedDate = DateTime.Now;
				db.SubmitChanges();
				return true;
			}
			catch
			{
				return false;
			}
		}

		public static void CopyProperties(Street street, Street streetInDB)
		{
			streetInDB.IsDeleted = street.IsDeleted;
			streetInDB.NameAm = street.NameAm;
			streetInDB.NameRu = street.NameRu;
			streetInDB.NameEn = street.NameEn;
			streetInDB.NameKz = street.NameKz;
			streetInDB.NameCz = street.NameCz;
			streetInDB.RegionID = street.RegionID;
		}

		public static bool AddStreet(Street street)
		{
			if (street == null) return false;
			DataClassesDataContext db = new DataClassesDataContext();
			try
			{
				street.LastModifiedDate = DateTime.Now;
				db.Streets.InsertOnSubmit(street);
				db.SubmitChanges();
				if (!street.OriginalID.HasValue)
				{
					street.OriginalID = street.StreetID;
					db.SubmitChanges();
				}
				return true;
			}
			catch
			{
				return false;
			}
		}

		public static DateTime GetLastChangeDate()
		{
			using (var db = new DataClassesDataContext(LocalConnectionString))
			{
				var item = db.Streets.OrderByDescending(s => s.LastModifiedDate).FirstOrDefault();
				if (item == null) return DateTime.MinValue;
				return item.LastModifiedDate ?? DateTime.MinValue;
			}
		}

		public static List<Street> GetNewStreets(DateTime lastChangeDate)
		{
			if (lastChangeDate < Constants.SQLAcceptedMinDateValue)
			{
				lastChangeDate = Constants.SQLAcceptedMinDateValue;
			}
			using (var db = new DataClassesDataContext())
			{
				return db.Streets.Where(s => s.LastModifiedDate > lastChangeDate).ToList();
			}
		}

		public static void SynchronizeStreets(List<Street> streets)
		{
			if (streets == null || streets.Count == 0) return;

			using (var db = new DataClassesDataContext(LocalConnectionString))
			{
				foreach (var item in streets)
				{
					var itemInDB = db.Streets.FirstOrDefault(s => s.OriginalID == item.StreetID);
					if (itemInDB == null)
					{
						item.OriginalID = item.StreetID;
						db.Streets.InsertOnSubmit(item);
					}
					else
					{
						CopyProperties(item, itemInDB);
						itemInDB.LastModifiedDate = item.LastModifiedDate;
					}
					db.SubmitChanges();
				}
			}
		}
	}
}
