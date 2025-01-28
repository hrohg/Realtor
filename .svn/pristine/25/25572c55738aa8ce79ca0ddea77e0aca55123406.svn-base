using System;
using System.Collections.Generic;
using System.Linq;
using RealEstate.Common;
using RealEstate.DataAccess;

namespace RealEstate.Business.Managers
{
	public class RegionManager : DataManagerBase
	{
		public static List<Region> GetRegions(bool isOfflineMode)
		{
			return new DataClassesDataContext(GetConnectionString(isOfflineMode)).Regions.Where(s => (s.IsDeleted == null || s.IsDeleted == false)).ToList();
		}

		private static List<Region> GetRegions(int cityId, bool isOfflineMode)
		{
			try
			{
				DataClassesDataContext db = new DataClassesDataContext(GetConnectionString(isOfflineMode));
				return db.Regions.Where(s => s.CityID == cityId && (s.IsDeleted == null || s.IsDeleted == false)).ToList();
			}
			catch (Exception)
			{
				return null;
			}
		}

		public static List<Region> GetRegions(int cityId, User user, bool isOfflineMode)
		{
			var regions = GetRegions(cityId, isOfflineMode);
			if (user == null) return new List<Region>();
			if (user.IsAdminOrDirector) return regions;
			var regionIDs = user.BrokersRegions.Select(s => s.RegionID);
			return regions.Where(s => regionIDs.Contains(s.RegionID)).ToList();
		}

		public static bool DeleteRegion(Region region)
		{
			if (region == null) return false;
			region.IsDeleted = true;
			return UpdateRegion(region);
		}

		public static bool AddRegion(Region region)
		{
			if (region == null) return false;
			DataClassesDataContext db = new DataClassesDataContext();
			try
			{
				region.LastModifiedDate = DateTime.Now;
				db.Regions.InsertOnSubmit(region);
				db.SubmitChanges();
				if (!region.OriginalID.HasValue)
				{
					region.OriginalID = region.RegionID;
					db.SubmitChanges();
				}
				return true;
			}
			catch
			{
				return false;
			}
		}

		public static bool UpdateRegion(Region region)
		{
			if (region == null) return false;
			DataClassesDataContext db = new DataClassesDataContext();
			try
			{
				var regionInDB = db.Regions.FirstOrDefault(s => s.RegionID == region.RegionID);
				if (regionInDB == null) return false;

				CopyProperties(region, regionInDB);
				regionInDB.LastModifiedDate = DateTime.Now;
				db.SubmitChanges();
				return true;
			}
			catch
			{
				return false;
			}
		}

		private static void CopyProperties(Region region, Region regionInDB)
		{
			regionInDB.IsDeleted = region.IsDeleted;
			regionInDB.NameAm = region.NameAm;
			regionInDB.NameRu = region.NameRu;
			regionInDB.NameEn = region.NameEn;
			regionInDB.NameCz = region.NameCz;
			regionInDB.NameKz = region.NameKz;
			regionInDB.CityID = region.CityID;
			regionInDB.SortIndex = region.SortIndex;
		}

		public static DateTime GetLastChangeDate()
		{
			using (var db = new DataClassesDataContext(LocalConnectionString))
			{
				var item = db.Regions.OrderByDescending(s => s.LastModifiedDate).FirstOrDefault();
				if (item == null) return DateTime.MinValue;
				return item.LastModifiedDate ?? DateTime.MinValue;
			}
		}

		public static List<Region> GetNewRegions(DateTime lastChangeDate)
		{
			if (lastChangeDate < Constants.SQLAcceptedMinDateValue)
			{
				lastChangeDate = Constants.SQLAcceptedMinDateValue;
			}
			using (var db = new DataClassesDataContext())
			{
				return db.Regions.Where(s => s.LastModifiedDate > lastChangeDate).ToList();
			}
		}

		public static void SynchronizeRegions(List<Region> regions)
		{
			if (regions == null || regions.Count == 0) return;

			using (var db = new DataClassesDataContext(LocalConnectionString))
			{
				foreach (var item in regions)
				{
					var itemInDB = db.Regions.FirstOrDefault(s => s.OriginalID == item.RegionID);
					if (itemInDB == null)
					{
						item.OriginalID = item.RegionID;
						db.Regions.InsertOnSubmit(item);
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
