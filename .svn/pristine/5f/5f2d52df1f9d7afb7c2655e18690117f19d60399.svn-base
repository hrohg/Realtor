using System;
using System.Collections.Generic;
using System.Linq;
using RealEstate.Common;
using RealEstate.DataAccess;

namespace RealEstate.Business.Managers
{
	public class ConvenientManager: DataManagerBase
	{
		public static bool DeleteConvenient(Convenient convenient)
		{
			if (convenient == null) return false;
			convenient.IsDeleted = true;
			convenient.LastModifiedDate = DateTime.Now;
			return UpdateConvenient(convenient);
		}

		public static bool UpdateConvenient(Convenient convenient)
		{
			if (convenient == null) return false;
			try
			{
				DataClassesDataContext db = new DataClassesDataContext();
				Convenient convenientInDB = db.Convenients.FirstOrDefault(s => s.ID == convenient.ID);
				if (convenientInDB == null) return false;
				CopyProperites(convenient, convenientInDB);
				convenientInDB.LastModifiedDate = DateTime.Now;
				db.SubmitChanges();
				return true;
			}
			catch
			{
				return false;
			}
		}

		private static void CopyProperites(Convenient convenient, Convenient convenientInDb)
		{
			convenientInDb.IsDeleted = convenient.IsDeleted;
			convenientInDb.LastModifiedDate = convenient.LastModifiedDate;
			convenientInDb.NameAm = convenient.NameAm;
			convenientInDb.NameEn = convenient.NameEn;
			convenientInDb.NameRu = convenient.NameRu;
			convenientInDb.NameCz = convenient.NameCz;
			convenientInDb.NameKz = convenient.NameKz;
			convenientInDb.OriginalID = convenient.OriginalID;
		}

		public static bool AddConvenient(Convenient convenient)
		{
			if (convenient == null) return false;
			DataClassesDataContext db = new DataClassesDataContext();
			try
			{
				convenient.LastModifiedDate = DateTime.Now;
				db.Convenients.InsertOnSubmit(convenient);
				db.SubmitChanges();
				if (!convenient.OriginalID.HasValue)
				{
					convenient.OriginalID = convenient.ID;
					db.SubmitChanges();
				}

				return true;
			}
			catch
			{
				return false;
			}
		}

		public static List<Convenient> GetNewConvenients(DateTime lastChangeDate)
		{
			using (var db = new DataClassesDataContext())
			{

				if (lastChangeDate < Constants.SQLAcceptedMinDateValue)
				{
					lastChangeDate = Constants.SQLAcceptedMinDateValue;
				}
				return db.Convenients.Where(s => s.LastModifiedDate > lastChangeDate).ToList();
			}
		}

		public static void SynchronizeConvenients(List<Convenient> convs)
		{
			if (convs == null || convs.Count == 0) return;

			using (var db = new DataClassesDataContext(LocalConnectionString))
			{
				foreach (var conv in convs)
				{
					var itemInDB = db.Convenients.FirstOrDefault(s => s.OriginalID == conv.ID);
					if (itemInDB == null)
					{
						conv.OriginalID = conv.ID;
						db.Convenients.InsertOnSubmit(conv);
					}
					else
					{
						CopyProperites(conv, itemInDB);
						itemInDB.LastModifiedDate = conv.LastModifiedDate;
						itemInDB.OriginalID = conv.ID;
					}
					db.SubmitChanges();
				}
			}
		}

		public static DateTime GetLastChangeDate()
		{
			using (var db = new DataClassesDataContext(LocalConnectionString))
			{
				var item = db.Convenients.OrderByDescending(s => s.LastModifiedDate).FirstOrDefault();
				if (item == null) return DateTime.MinValue;
				return item.LastModifiedDate ?? DateTime.MinValue;
			}
		}
	}
}
