using System;
using System.Collections.Generic;
using System.Linq;
using RealEstate.Common;
using RealEstate.DataAccess;

namespace RealEstate.Business.Managers
{
	public class RoofingManager : DataManagerBase
	{
		public static List<Roofing> GetRoofings(bool isOfflineMode)
		{
			return new DataClassesDataContext(GetConnectionString(isOfflineMode)).Roofings.Where(s => s.IsDeleted == null || s.IsDeleted == false).ToList();
		}

		public static bool DeleteRoofing(Roofing roofing)
		{
			if (roofing == null) return false;
			roofing.IsDeleted = true;
			return UpdateRoofing(roofing);
		}

		public static bool UpdateRoofing(Roofing roofing)
		{
			if (roofing == null) return false;

			try
			{
				DataClassesDataContext db = new DataClassesDataContext();
				var roofingInDB = db.Roofings.First(s => s.ID == roofing.ID);
				CopyProperties(roofing, roofingInDB);
				roofingInDB.LastModifiedDate = DateTime.Now;
				db.SubmitChanges();
				return true;
			}
			catch (Exception)
			{
				return false;
			}
		}

		private static void CopyProperties(Roofing roofing, Roofing roofingInDB)
		{
			roofingInDB.NameAm = roofing.NameAm;
			roofingInDB.NameRu = roofing.NameRu;
			roofingInDB.NameEn = roofing.NameEn;
			roofingInDB.NameKz = roofing.NameKz;
			roofingInDB.NameCz = roofing.NameCz;
			roofingInDB.IsDeleted = roofing.IsDeleted;
		}

		public static bool AddRoofing(Roofing roofing)
		{
			if (roofing == null) return false;
			DataClassesDataContext db = new DataClassesDataContext();
			try
			{
				roofing.LastModifiedDate = DateTime.Now;
				db.Roofings.InsertOnSubmit(roofing);
				db.SubmitChanges();
				if (!roofing.OriginalID.HasValue)
				{
					roofing.OriginalID = roofing.ID;
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
				var item = db.Roofings.OrderByDescending(s => s.LastModifiedDate).FirstOrDefault();
				if (item == null) return DateTime.MinValue;
				return item.LastModifiedDate ?? DateTime.MinValue;
			}
		}

		public static List<Roofing> GetNewRoofings(DateTime lastChangeDate)
		{
			if (lastChangeDate < Constants.SQLAcceptedMinDateValue)
			{
				lastChangeDate = Constants.SQLAcceptedMinDateValue;
			}
			using (var db = new DataClassesDataContext())
			{
				return db.Roofings.Where(s => s.LastModifiedDate > lastChangeDate).ToList();
			}
		}

		public static void SynchronizeRoofings(List<Roofing> roofings)
		{
			if (roofings == null || roofings.Count == 0) return;

			using (var db = new DataClassesDataContext(LocalConnectionString))
			{
				foreach (var item in roofings)
				{
					var itemInDB = db.Roofings.FirstOrDefault(s => s.OriginalID == item.ID);
					if (itemInDB == null)
					{
						item.OriginalID = item.ID;
						db.Roofings.InsertOnSubmit(item);
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
