using System;
using System.Collections.Generic;
using System.Linq;
using RealEstate.Common;
using RealEstate.DataAccess;

namespace RealEstate.Business.Managers
{
	public class RemontManager : DataManagerBase
	{
		public static List<Remont> GetRemonts(bool isOfflineMode)
		{
			return new DataClassesDataContext(GetConnectionString(isOfflineMode)).Remonts.Where(s => s.IsDeleted == null || s.IsDeleted == false).ToList();
		}

		public static bool UpdateRemont(Remont remont)
		{
			if (remont == null) return false;
			DataClassesDataContext db = new DataClassesDataContext();
			try
			{
				Remont remontInDB = db.Remonts.FirstOrDefault(s => s.RemontID == remont.RemontID);
				if (remontInDB == null) return false;

				CopyProperties(remont, remontInDB);
				remontInDB.LastModifiedDate = DateTime.Now;
				db.SubmitChanges();
				return true;
			}
			catch (Exception)
			{
				return false;
			}
		}

		private static void CopyProperties(Remont remont, Remont remontInDB)
		{
			remontInDB.IsDeleted = remont.IsDeleted;
			remontInDB.NameAm = remont.NameAm;
			remontInDB.NameRu = remont.NameRu;
			remontInDB.NameEn = remont.NameEn;
			remontInDB.NameKz = remont.NameKz;
			remontInDB.NameCz = remont.NameCz;
			remontInDB.SortIndex = remont.SortIndex;
		}

		public static bool AddRemont(Remont remont)
		{
			if (remont == null) return false;
			DataClassesDataContext db = new DataClassesDataContext();
			try
			{
				remont.LastModifiedDate = DateTime.Now;
				db.Remonts.InsertOnSubmit(remont);
				db.SubmitChanges();
				if (!remont.OriginalID.HasValue)
				{
					remont.OriginalID = remont.RemontID;
					db.SubmitChanges();
				}
				return true;
			}
			catch (Exception)
			{
				return false;
			}
		}

		public static bool DeleteRemont(Remont remont)
		{
			if (remont == null) return false;
			remont.IsDeleted = true;
			return UpdateRemont(remont);
		}

		public static DateTime GetLastChangeDate()
		{
			using (var db = new DataClassesDataContext(LocalConnectionString))
			{
				var item = db.Remonts.OrderByDescending(s => s.LastModifiedDate).FirstOrDefault();
				if (item == null) return DateTime.MinValue;
				return item.LastModifiedDate ?? DateTime.MinValue;
			}
		}

		public static List<Remont> GetNewRemonts(DateTime lastChangeDate)
		{
			if (lastChangeDate < Constants.SQLAcceptedMinDateValue)
			{
				lastChangeDate = Constants.SQLAcceptedMinDateValue;
			}
			using (var db = new DataClassesDataContext())
			{
				return db.Remonts.Where(s => s.LastModifiedDate > lastChangeDate).ToList();
			}
		}

		public static void SynchronizeRemonts(List<Remont> remonts)
		{
			if (remonts == null || remonts.Count == 0) return;

			using (var db = new DataClassesDataContext(LocalConnectionString))
			{
				foreach (var item in remonts)
				{
					var itemInDB = db.Remonts.FirstOrDefault(s => s.OriginalID == item.RemontID);
					if (itemInDB == null)
					{
						item.OriginalID = item.RemontID;
						db.Remonts.InsertOnSubmit(item);
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
